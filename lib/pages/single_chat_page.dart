


import 'package:flutter/material.dart';

class SingleChat extends StatefulWidget {
  const SingleChat({super.key});

  @override
  State<SingleChat> createState() => _SingleChatState();
}

class _SingleChatState extends State<SingleChat> {

  TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

@override
  void initState() {
   _messageController.addListener(() {
     setState(() {});});
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Group Name"),
        ),
        body: Column(
            children: [
              Expanded(child: _listMessagesWidget()),
              _inputMessageWidget(),
            ],
        ),
      ),
    );
  }

  _listMessagesWidget() {
    return ListView.builder(itemBuilder: (context, index){
      return Text("");
    });
  }

  _inputMessageWidget() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(80),
              boxShadow: [BoxShadow(
                color: Colors.black.withOpacity(.2),
                spreadRadius: 1,
                blurRadius: 1,
                )
              ]
            ),
            child: Row(
              children: [
                SizedBox(width: 4,),
                Icon(Icons.insert_emoticon),
                SizedBox(width: 10,),
                Expanded(
                  child: Scrollbar(
                    child: TextField(
                      controller: _messageController,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        border: InputBorder.none,
                      ),
                  
                    ),
                  ),
                ),
                Icon(Icons.link),
                SizedBox(width: 8,),
                Icon(Icons.camera_alt),
                SizedBox(width: 10,),
              ],
            ),
          ),
          ),
          SizedBox(width: 10,),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(45),
            ),
            child: Icon(_messageController.text.isEmpty? Icons.mic:Icons.send, color: Colors.white,),
          )
        ],
      ),
    );
  }
}