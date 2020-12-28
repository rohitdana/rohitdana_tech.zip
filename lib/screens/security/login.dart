import 'package:flutter/material.dart';
import 'package:rohitdana_tech/screens/home/home.dart';
import 'package:rohitdana_tech/services/validation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();

  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              color: Color(0xffF3F3F3),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 25.0),

                      // TextFormField for email address

                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        controller: _emailController,
                        validator: validateEmail,
                        onSaved: (value) => _email = value,
                        style: style,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),

                      SizedBox(height: 25.0),

                      // TextFormField for email address

                      TextFormField(
                        autofocus: false,
                        controller: _passwordController,
                        validator: validatePassword,
                        onSaved: (value) => _password = value,
                        style: style,
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),

                      SizedBox(height: 25.0),

                      Divider(color: Colors.black), // divider

                      SizedBox(height: 20.0),

                      Material(
                        // login button
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.green,
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return HomeScreen();
                              }));
                            } else {
                              setState(() {
                                // validation error
                                _autoValidate = true;
                              });
                            }
                          },
                          child: Text("LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                        ),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
