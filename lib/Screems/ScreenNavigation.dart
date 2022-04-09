import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import 'Adddtata.dart';
import 'Catagory.dart';
import 'Textfield.dart';
import 'fdata.dart';
class MOvedscreen extends StatefulWidget {
  const MOvedscreen({Key? key}) : super(key: key);

  @override
  State<MOvedscreen> createState() => _MOvedscreenState();
}

class _MOvedscreenState extends State<MOvedscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Navigation Screen',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: true, applyHeightToLastDescent: true),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text(
                  'VIEWBOKKS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  Catagory ()));
                },
              )),
              Padding(padding: EdgeInsets.fromLTRB(50, 0, 50, 50)),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text(
                  'ADDDATA',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TextF ()));
                },
              )),
          SizedBox(height: 40,),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text(
                  'TAKEDATA',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserInformation ()));
                }
              )),
        ],
      ),
    );
  }
}
