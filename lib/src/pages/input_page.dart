import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _date = '';
  String _selectedOption = 'Fly';
  List<String> _powers = ['Fly', 'X-Ray', 'Cold Breath', 'Super Strength'];
  // late DateTime _date;

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs Page')),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _createInput(),
            Divider(),
            _createEmail(),
            Divider(),
            _createPassword(),
            Divider(),
            _createDate(context),
            Divider(),
            _createDropdown(),
            Divider(),
            _createPerson()
          ]),
    );
  }

  Widget _createInput() {
    return TextField(
        // autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letters ${_name.length}'),
          hintText: 'Name of person',
          labelText: 'Name',
          helperText: 'Just is the name',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
        ),
        onChanged: (value) {
          setState(() {
            _name = value;
          });
        });
  }

  Widget _createEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
        ),
        onChanged: (value) => setState(() {
              _email = value;
            }));
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Date of birth',
        labelText: 'Date of birth',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  Future _selectDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      locale: Locale('es', 'ES'),
    );

    if (newDate != null) {
      setState(() {
        _date = newDate.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> list = [];

    _powers.forEach((power) {
      list.add(DropdownMenuItem(child: Text(power), value: power));
    });

    return list;
  }

  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _selectedOption,
            items: getOptionsDropdown(),
            onChanged: (opt) {
              setState(() {
                _selectedOption = opt.toString();
              });
            },
          ),
        )
      ],
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Name is $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_selectedOption),
    );
  }
}
