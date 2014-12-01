#version 3.7;
global_settings { assumed_gamma 1.2 } 

#include "colors.inc"
#include "stones.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"

camera {
   location <10, 10, -10>
   angle 45 // direction <0, 0,  1.7>
   right x*image_width/image_height
   look_at <0,0,0>
}

// Uncomment the area lights only if you've got lots of time.
#declare Dist=80.0;
 light_source {< -50, 25, -50> color White
     fade_distance Dist fade_power 2
}      
/*
light_source {< 50, 10,  -4> color Gray30
     fade_distance Dist fade_power 2
}
light_source {< 0, 100,  0> color Gray30
     fade_distance Dist fade_power 2
} 
*/
/*
          
sky_sphere {
    pigment {
        gradient y
        color_map {
            [0, 1  color Gray50 color Gray80]
        }
    }
}
  */     
#declare wire1 = merge{
    cylinder {
	    <1.7, -0.8, -2.3>,
	    <2.1, -0.8, -2.3>,
	    0.8
	    texture {
	      pigment {
	        color Black
	      }
	      finish { Shiny } // pre-defined in finish.inc
	    }
    }    
    cylinder {
	    <1.71, -0.8, -2.3>,
	    <2.11, -0.8, -2.3>,
	    0.5
	    texture {
	      pigment {
	        color White
	      }
	      finish { Shiny } // pre-defined in finish.inc
	    }
    }
}

#declare wire2 = merge{
    cylinder {
	    <1.7, -0.8, 2.3>,
	    <2.1, -0.8, 2.3>,
	    0.8
	    texture {
	      pigment {
	        color Black
	      }
	      finish { Shiny } // pre-defined in finish.inc
	    }
    }    
    cylinder {
	    <1.71, -0.8, 2.3>,
	    <2.11, -0.8, 2.3>,
	    0.5
	    texture {
	      pigment {
	        color White
	      }
	      finish { Shiny } // pre-defined in finish.inc
	    }
    }
}

#declare wire3 = merge{
    cylinder {
	    <-1.7, -0.8, -2.3>,
	    <-2.1, -0.8, -2.3>,
	    0.8
	    texture {
	      pigment {
	        color Black
	      }
	      finish { Shiny } // pre-defined in finish.inc
	    }
    }    
    cylinder {
	    <-1.71, -0.8, -2.3>,
	    <-2.11, -0.8, -2.3>,
	    0.5
	    texture {
	      pigment {
	        color White
	      }
	      finish { Shiny } // pre-defined in finish.inc
	    }
    }
}

#declare wire4 = merge{
    cylinder {
	    <-1.7, -0.8, 2.3>,
	    <-2.1, -0.8, 2.3>,
	    0.8
	    texture {
	      pigment {
	        color Black
	      }
	      finish { Shiny } // pre-defined in finish.inc
	    }
    }    
    cylinder {
	    <-1.71, -0.8, 2.3>,
	    <-2.11, -0.8, 2.3>,
	    0.5
	    texture {
	      pigment {
	        color White
	      }
	      finish { Shiny } // pre-defined in finish.inc
	    }
    }
}

#declare wire_pum =
union{
	cylinder {
		<-0.75, -1, 1.2>,
		<0.75, -1, 1.2>,
		0.1
		texture {
	      pigment {
	        color White
	      }
	      finish { Shiny } // pre-defined in finish.inc
	    }
	}
	cylinder {
		<-0.75, -1, -1.2>,
		<0.75, -1, -1.2>,
		0.1
		texture {
	      pigment {
	        color White
	      }
	      finish { Shiny } // pre-defined in finish.inc
	    }
	}
}         

#declare wires =
union{
    object { wire_pum }
    object { wire1 }
    object { wire2 }
    object { wire3 }
    object { wire4 }
}

#declare carBody =
union{
box{ 
    <2, 0.6, 4.1>,
    <-2, -0.6, -4.1>
    texture {
	      pigment {
	        color Cyan
	      }
	      finish { Shiny } // pre-defined in finish.inc
	}
}

difference{               
box{            
    <2, 2.3, 2>,
    <-2, 0.6, -2>  
    texture {
	      pigment {
	        color Cyan
	      }
	      finish { Shiny } // pre-defined in finish.inc
	}
}
box{            
    <2.1, 2.7, -2>,
    <-2.1, -2, -4>
    rotate x*30 
    texture {
	      pigment {
	        color White
	      }
	      finish { Shiny } // pre-defined in finish.inc
	}
 }
box{            
    <3, 2.6, 2.1>,
    <1.8, 0, -2.1>
    rotate z*20
    translate x*0.3 
    texture {
	      pigment {
	        color White
	      }
	      finish { Shiny } // pre-defined in finish.inc
	}
}  
box{            
    <-3, 2.6, 2.1>,
    <-1.8, 0, -2.1>
    rotate z*-20
    translate x*-0.3 
    texture {
	      pigment {
	        color White
	      }
	      finish { Shiny } // pre-defined in finish.inc
	}
}
}
} 
    
#declare Floor =
plane { <0, 1, 0>, -1.6
    texture{
        T_Stone22
    }
}         

#declare Light =
union{
box{
    <0, 0, 0>
    <0.5, 0.5, 0.8>
    rotate x*30
    translate <1.3,0.4,-3.9>  
    texture {
	      pigment {
	        color White
	      }
	      finish { Shiny } // pre-defined in finish.inc
	}
}
box{
    <0, 0, 0>
    <0.5, 0.5, 0.8>
    rotate x*30
    translate <-1.55,0.4,-3.9>  
    texture {
	      pigment {
	        color White
	      }
	      finish { Shiny } // pre-defined in finish.inc
	}
}   
}    

union{
object { Floor }
object { carBody } 
object { wires }
object { Light }
}
