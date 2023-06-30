import 'package:flutter/material.dart';

class SingleItemUserWidget extends StatelessWidget {
  final VoidCallback onTap;
  //User Entity
  const SingleItemUserWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(""),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                        Text("User Name", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
                        Text("recent msg", style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5), fontWeight: FontWeight.w600)),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Divider(
                            thickness: 1.50,
                            color: Colors.black.withOpacity(.2),
                          ),
                        )
                    ]
                      ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}