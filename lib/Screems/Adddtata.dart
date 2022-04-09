//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// class Async extends StatefulWidget {
//   @override
//   State<Async> createState() => _AsyncState();
// }
//
// class _AsyncState extends State<Async> {
//
//   @override
//   Widget build(BuildContext context) {
//     final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('NotesBook').snapshots();
//
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('This data'),
//         ),
//         body: StreamBuilder<QuerySnapshot>(
//           stream: _usersStream,
//           builder: (BuildContext context,
//               AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               return Text('Something went wrong');
//             }
//
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Text("Loading");
//             }
//
//             return ListView(
//               children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                 Map<String, dynamic> data = document.data()! as Map<
//                     String,
//                     dynamic>;
//                 return ListTile(
//                   title: Text(data['Text']),
//                   subtitle: Text(data['title']),
//                 );
//               }).toList(),
//             );
//           },
//         )
//
//     );
//   }
//
//
// }
//
// class UserInformation extends StatefulWidget {
//   @override
//   _UserInformationState createState() => _UserInformationState();
// }
//
// class _UserInformationState extends State<UserInformation> {
//   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('NotesBook').snapshots();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  StreamBuilder<QuerySnapshot>(
//         stream: _usersStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('Something went wrong');
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Text("Loading");
//           }
//           return ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//               return ListTile(
//                 title: Text(data['title']),
//                 subtitle: Text(data['text']),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }