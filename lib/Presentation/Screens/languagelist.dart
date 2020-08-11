import 'package:audiobook_trip/Presentation/Screens/LanguageScreen.dart';
import 'package:flutter/material.dart';

class Language extends StatelessWidget {


final String language;

Language( {@required this.language });

  @override
  Widget build(BuildContext context) {
    
    return  InkWell(
        onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new LanguageScreen( ))), 

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
 
                    color: Colors.blueGrey[50],
                    height: 60.0,

                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                                  
                                   Padding(
                                     padding: const EdgeInsets.all(4.0),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: <Widget>[
                                         Text(language,
                                          style: TextStyle(
                                          
                                          fontSize: 16.0,
                                          color: Colors.black
                                             )
                                          ),
                                           Icon(
                                              Icons.arrow_right,
                                             color: Color(0xFF404aff),
                   
                                              ),
                                       ],
                                     ),
                                   ),
                                    
                                  
                                 
                                  
                                    
                                 

                                
                              
                            ],
                          ),
                        ),
                      ),

                ),
             
      
      
      
          
    )
    ;

        
        

       

            

          
   
    
  }
}

