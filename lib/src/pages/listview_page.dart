import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _numberList = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    // reference to class State and will be initialized
    super.initState();
    _add10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _add10();
        fetchData();
      }
    });
  }

  // When the page ceases to exist in the stack
  @override
  void dispose() {
    super.dispose();
    // prevent memory leaks
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Lists and Scrolls Page')),
        body: Stack(
          children: <Widget>[
            _createList(),
            _createLoading(),
          ],
        ));
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getPage1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _numberList[index];

          return FadeInImage(
              image:
                  NetworkImage('https://picsum.photos/300/300?random=$image'),
              placeholder: AssetImage('assets/jar-loading.gif'));
        },
      ),
    );
  }

  Future getPage1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numberList.clear();
      _lastItem++;
      _add10();
    });

    return Future.delayed(duration);
  }

  void _add10() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _numberList.add(_lastItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, httpResponse);
  }

  void httpResponse() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _add10();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
