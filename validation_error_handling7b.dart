import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Example'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: FormWidget(),
        ),
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _phone = '';
  String _address = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your name';
              }
              return null;
            },
            onSaved: (value) => _name = value ?? '',
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your email';
              }
              return null;
            },
            onSaved: (value) => _email = value ?? '',
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter a password';
              }
              // Add more complex password validation logic if needed
              return null;
            },
            onSaved: (value) => _password = value ?? '',
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(labelText: 'Phone'),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your phone number';
              }
              return null;
            },
            onSaved: (value) => _phone = value ?? '',
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(labelText: 'Address'),
            maxLines: 3,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your address';
              }
              return null;
            },
            onSaved: (value) => _address = value ?? '',
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Perform form submission with the saved form data
      print('Form submitted:');
      print('Name: $_name');
      print('Email: $_email');
      print('Password: $_password');
      print('Phone: $_phone');
      print('Address: $_address');
    }
  }
}
