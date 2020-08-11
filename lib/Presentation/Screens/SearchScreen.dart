
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: (SafeArea( child: ListView(
        children: <Widget>[

        SizedBox(height: 5.0) , // for search box
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [ BoxShadow (
                color: Colors.grey,
                offset: Offset(1.0, 1.0),
                blurRadius: 4.0,
              ),
              ],
            ),
            child: ListTile(
              leading: IconButton(
            icon: Icon(Icons.search,color: Colors.grey,), onPressed: () {},
            
            ),
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Explore your favourite books",
                  border: InputBorder.none,
                ),
              ),
              trailing: Icon(Icons.filter_list,color: Colors.grey,),
            ),
          ),
        ),
        ], 
      ),
      )
    )
    );
  }
}