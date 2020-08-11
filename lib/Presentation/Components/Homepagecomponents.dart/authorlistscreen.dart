
import 'package:audiobook_trip/Presentation/Screens/AuthorList.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:flutter/material.dart';





List<AuthorList> authorList =[
AuthorList(name: "Author1", ),
AuthorList(name: "Author1", ),
AuthorList(name: "Author1", ),
AuthorList(name: "Author1", ),


];


class AuthorListScreen extends StatefulWidget {
  @override
  _AuthorListScreenState createState() => _AuthorListScreenState();
}

class _AuthorListScreenState extends State<AuthorListScreen> {
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
          'Authors',
          style: kTitle,
        ),
        
        backgroundColor: Colors.white,
      ),
         body:
         ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: authorList.length,
        itemBuilder: (context ,index){
        
                //()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetail())),
              
          return 
          Authors ( authors : "${authorList[index].name}"  ,);

                
        },

       ),
    );

                  
              
    
      
  }
}






class AuthorList{

final String name;



AuthorList( {@required  this.name  });

}