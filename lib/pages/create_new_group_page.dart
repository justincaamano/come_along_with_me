



import 'package:flutter/material.dart';

import '../widgets/btn_login.dart';
import '../widgets/custom_input.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({super.key});

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {

TextEditingController _GroupNameController = TextEditingController();
void dispose() {
    super.dispose();
    _GroupNameController.dispose();
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Group"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
            children: [
            SizedBox(height: 100,),
              Container(
              height: 62,
              width: 62,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(62),
              ),
              child: Text(""),),
            SizedBox(height: 15,),
            Text("Add Group image", style: TextStyle(color: Color.fromRGBO(227, 78, 54, 1.000), fontWeight: FontWeight.w500 ),),
            SizedBox(height: 40,),
            CustomInput(placeholder: "name", textController: _GroupNameController, icon: Icons.person), 
            SizedBox(height: 10, ),
            Divider(thickness: 1.50, indent: 100 ,endIndent: 100),
            SizedBox(height: 10,),
            buttonLogin(text: "Create New Group", onPressed: (){})
            ]
        ),
      ),
    );
  }
}