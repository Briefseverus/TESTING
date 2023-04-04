import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/home_tab.dart';
import '../../theme/color.dart';
import '../../theme/text.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('Quản Lý', style: kTextTitle),

          const SizedBox(height: 15),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: kTextBG,
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: homeTabs.length,
                  itemBuilder: (ctx, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () => Get.toNamed(homeTabs[index].to),
                      child: Container(
                        color: homeTabs[index].color,
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [

                            Image.asset(homeTabs[index].image, width: 50, height: 50),

                            const SizedBox(height: 10),

                            Text(homeTabs[index].title, style: kTextTitle.copyWith(color: Colors.white, fontSize: 18))

                          ],
                        ),
                      ),
                    ),
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
