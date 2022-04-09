import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pdf extends StatefulWidget {


  @override
  State<pdf> createState() => _pdfState();
}

class _pdfState extends State<pdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pdfdata'),
      ),

    );


  }
}


class Books {
  String name;
  String image;
  Books({required this.image,required this.name});
}
List<Books> _list =<Books>[
 Books(image: 'asset/image.jpg', name: 'Allama iqbal'),
  Books(image: 'asset/img.png', name: 'Dewan Ghalib'),
  Books(image: 'asset/img_1.png', name: 'Parveen Shakir'),
  Books(image: 'asset/img_2.png', name: 'Kuliat Faraz'),
  Books(image: 'asset/img_3.png', name: 'Kuliat Meer'),
  Books(image: 'asset/img_4.png', name: 'Sad Peotry'),
  Books(image: 'asset/img_5.png', name: 'Islamic Education'),
  Books(image: 'asset/img_7.png', name: 'Heer Rajha affection'),
  Books(image: 'asset/img_8.png', name: 'Historic .....'),
  Books(image: 'asset/img_9.png', name: 'Great Woman'),


];
List<Books> get usama=>_list;





