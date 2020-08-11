//import 'package:audiobook_trip/Presentation/Screens/LanguageScreen.dart';
//import 'package:audiobook_trip/Presentation/Components/Homepagecomponents.dart/browsescreen.dart';
import 'package:flutter/material.dart';

import 'AuthorBooksScreen.dart';

class Authors extends StatelessWidget {


final String authors;

Authors( {@required this.authors });

  @override
  Widget build(BuildContext context) {
    
    return  InkWell(
        onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new AuthorBookScreen( ))), 

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
                                         Text(authors,
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





