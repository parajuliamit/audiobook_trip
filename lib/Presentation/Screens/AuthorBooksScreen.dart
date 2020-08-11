import 'package:audiobook_trip/Presentation/Screens/ListScreen.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:flutter/material.dart';





List<AuthorBookList> authorBookList =[
AuthorBookList(name: "Bookname1", picture: "assets", author: "Authorname", year: "1999"),
AuthorBookList(name: "Bookname2", picture: "jhjhgkbk", author: "Authorname2", year:"1996"),
AuthorBookList(name: "Bookname3", picture: "assets", author: "Authorname3", year:"1998"),

];


class AuthorBookScreen extends StatefulWidget {
  @override
  _AuthorBookScreenState createState() => _AuthorBookScreenState();
}

class _AuthorBookScreenState extends State<AuthorBookScreen> {
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
          'Authorname',
          style: kTitle,
        ),
        
        backgroundColor: Colors.white,
      ),
         body:
         ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: authorBookList.length,
        itemBuilder: (context ,index){
        
                //()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetail())),
            return    
            ListScreen( bookname: "${authorBookList[index].name}" , authorname: "${authorBookList[index].picture}", language:"${authorBookList [index].author}", issuedyear:" ${authorBookList[index].year}" ,);


                         

                        
                

                        

                    

                
        },

        
                    ),
    );

                  
              
    
      
  }
}






class AuthorBookList{
final String name;
final String author;
final String picture;
final String year;


AuthorBookList( {@required this.name , @required this.author,@required  this.picture, @required  this.year });

}