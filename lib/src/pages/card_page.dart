import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          SizedBox(
            height: 30.0,
          ),
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          SizedBox(
            height: 30.0,
          ),
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Card Title'),
            subtitle:
                Text('Here we are with the description of the card to show'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(child: Text('Cancel'), onPressed: () {}),
              TextButton(child: Text('Accept'), onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    final card = Container(
      // clipBehavior: Clip.antiAlias, // Recorta imagen
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZtf0zcp1zFInk7I1SgS4-4jtogL_ClibupA&usqp=CAU'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage(
          //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZtf0zcp1zFInk7I1SgS4-4jtogL_ClibupA&usqp=CAU'),
          // ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('I have no idea what to put')),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
