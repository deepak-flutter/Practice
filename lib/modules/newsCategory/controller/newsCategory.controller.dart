import 'package:get/get.dart';
import 'package:untitled/utils/routes.util.dart';

import '../../newsPage/view/newsPage.view.dart';

class NewsCategoryController extends GetxController {
  List<String> categoryList = [
    "business",
    "entertainment",
    "health",
    "science",
    "sports",
    "technology"
  ];

  onClick(String category){
    print(category);
    RoutesUtil.to(()=>NewsPageView(category: category));
  }
}
