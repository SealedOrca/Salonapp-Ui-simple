import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform sign-up logic here
      // You can access the form field values (_name, _email, _password) and handle the sign-up process
      // Example: authProvider.signUp(_name, _email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _name = value;
              });
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              // You can add more sophisticated email validation if needed
              return null;
            },
            onChanged: (value) {
              setState(() {
                _email = value;
              });
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a password';
              }
              // You can add more password validation rules if needed
              return null;
            },
            onChanged: (value) {
              setState(() {
                _password = value;
              });
            },
          ),
          SizedBox(height: 32),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Sign up'),
          ),
        ],
      ),
    );
  }
}
