import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              InkWell(
                onTap: (){},
                              child: Icon(
                    Icons.home,
                    color: Color(0xFF404aff),
                    size: 35,
                  ),
              ),
              SizedBox(
                height: 5,
                
              ),
              
              Text(
                "Home",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFa9a9a9),
                    fontWeight: FontWeight.w300),
              ),
              
              SizedBox(
                height: 5,
                
              ),
              
            ],
          ),
          Column(
            children: <Widget>[
              InkWell(
                onTap: (){},
                              child: Icon(
                  Icons.person_outline,
                  color: Color(0xFF23c58a),
                  size: 35,
                ),
              ),
              SizedBox(
                height: 5,
                
              ),
              Text(
                "Authors",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFa9a9a9),
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 5,
                
              ),
              
            ],
          ),
          Column(
            children: <Widget>[
              InkWell(
                onTap: (){},
                              child: Icon(
                  Icons.language,
                  color: Color(0xFFff0654),
                  size: 35,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Language",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFa9a9a9),
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 5,
                
              ),
              
            ],
          ),
          Column(
            children: <Widget>[
              InkWell(
                onTap: (){},
                              child: Icon(
                  Icons.collections_bookmark,
                  color: Color(0xFFe95959),
                  size: 35,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "All Books",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFa9a9a9),
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 5,
                
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}