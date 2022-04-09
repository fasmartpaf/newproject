import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyCustomForm extends StatefulWidget {
  @override
  State<MyCustomForm> createState() => _State();
}

class _State extends State<MyCustomForm> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController PasswordController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: TextFormField(
            onSaved: (usama) {
              EmailController.text = usama!;
            },
            validator: (usama) {
              EmailController.text = usama!;
            },
            onChanged: (value) {
              value = EmailController.text;
            },
            controller: EmailController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter  Email',
                labelText: 'Email'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: TextFormField(
            onChanged: (value) {
              value = PasswordController.text;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return ('Please Enter a valid password');
              }
            },
            onSaved: (val) {
              PasswordController.text = val!;
            },
            controller: PasswordController,
            obscureText: true,
            autofocus: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter  password',
                labelText: 'Password'),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(15)),
          height: 40,
          child: ElevatedButton(
              onPressed: () async {
                if (EmailController.text.contains('j')) {
                  Fluttertoast.showToast(
                      msg: 'You Remove the word J',
                      textColor: Colors.white,
                      backgroundColor: Colors.black);
                }
                if (PasswordController.text.length <= 5) {
                  Fluttertoast.showToast(
                    msg: 'Your password must be  6 character:',
                    textColor: Colors.white,
                    backgroundColor: Colors.black,
                  );
                }
                try {
                  await _auth.createUserWithEmailAndPassword(
                      email: EmailController.text,
                      password: PasswordController.text);
                } catch (e) {
                  print(e.toString());
                }
              },
              child: Text(
                'Register',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
        )
      ],
    )));
  }
}
