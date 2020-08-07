
import 'package:audiobook_trip/Presentation/Components/Homepagecomponents.dart/Author.dart';
import 'package:audiobook_trip/Presentation/Components/Homepagecomponents.dart/Bottommenu.dart';
import 'package:audiobook_trip/Presentation/Components/Homepagecomponents.dart/Genre.dart';
import 'package:audiobook_trip/Presentation/Components/Homepagecomponents.dart/PopularBooks.dart';
import 'package:flutter/material.dart';
import 'package:audiobook_trip/Presentation/constants.dart';

import '../custom_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'AudioBook',
          style: kTitle,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      

      body: SafeArea( child: Column(
        children: <Widget>[
          Expanded(
                      child: ListView(
              children: <Widget>[

              Padding (
                   padding: const EdgeInsets.all(8.0),
                    child: CustomText(text:"Popular Books"),

                ),

                Padding(
                   padding: const EdgeInsets.only(right:8.0),
                   
                   child: GestureDetector(
                     onTap: (){},
                                  child: Text("See All"  ,style: TextStyle( color:Colors.blue , fontSize: 16.0, fontWeight: FontWeight.w300 ), textAlign: TextAlign.right,
                       
                       ),
                   ),
                 ),
                Container(
                  height: 240.0,
                child: Popular(),
                ),

                Divider(),
                Padding (
                   padding: const EdgeInsets.all(8.0),
                    child: CustomText(text:"Genre"),

                ),

                 Padding(
                   padding: const EdgeInsets.only(right:8.0),
                   
                   child: GestureDetector(
                     onTap: (){},
                                  child: Text("See All"  ,style: TextStyle( color:Colors.blue , fontSize: 16.0, fontWeight: FontWeight.w300 ), textAlign: TextAlign.right,
                       
                       ),
                   ),
                 ),

                Container(
                  height: 240.0,
                child: Genre(),
                ),

                
                Divider(),
                Padding (
                   padding: const EdgeInsets.all(8.0),
                    child: CustomText(text:"Authors"),

                ),

                 Padding(
                   padding: const EdgeInsets.only(right:8.0),
                   
                   child: GestureDetector(
                     onTap: (){},
                                  child: Text("See All"  ,style: TextStyle( color:Colors.blue , fontSize: 16.0, fontWeight: FontWeight.w300 ), textAlign: TextAlign.right,
                       
                       ),
                   ),
                 ),

                Container(
                  height: 240.0,
                child: Author(),
                ),

              
             
                

              ],

              
              
            ),
          ),
           BottomMenu(),
        ],
      ),
      
      ),

   
      
    );
  }
}
