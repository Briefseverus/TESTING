import 'package:flutter/material.dart';

import 'package:uda_qlsv/abstract/post.dart';
import 'package:uda_qlsv/components/post/post_item_view.dart';

class PostBodyView extends StatelessWidget {
  const PostBodyView({
    Key? key,
    required this.posts,
    required this.onClick,
  }) : super(key: key);

  final List<Post> posts;
  final Function(Post post) onClick;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: posts.length,
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => onClick(posts[index]),
              child: PostItemView(post: posts[index]),
            ),
          ],
        ),
      ),
    );
  }

  Widget showBackground(int direction) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      color: direction == 0 ? Colors.red : const Color.fromARGB(255, 168, 9, 9),
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        size: 30.0,
        color: Colors.white,
      ),
    );
  }
}
