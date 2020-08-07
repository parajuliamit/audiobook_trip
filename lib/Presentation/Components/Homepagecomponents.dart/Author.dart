import 'package:flutter/material.dart';

import 'bookcard.dart';



List<AuthorList> authorList =[
AuthorList(name: "Author1", picture: "assets/images/download.jpg", author: "Authorname1", ),
AuthorList(name: "Author2", picture: "assets/images/download.jpg", author: "Authorname2",),
AuthorList(name: "Author3", picture: "assets/images/download.jpg", author: "Authorname3",),

];


class Author extends StatefulWidget {
  @override
  _AuthorState createState() => _AuthorState();
}

class _AuthorState extends State<Author> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: authorList.length,
      itemBuilder: (context ,index){
        return Padding(
              padding: const EdgeInsets.fromLTRB(12, 14 , 16 , 12),
              child:InkWell(
                onTap: (){}, //()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetail())),
              
              child: BookCard(imageLocation: "${authorList[index].picture}" , title: "${authorList[index].name}", name:"${authorList [index].author}" ,),


                       

                      
              ), 

                      

                  );

              
      },

      
                  );

                  
              
    
      
  }
}






class AuthorList{
final String name;
final String author;
final String picture;


AuthorList( {@required this.name , @required this.author,@required  this.picture });

}