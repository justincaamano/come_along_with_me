

import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
 
final IconData ? icon;
final String placeholder;
final TextEditingController textController;
final TextInputType keyboardType;
final bool isPassword;
final double? borderRadius;
final VoidCallback? iconClickEvent;

  const CustomInput({
    super.key, 
    this.icon, 
    required this.placeholder, 
    required this.textController, 
    this.keyboardType = TextInputType.text, 
    this.isPassword = false, 
    this.borderRadius=10, this.iconClickEvent
    }
    );

  @override


  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),        
       decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0,5),
            blurRadius: 5
          )
        ]
      ),
      child: TextField(
      controller: this.textController,
      autocorrect: false,
      keyboardType: this.keyboardType,
      obscureText: this.isPassword,
      decoration: InputDecoration(
        prefixIcon: InkWell(onTap: iconClickEvent, child: Icon(this.icon)),
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        hintText: this.placeholder
      ),
     ),
    );
  }
}