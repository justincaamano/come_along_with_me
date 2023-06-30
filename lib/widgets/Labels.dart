import 'package:flutter/material.dart';

class Labels extends StatelessWidget {

final String ruta;
final String titulo;
final String subtitulo;

  const Labels({super.key, 
  required this.ruta,
  required this.titulo,
  required this.subtitulo}
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children:  <Widget>[
          Text(this.titulo, style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),),
          SizedBox(height: 10,),
          GestureDetector(
            child: Text(this.subtitulo, style: TextStyle(color: Color.fromRGBO(227, 78, 54, 1.000), fontSize: 18, fontWeight: FontWeight.bold),),
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta);
            },
          ),
        ],
      ),
    );
  }
}