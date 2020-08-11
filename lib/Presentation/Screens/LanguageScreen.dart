
import 'package:audiobook_trip/Presentation/Screens/ListScreen.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:flutter/material.dart';





List<LanguageList> languageList =[
LanguageList(name: "Bookname1", picture: "assets", author: "Authorname1", year: "1999"),
LanguageList(name: "Bookname2", picture: "jhjhgkbk", author: "Authorname2", year:"1996"),
LanguageList(name: "Bookname3", picture: "assets", author: "Authorname3", year:"1998"),

];


class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: new AppBar(
         elevation:0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            onPressed: () {},
          )
        ],
        centerTitle: true,
        title: Text(
          'All Books',
          style: kTitle,
        ),
        
        backgroundColor: Colors.white,
      ),
         body:
         ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: languageList.length,
        itemBuilder: (context ,index){
        
                //()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetail())),
            return    
            ListScreen( bookname: "${languageList[index].name}" , authorname: "${languageList[index].picture}", language:"${languageList [index].author}", issuedyear:" ${languageList[index].year}" ,);


                         

                        
                

                        

                    

                
        },

        
                    ),
    );

                  
              
    
      
  }
}






class LanguageList{
final String name;
final String author;
final String picture;
final String year;


LanguageList( {@required this.name , @required this.author,@required  this.picture, @required  this.year });

}