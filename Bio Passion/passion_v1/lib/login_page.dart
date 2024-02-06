import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _isLoading = false;

  void _submitForm() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Replace this with your own login logic
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // If the login was successful, you can navigate to another page or show a snackbar
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login successful')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (!EmailValidator.validate(value)) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  obscureText: true,
                  onSaved: (value) => _password = value,
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: _isLoading ? CircularProgressIndicator() : Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}