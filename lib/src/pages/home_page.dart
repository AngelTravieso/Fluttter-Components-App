import 'package:flutter/material.dart';
import 'package:component/src/providers/menu_provider.dart';
import 'package:component/src/utils/icon_string_util.dart';
import 'package:component/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Components'),
        ),
        body: _list());
  }

  Widget _list() {
    // menuProvider.loadData();
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data ?? [], context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['text']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, '/${opt['route']}');

          // context es necesario para saber cual pagina sigue y cual se va a regresar cuando se cancele la pagina
          // final route = MaterialPageRoute(builder: (context) => AlertPage());
          // Navigator.push(context, route);
        },
      );

      options..add(widgetTemp)..add(Divider());
    });

    return options;
  }
}
