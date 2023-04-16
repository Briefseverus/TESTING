import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uda_qlsv/models/banner.dart';

class HomeBanners extends StatelessWidget {
  HomeBanners({Key? key}) : super(key: key);
  CollectionReference banner = FirebaseFirestore.instance.collection("banner");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Banner1>>(
        stream: readBanner1(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Text('Something went wrong!, ${snapshot.error}');
          }else if(snapshot.hasData) {
            final products = snapshot.data!;
            return CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items:  products.map(buildBanner).toList(),
            );
          }else{
            return Center(child:CircularProgressIndicator());
          }
        });
  }
}

Stream<List<Banner1>> readBanner1() =>
    FirebaseFirestore.instance.collection('banner').snapshots().map((snapshot) => snapshot.docs.map((doc) => Banner1.fromJson(doc.data())).toList());
Widget buildBanner (Banner1 banner) =>Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(banner.img, fit: BoxFit.cover, width: 350.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    banner.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );

// final List<Widget> imageSliders = bannersList
//     .map((item) => Container(
//       margin: const EdgeInsets.all(5.0),
//       child: ClipRRect(
//           borderRadius: const BorderRadius.all(Radius.circular(5.0)),
//           child: Stack(
//             children: <Widget>[
//               Image.asset(item.img, fit: BoxFit.cover, width: 1000.0),
//               Positioned(
//                 bottom: 0.0,
//                 left: 0.0,
//                 right: 0.0,
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Color.fromARGB(200, 0, 0, 0),
//                         Color.fromARGB(0, 0, 0, 0)
//                       ],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                     ),
//                   ),
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 10.0, horizontal: 20.0),
//                   child: Text(
//                     item.title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )),
//     ))
//     .toList();
