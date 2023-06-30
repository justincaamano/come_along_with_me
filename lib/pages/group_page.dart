import 'package:come_along_with_me/widgets/Single_Item_Group.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton( onPressed: () {Navigator.pushNamed(context, "CreateGroup"); },
        child: Icon(Icons.group_add),
      ),
      body: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index){
              return SingleItemGroupWidget(onTap:(){
                Navigator.pushNamed(context, "SingleChat");
              });
            }),
          )
        ],
      ),
    ),
    );
    
  }
}