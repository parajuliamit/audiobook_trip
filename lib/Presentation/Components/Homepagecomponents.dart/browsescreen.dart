import 'package:audiobook_trip/Presentation/Screens/ListScreen.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:flutter/material.dart';

import 'Bottommenu.dart';





List<BrowseList> browseList =[
BrowseList(name: "Bookname1", picture: "assets", author: "Authorname1", year:"1999" ),
BrowseList(name: "Bookname2", picture: "jhjhgkbk", author: "Authorname2", year:"1996"),
BrowseList(name: "Bookname3", picture: "assets", author: "Authorname3", year:"1998"),

];


class BrowseScreen extends StatefulWidget {
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
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
         Column(
           children: <Widget>[
             Expanded(
                            child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: browseList.length,
        itemBuilder: (context ,index){
        
                      //()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetail())),
                  return    
                  ListScreen( bookname: "${browseList[index].name}" , authorname: "${browseList[index].picture}", language:"${browseList [index].author}", issuedyear:" ${browseList[index].year}" ,);


                               

                              
                      

                              

                          

                      
        },

        
                          ),
             ),

             BottomMenu(),
           ],
         ),
    );

                  
              
    
      
  }
}






class BrowseList{
final String name;
final String author;
final String picture;
final String year;


BrowseList( {@required this.name , @required this.author,@required  this.picture, @required  this.year });

}