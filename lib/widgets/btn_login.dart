import 'package:flutter/material.dart';

class buttonLogin extends StatelessWidget {
  
  final String text;
  final Function onPressed;

  const buttonLogin({
  super.key, 
  required this.text, 
  required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(99, 143, 206, 1.000),
                shape: StadiumBorder(),
                elevation: 2
                
              ),
              child: Container(
                width: double.infinity,
                height: 55,
                child: Center(
                  child: Text(this.text, style: TextStyle(color: Colors.white, fontSize: 18),),
                ),
              ),
    
              onPressed: ()
              {
                this.onPressed();
              }, 
              );
  }
}