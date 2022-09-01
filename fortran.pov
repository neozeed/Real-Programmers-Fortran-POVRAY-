// POV-Ray Scene with cards, source code and a corona bottle
// by Kurt Bangert
// http://www.travelnotes.de
global_settings { max_trace_level 100 }
#declare r1 = seed(5);

#include "colors.inc"
#include "textures.inc" 
#include "corona.inc"  

camera {location <0,21,-16>      
look_at <0,14.9,5> angle 60}  

light_source { <-15, 35, 70> color rgb <1,1,0.9>*.9 fade_distance 70 fade_power 2 } 
light_source { <-10, 40,-10> color rgb <1,1,0.9> fade_distance 50 fade_power 2 }

#declare table = object{box { <-90,-1,0><90,0,60> pigment {White}}}
#declare wall = object{box { <-90,-100,120><90,150,125> pigment {White}}}

#declare hole30=difference{
box{<-1,0,0><0,30,.02>}  
#declare i=0; 
 #while (i<30) 
  object {cylinder {<-.5,i,-1><-.5,i,1> .3}}
 #declare i=i+1;
#end     
texture{pigment{
        gradient y  color_map {[0.0 color rgb <.8,1,.8>] 
                               [0.5 color rgb <.8,1,.8> ]
                               [0.5 color rgb <1,1,1> ]
                               [1.0 color rgb <1,1,1> ] }}scale 2 normal {wrinkles .1}}
}

#declare hole45=difference{
box{<-1,0,0><0,45,.02>}  
#declare i=0; 
 #while (i<45) 
  object {cylinder {<-.5,i,-1><-.5,i,1> .3}}
 #declare i=i+1;
#end     
texture{pigment{
        gradient y  color_map {[0.0 color rgb <.8,1,.8>] 
                               [0.5 color rgb <.8,1,.8> ]
                               [0.5 color rgb <1,1,1> ]
                               [1.0 color rgb <1,1,1> ] }}scale 2 normal {wrinkles .1}}
}                                                              

#declare page0= object{
box{<0,0,0><32,32,.02>}

texture{pigment{
        gradient y  color_map {[0.0 color rgb <.8,1,.8>] 
                               [0.45 color rgb <.7,1,.7> ]
                               [0.5 color rgb <.6,.9,.6> ]
                               [0.55 color rgb <1,1,1> ]
                               [1.0 color rgb <1,1,1> ] }scale 2} }
        texture{ pigment{ image_map {
                gif "source.gif"  interpolate 2 map_type 0  
        transmit 255,1 }
    scale <52,50,1> translate <-2,0,0>  } }}  
    
#declare printout=union{
object{page0}
object{hole30}
object{hole30 translate <33,0,0>}}
                                                  
#declare page2= object{
box{<0,0,0><50,45,.02>}
texture{pigment{
        gradient y  color_map {[0.0 color rgb <.7,1,.7>] 
                               [0.45 color rgb <.7,1,.7> ]
                               [0.5 color rgb <.6,.9,.6> ]
                               [0.55 color rgb <1,1,1> ]
                               [1.0 color rgb <1,1,1> ] }}scale 1 normal {wrinkles .1}}
texture{ pigment{ image_map {
          gif "snoopy.gif"  interpolate 2 map_type 0  
          transmit 215,1 }
    scale <50,45,1> translate <0,0,0>  } }}
    
#declare snoopy=union{
object{page2}
object{hole45}
object{hole45 translate <51,0,0>}}

#declare manta= object{
box{<0,0,0><40,40,.02>}
pigment{White}

texture{ pigment{ image_map {
    gif "manta.gif"  interpolate 2 map_type 0 }  
    scale <40,40,1> translate <0,0,0>  } }}                                                     

#declare card1= object{
box{<0,0,0><18.5,8.3,.02>}
pigment{color rgb <1,239/255,198/255>}
pigment{ image_map {
        gif "punchcard.gif"  interpolate 2 map_type 0  
      transmit 255,1 }
    scale <18.5,8.3,1>  }
}
    
#declare cover=
object{box{<0,0,0><17,25,.1>}
texture{pigment{color rgb<.1,.1,.1>}finish{Shiny}}
texture{ pigment{ image_map {
    gif "for4.gif"  interpolate 2 once map_type 0}
    scale <14,16,1> translate <1.5,4,0>  } finish {Shiny}}}
    
declare book= union{
object{cover}
object{cover translate <0,0,1.2>}
object{box{<0,0.1,.2><16.8,24.9,1.2>} pigment{White}}
}

//readable page
object{printout rotate x*90 rotate 5*y translate <-14,0.04,2> }
object{printout rotate x*90 rotate -15*y translate <-30,0.04,25> }    
 
//pack of pages
#declare i=0; 
 #while (i<150)
 object{printout rotate x*90 rotate -y*(90-i/50) translate <60+rand(r1)*.0002+i*0.0001,i*0.04,43+rand(r1)*.0002> }   
 #declare i=i+1;
 #end                                     
 
//cards 
 #declare i=0; 
 #while (i<60) 
  object {card1 rotate x*90 rotate y*20 translate <i*.001-28,i*0.03,30>
  rotate y*(rand(r1)-.5)*2
  translate x*(rand(r1)*.02) translate z*(rand(r1)*.02) translate y*rand(r1)*.01   }
 #declare i=i+1;
 #end                                     
 
#declare i=0; 
 #while (i<280) 
  object {card1 rotate x*90 rotate -y*60 translate <i*.001-25,i*0.03,40>
  rotate y*(rand(r1)-.5)*2
  translate x*(rand(r1)*.005) translate z*(rand(r1)*.005) translate y*rand(r1)*.001   }
 #declare i=i+1;
 #end     
         
#declare i=0; 
 #while (i<100) 
  object {card1 rotate x*90 rotate -y*60 translate <i*.001-14,i*0.03,38>
  rotate y*(rand(r1)-.5)*2
  translate x*(rand(r1)*.02) translate z*(rand(r1)*.02) translate y*rand(r1)*.01   }
 #declare i=i+1;
 #end         
 
 #declare i=0; 
 #while (i<120) 
  object {card1 rotate x*90 rotate y*20 translate <i*.001+12,i*0.03+80*.001,19>
  rotate y*(rand(r1)-.5)*2
  translate x*(rand(r1)*.02) translate z*(rand(r1)*.02) translate y*rand(r1)*.01   }
 #declare i=i+1;
 #end    
   
object{book rotate x*70 rotate y*35 translate <8,2,34>}
object{corona_bottle scale 0.062 rotate y*120 translate <3,0,35> }
object {wall pigment{White} normal {bumps .05}}
object{snoopy translate <-55,-7,119> }
object{manta translate <30,-2,119> }
object {table normal {bumps .02}}