//include file corona_bottle
//by Kurt Bangert
//needs corona.gif  
//height 24 cm

#declare outer_bottle=sor{
28,
<40 0>
<43 1>
<45 5>
<47 22>
<47 36>
<47 203>
<44 221>
<33 248>
<31 253>
<30 256>
<29 264>
<29 289>
<26 324>
<20 377>
<19 381>
<19 383>
<21 385>
<22 388>
<21 393>
<20 397>
<19 401>
<19 405>
<20 407>
<20 408>
<20 411>
<19 412>
<18 414>
<17 415>
sturm
} 

#declare inner_bottle=sor{ 
14,
<0 10>
<40 11>
<41 34>
<41 205>
<36 224>
<21 252>
<22 286>
<18 339>
<13 381>
<14 388>
<15 392>
<13 404>
<12 412>
<11 417>
sturm
}

#declare level=160;        
//moves level of beer up and down

#declare beer= object{
 difference{
 object{inner_bottle scale 1.01}
 object{cylinder {<0,level,0><0,500,0> 50}no_shadow}}
 texture{ pigment{color rgbf <1,.85,.3,.999>}}
 interior{ior 1.2 
 //fade_distance 300 fade_power .1 caustics 1
 }
 }

#declare foam=union{
#declare i=0;
 #while (i<4000) 
  #declare dx=(rand(r1)*2-1)*41;
  #declare dz=(rand(r1)*2-1)*41;
  #declare radius_foam= dx*dx+dz*dz;
  #while (radius_foam<1681)
  object {sphere{<dx,level+rand(r1)*15,dz> rand(r1)+.5 no_shadow hollow} 
  pigment {color rgbt<1,1,1,.2>} finish {ambient .4 diffuse .3 reflection .3} }  
  #declare radius_foam=5000;               
  #end
  #declare i=i+1;    
 #end     
 }                                                       
 
#declare bottle = 
object{difference{
object{outer_bottle}
object{inner_bottle}}    

texture{ pigment{ image_map {
     gif "corona.gif"  interpolate 2 map_type 2 once 
     transmit 122,1}
     scale <100,180,100> translate <0,30,0> 
    }
    }
   
texture{ pigment{ color rgbt<1, 1, 1, 0.99>}
         finish{reflection 0.1 ambient 0 diffuse 0 phong .5 phong_size 100 }}     
         interior{ior 1.3
         fade_distance 300 fade_power .15+.15 caustics 1
        }}     

//a very simple lemon piece        
#declare lemon= difference{
object{ sphere {<0,0,0> 30} pigment {Green} normal {bumps 1 scale 0.1}}
object{box {<-40,40,-40><40,0,40> pigment {Yellow}}}
object{box {<-40,40,-40><40,0,40> pigment {Yellow} rotate x*140}}
}

#declare corona_bottle= union{
object{bottle}
object{beer}                           
object{lemon translate -z*4 rotate -y*30 translate <0,level+1,0>}            
object{foam rotate -y*30}
}