import 'package:get/get.dart';

abstract class PostsController<T> extends GetxController {
  RxList<T> list = <T>[].obs;

  RxInt page = RxInt(0);
  RxBool loading = RxBool(false);
  RxBool empty = RxBool(false);

  Future<void> getPost() async {
    if (loading.isTrue || empty.isTrue) {
      return;
    }

    loading.value = true;

    try {
      List<T> _list = await getContent();

      if (_list.isNotEmpty) {
        list.addAll(_list);
        list.refresh();
        page.value++;
      } else {
        empty.value = true;
      }
    } catch (_) {
      // ignore: avoid_print
      print(_);
    }

    loading.value = false;
  }

  Future<List<T>> getContent() async {
    return <T>[];
  }
}
