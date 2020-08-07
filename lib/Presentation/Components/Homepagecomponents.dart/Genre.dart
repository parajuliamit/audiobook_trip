import 'package:flutter/material.dart';

import 'bookcard.dart';



List<GenreList> genreList =[
GenreList(name: "Genre1", picture: "assets/images/download.jpg", author: "Authorname1", ),
GenreList(name: "Genre2", picture: "assets/images/download.jpg", author: "Authorname2",),
GenreList(name: "Genre3", picture: "assets/images/download.jpg", author: "Authorname3",),

];


class Genre extends StatefulWidget {
  @override
  _GenreState createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: genreList.length,
      itemBuilder: (context ,index){
        return Padding(
              padding: const EdgeInsets.fromLTRB(12, 14 , 16 , 12),
              child:InkWell(
                onTap: (){}, //()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetail())),
              
              child: BookCard(imageLocation: "${genreList[index].picture}" , title: "${genreList[index].name}", name:"${genreList [index].author}" ,),


                       

                      
              ), 

                      

                  );

              
      },

      
                  );

                  
              
    
      
  }
}






class GenreList{
final String name;
final String author;
final String picture;


GenreList( {@required this.name , @required this.author,@required  this.picture });

}