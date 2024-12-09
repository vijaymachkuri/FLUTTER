import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  bool _subscribeToNewsletter = false;
  String _selectedCountry = 'USA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) {
                  _name = value ?? '';
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) {
                  _email = value ?? '';
                },
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _subscribeToNewsletter,
                    onChanged: (value) {
                      setState(() {
                        _subscribeToNewsletter = value ?? false;
                      });
                    },
                  ),
                  Text('Subscribe to Newsletter'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Text('Country:'),
                  SizedBox(width: 20),
                  DropdownButton<String>(
                    value: _selectedCountry,
                    onChanged: (value) {
                      setState(() {
                        _selectedCountry = value ?? 'USA';
                      });
                    },
                    items: <String>['USA', 'Canada', 'UK', 'Australia']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  // Submit the form data
                  print('Name: $_name');
                  print('Email: $_email');
                  print('Subscribe to Newsletter: $_subscribeToNewsletter');
                  print('Country: $_selectedCountry');
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
