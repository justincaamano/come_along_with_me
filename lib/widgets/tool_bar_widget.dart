


import 'package:flutter/material.dart';


typedef ToolbarIndexController=Function(int index);
class CustomToolBarWidget extends StatelessWidget {
  final ToolbarIndexController toolbarIndexController;
  final int? pageIndex;
  const CustomToolBarWidget({super.key, required this.toolbarIndexController, this.pageIndex});

 


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue
      ),
      child: Row(
        children: [
          
          Expanded(child: ToolBarItem(onTap: (){
        toolbarIndexController(0);
        }, 
        title: "contacts", 
        borderColor: pageIndex==0?Colors.white:Colors.transparent, 
        textColor: pageIndex==0?Colors.white:Colors.black, )), 
        
        
        Expanded(child: ToolBarItem(onTap: (){
        toolbarIndexController(1);
        }, 
        title: "groups", 
        borderColor: pageIndex==1?Colors.white:Colors.transparent, 
        textColor: pageIndex==1?Colors.white:Colors.black, )), 
        
        
      
        Expanded(child: ToolBarItem(onTap: (){
        toolbarIndexController(2);
        }, 
        title: "Profile", 
        borderColor: pageIndex==2?Colors.white:Colors.transparent, 
        textColor: pageIndex==2?Colors.white:Colors.black, )),
      ]),
    );
  }
}


class ToolBarItem extends StatelessWidget {
  final String? title;
  final Color? textColor;
  final Color borderColor;
  final double? borderwidth;
  final VoidCallback? onTap;
  const ToolBarItem({super.key, this.title, this.textColor, this.borderwidth = 3.0, this.onTap, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
      border: Border( bottom: BorderSide(color: borderColor, width: borderwidth!))
      ),
      child: Text(title!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textColor),)
      )
      );
    
  }
}