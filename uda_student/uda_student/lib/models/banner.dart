

import 'package:cloud_firestore/cloud_firestore.dart';

class Banner1 {
  String img;
  String title;

  Banner1({ required this.title, required this.img });
  Banner1.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : img = doc.data()!["img"],
        title = doc.data()!["title"];

  factory Banner1.fromJson(Map<String, dynamic> json) {
    return Banner1(
      img: json['img'],
      title: json['title'],
    );
  }
}
//
// List<Banner1> bannersList = [
//   Banner1(title: 'Đông Á 1', img: 'assets/images/banner1.jpg'),
//   Banner1(title: 'Đông Á 2', img: 'assets/images/banner2.jpg'),
//   Banner1(title: 'Đông Á 3', img: 'assets/images/banner3.jpg'),
//   Banner1(title: 'Đông Á 4', img: 'assets/images/banner4.png')
// ];

