import 'package:flutter/material.dart';
import 'package:uda_qlsv/abstract/post.dart';

import '../../theme/color.dart';

class PostItemView extends StatelessWidget {
  const PostItemView({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Column(
         children: [
           Text(
             post.name!,
             style: const TextStyle(
                 color: kTextColor, fontSize: 16, fontWeight: FontWeight.w500),
           ),
           const SizedBox(height: 10),
           const Text('17/04/2020', style: TextStyle(color: Colors.grey))
         ],
       ),
        SizedBox(
          width: 80,
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.download))
      ],
    );
  }
}

