import 'package:come_along_with_me/widgets/Single_item_User.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index){
              return SingleItemUserWidget(onTap:(){});
            }),
          )
        ],
      ),
    );
    
  }
}