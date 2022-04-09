import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/Screems/Register_screen.dart';
import 'package:newproject/Screems/usama.dart';

class Catagory extends StatefulWidget {
  @override
  State<Catagory> createState() => _CatagoryState();
}

class _CatagoryState extends State<Catagory> {

@override
  // void initState() {
  //  Admob.requestTrackingAuthorization();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome Here'),
        ),
        body: GridView.builder(
          itemCount: usama.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Column(

            children: [



              Container(
                color: Colors.white12,
                height: 100,
                   child: Card(
                     child: Image.asset(usama[index].image,fit: BoxFit.values.last,),
                   ),
              )
              ,Container(
                color: Colors.lightBlueAccent,
                child: Card(
                  child: Text(usama[index].name),
                ),
              ),
              IconButton(onPressed: (){
                if(index==0){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MyCustomForm(),
                  ));
                }
                else if(index==1){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MyCustomForm(),
                  ));
                }
                else if(index==2){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MyCustomForm(),
                  ));
                }
                else if(index==3){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MyCustomForm(),
                  ));
                }
                else  if(index==4){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MyCustomForm(),
                  ));
                }
                else if(index==5){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MyCustomForm(),
                  ));
                }
                else if(index==6){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MyCustomForm(),
                  ));
                }
                else if(index==7){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MyCustomForm(),
                  ));
                }
                else if(index==8){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MyCustomForm(),
                  ));
                }
                else if(index==9){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MyCustomForm(),
                  ));
                }


              }, icon: Icon(Icons.move_down_outlined)),

            ],
            );
          }
          ,)
    );
  }
}


