
import 'package:audiobook_trip/Presentation/Components/Homepagecomponents.dart/Bottommenu.dart';
import 'package:audiobook_trip/Presentation/Screens/languagelist.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:flutter/material.dart';





List<LanguageList> languageList =[
LanguageList(name: "Language1", ),
LanguageList(name: "Language1", ),
LanguageList(name: "Language1", ),
LanguageList(name: "Laanguage1", ),


];


class LanguageListScreen extends StatefulWidget {
  @override
  _LanguageListScreenState createState() => _LanguageListScreenState();
}

class _LanguageListScreenState extends State<LanguageListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: new AppBar(
         elevation:0,

        centerTitle: true,
        title: Text(
          'Languages',
          style: kTitle,
        ),
        
        backgroundColor: Colors.white,
      ),
         body:
         Column(
           children: <Widget>[
             Expanded(
                            child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: languageList.length,
        itemBuilder: (context ,index){
        
                      //()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetail())),
                  return 
                   
                  Language( language: "${languageList[index].name}"  ,)
                  ;

                      
        },
                          ),
             ),

             BottomMenu()
           ],
         ),
    );

                  
              
    
      
  }
}






class LanguageList{

final String name;



LanguageList( {@required  this.name  });

}