Reread dates as numeric character when column postion of dates changes                                                              
                                                                                                                                    
github                                                                                                                              
https://tinyurl.com/y2zmpugw                                                                                                        
https://github.com/rogerjdeangelis/utl-reread-dates-as-numeric-character-when-column-postion-of-dates-changes                       
                                                                                                                                    
Insipred by SAS Forum                                                                                                               
https://tinyurl.com/yxlj6cnw                                                                                                        
https://communities.sas.com/t5/New-SAS-User/Input-Statement-Can-we-move-back-on-the-dataline-being-read/m-p/539892                  
                                                                                                                                    
Freelance Reinhard                                                                                                                  
https://communities.sas.com/t5/user/viewprofilepage/user-id/32733                                                                   
                                                                                                                                    
                                                                                                                                    
SOLUTION                                                                                                                            
========                                                                                                                            
                                                                                                                                    
data want;                                                                                                                          
                                                                                                                                    
  infile cards col=colPos;                                                                                                          
                                                                                                                                    
  input @' ' @;                                                                                                                     
                                                                                                                                    
  put colPos=;  * this is the position of the dates;                                                                                
  input                                                                                                                             
        @colPos (datec1-datec3)  (3*$9.)                                                                                            
        @colPos (daten1-daten3)  (: 3*date10.)                                                                                      
  ;                                                                                                                                 
cards4;                                                                                                                             
JanuaryBirthdays 15JAN2019 16JAN2019 17JAN2019                                                                                      
MayBirthdays 15MAY2019 16MAY2019 17MAY2019                                                                                          
;;;;                                                                                                                                
run;quit;                                                                                                                           
                                                                                                                                    
                                                                                                                                    
OUTPUT                                                                                                                              
======                                                                                                                              
                                                                                                                                    
WORK.WANT total obs=2                                                                                                               
                                                                                                                                    
           Character(not formatted)         Numeric (you can add a format)                                                          
        --------------------------------     ---------------------------                                                            
COLPOS   DATEC1       DATEC2      DATEC3      DATEN1    DATEN2    DATEN3                                                            
                                                                                                                                    
 18    15JAN2019    16JAN201    9 17JAN20     21564     21565     21566                                                             
 14    15MAY2019    16MAY201    9 17MAY20     21684     21685     21686                                                             
                                                                                                                                    
