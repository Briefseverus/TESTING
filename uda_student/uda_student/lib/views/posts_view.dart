import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../components/post/post_item_view.dart';
import '../models/notify.dart';
import '../theme/color.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key, required this.title}) : super(key: key);

  final String title;

  static const String route = '/posts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(title, style: const TextStyle(
                color: kTextColor
            )),
            elevation: 0,
            centerTitle: false,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Ionicons.arrow_back, color: kTextColor)
            )
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [

                const SizedBox(height: 20),

                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: notifiesList.length,
                  itemBuilder: (ctx, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: PostItemView(post: notifiesList[index]),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
