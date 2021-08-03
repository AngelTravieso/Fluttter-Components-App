import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  bool _isBlockChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliders Page')),
      body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(child: _createImage())
          ])),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Size of image',
      // divisions: 20,
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: (_isBlockChecked)
          ? null
          : (value) {
              setState(() {
                _sliderValue = value;
              });
            },
    );
  }

  Widget _createCheckBox() {
    return CheckboxListTile(
      title: Text('Block Slider'),
      value: _isBlockChecked,
      onChanged: (bool? value) {
        setState(() {
          _isBlockChecked = value!;
        });
      },
    );

    // return Checkbox(
    //   value: _blockCheck,
    //   onChanged: (bool? value) {
    //     setState(() {
    //       // value! = False, if the object has the specified type
    //       _blockCheck = value!;
    //     });
    //   },
    // );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Block Slider'),
      value: _isBlockChecked,
      onChanged: (bool? value) {
        setState(() {
          _isBlockChecked = value!;
        });
      },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZtf0zcp1zFInk7I1SgS4-4jtogL_ClibupA&usqp=CAU'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }
}
