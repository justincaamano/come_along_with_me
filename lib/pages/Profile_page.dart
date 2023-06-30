


import 'package:come_along_with_me/widgets/custom_input.dart';
import 'package:flutter/material.dart';

import '../widgets/btn_login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  TextEditingController _nameController = TextEditingController();
  TextEditingController _statusController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override

  void dispose() {
    super.dispose();
    _nameController.dispose();
    _statusController.dispose();
  }


  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(62),
            ),
            child: Text(""),),
          SizedBox(height: 15,),
          Text("Remove profile photo", style: TextStyle(color: Color.fromRGBO(227, 78, 54, 1.000), fontWeight: FontWeight.w500 ),),
          SizedBox(height: 40,),
          CustomInput(placeholder: "name", textController: _nameController, icon: Icons.person), 
          SizedBox(height: 10,),
          CustomInput(placeholder: "email", icon: Icons.email, textController: _emailController),
          SizedBox(height: 10,),
          CustomInput(placeholder: "Status", textController: _statusController, icon: Icons.interests),
          SizedBox(height: 10,),
          Divider(thickness: 1.50),
          SizedBox(height: 10,),
          buttonLogin(text: "Update Profile", onPressed: (){})
          ]
      ),
    );
  }
}