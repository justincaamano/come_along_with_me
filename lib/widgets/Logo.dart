import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

 
  
  @override
  Widget build(BuildContext context) {
   
    return Center(
      
      child: Container(
        padding: EdgeInsets.only(top: 50),
        width: 250,
        child: Column(
          children: <Widget>[
            
            Image(image: AssetImage('assets/Logo_CAWM.png'),),
          ],
        ),
      ),
    );
  }
}