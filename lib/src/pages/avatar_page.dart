import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  static final pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Avatars Page'), actions: <Widget>[
        Container(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZtf0zcp1zFInk7I1SgS4-4jtogL_ClibupA&usqp=CAU'),
            radius: 25.0,
          ),
        ),
        Container(
            margin: EdgeInsets.only(right: 10.0),
            child:
                CircleAvatar(child: Text('SL'), backgroundColor: Colors.brown))
      ]),
      body: Center(
          child: FadeInImage(
        image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZtf0zcp1zFInk7I1SgS4-4jtogL_ClibupA&usqp=CAU'),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
      )),
    );
  }
}
