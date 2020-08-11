import 'package:audiobook_trip/Presentation/Screens/ListScreen.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:flutter/material.dart';





List<GenreBookList> genreBookList =[
GenreBookList(name: "Bookname1", picture: "assets", author: "Authorname", year: "1999"),
GenreBookList(name: "Bookname2", picture: "jhjhgkbk", author: "Authorname2", year:"1996"),
GenreBookList(name: "Bookname3", picture: "assets", author: "Authorname3", year:"1998"),

];


class GenreBookScreen extends StatefulWidget {
  @override
  _GenreBookScreenState createState() => _GenreBookScreenState();
}

class _GenreBookScreenState extends State<GenreBookScreen> {
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
        itemCount: genreBookList.length,
        itemBuilder: (context ,index){
        
                //()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetail())),
            return    
            ListScreen( bookname: "${genreBookList[index].name}" , authorname: "${genreBookList[index].picture}", language:"${genreBookList [index].author}", issuedyear:" ${genreBookList[index].year}" ,);


                         

                        
                

                        

                    

                
        },

        
                    ),
    );

                  
              
    
      
  }
}

class GenreBookList{
final String name;
final String author;
final String picture;
final String year;


GenreBookList( {@required this.name , @required this.author,@required  this.picture, @required  this.year });

}