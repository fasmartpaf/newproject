import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;
class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('NotesBook').snapshots();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Padding(padding:EdgeInsets.fromLTRB(0, 200, 0, 0),
       child: Center(child:
        Text('Something went wrong'))
        ) ;

      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Padding(padding:EdgeInsets.fromLTRB(0, 200, 0, 0),
            child: Center(
                child:
            CircularProgressIndicator(
              color: Colors.lightBlueAccent,
                      backgroundColor: Colors.red,
            )
        ));
      }
      return ListView(
        children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          return ListTile(
            title: Text(data['title']),
            subtitle: Text(data['Text']),
          );
        }).toList(),
      );
    },
    ),

    );

}
  }


