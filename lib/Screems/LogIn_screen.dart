import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';


import 'Register_screen.dart';
import 'ScreenNavigation.dart';
FirebaseAuth _auth=FirebaseAuth.instance;
class MyStatefulWidget extends StatefulWidget {

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'TutorialKart',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  restorationId: nameController.text,
                  autocorrect: true,
                  enableSuggestions: true,
                  onChanged: (value){
                    value=nameController.text;
                  },
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ENTER EMAIL',
                    labelStyle: TextStyle(
                      fontStyle: FontStyle.italic
                    )
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  autofillHints: [AutofillHints.email],
                  validator: (value){
                    },
                  onChanged: (value){
                    value=passwordController.text;
                  },
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                          fontStyle: FontStyle.italic
                      )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () async{
                      if(nameController.text.contains('xy')){
                        Fluttertoast.showToast(msg: 'Remove the X or Y chacracter', textColor: Colors.white,backgroundColor: Colors.black,fontSize: 20);
                      }
                      if(passwordController.text.length<6){

                        Fluttertoast.showToast(msg: 'Password must be 6 character',
                            textColor: Colors.white,backgroundColor: Colors.black,fontSize: 20);
                      }
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: nameController.text,
                            password: passwordController.text
                        );
                        if (user == null) {
                          Text('Enter Email And Password');
                        }
                        if (user != null) {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) =>
                          MOvedscreen()
                          ));
                        }
                      }catch(e){
                        print(e.toString());
                      }
                      },
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Register'),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MyCustomForm()
                      ));

                    },
                  )
              ),

            ],
          )),
    );
  }}