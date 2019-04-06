import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>(); // It is used to connect with Form
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40.0, 100.0, 40.0, 100.0),
      child: Form(
        key: formKey, // We use GlobalKey here
        child: Column(
          children: <Widget>[
            emailField(),
            SizedBox(height: 20.0),
            passwordField(),
            SizedBox(height: 20.0),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return Theme(
      data: new ThemeData(
        primaryColor: Colors.purpleAccent,
        primaryColorDark: Colors.purple,
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Email Address",
          hintText: "you@example.com",
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
        ),
        validator: validateEmail, // Validator, there is no need for braces
        onSaved: (String value) {
          email = value;
        }, // OnSaved
      ),
    );
  }

  Widget passwordField() {
    return Theme(
      data: new ThemeData(
        primaryColor: Colors.purpleAccent,
        primaryColorDark: Colors.purple,
      ),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "Password...",
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
        ),
        validator: validatePassword, //Validator, there is no need for braces
        onSaved: (String value) {
          password = value;
        }, // OnSaved
      ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text("Submit"),
      color: Colors.green[700],
      textColor: Colors.grey[50],
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'Your email and password are succesfully validated and saved into variables.');
        }
        // currentState is FormState instance,
        // so we reset all TextFormFields with press of a button
      },
    );
  }
}
