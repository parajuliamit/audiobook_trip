

import 'package:flutter/material.dart';

import 'bookcard.dart';



List<PopularBook> productList =[
PopularBook(name: "Bookname1", picture: "assets/images/download.jpg", author: "Authorname1", ),
PopularBook(name: "Bookname2", picture: "assets/images/download.jpg", author: "Authorname2",),
PopularBook(name: "Bookname3", picture: "assets/images/download.jpg", author: "Authorname3",),

];


class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productList.length,
      itemBuilder: (context ,index){
        return Padding(
              padding: const EdgeInsets.fromLTRB(12, 14 , 16 , 12),
              child:InkWell(
                onTap: (){}, //()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetail())),
              
              child: BookCard(imageLocation: "${productList[index].picture}" , title: "${productList[index].name}", name:"${productList [index].author}" ,),


                       

                      
              ), 

                      

                  );

              
      },

      
                  );

                  
              
    
      
  }
}






class PopularBook{
final String name;
final String author;
final String picture;


PopularBook( {@required this.name , @required this.author,@required  this.picture });

}
