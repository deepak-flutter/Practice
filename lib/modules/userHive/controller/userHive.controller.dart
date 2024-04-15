import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:untitled/api/call.api.dart';
import '../../../models/news.model.dart';


class UserHiveController extends GetxController{
  RxString name = "".obs;
  RxInt age = 0.obs;
  RxString id = "".obs;

  UserHiveController(){
    isConnected();
  }

  void isConnected() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    print(connectivityResult);

    if (connectivityResult != ConnectivityResult.none) {
      // hivePut();
      apiCall();
    } else {
      hiveGet();
    }
  }
  
  void apiCall() async{
    var res = await ApiCall.get("https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=26ef454f72424685bb87ab491ee9c446");

    NewsModel newsResponse = NewsModel.fromJson(res);
    
    print(newsResponse!.articles);

    hivePut(newsResponse.articles!);
  }

  hivePut(List<Articles> articles) async{
    var box = await Hive.openBox("user");

    box.put("newsData", articles);
    name.value = "user";
    id.value = "0";
  }

  hiveGet() async{
    var box = await Hive.openBox("user");
    var res = box.get("newsData");

    print("Response: ${res[0].author}");
    // name.value = res.name;
    // age.value = 0;
    // id.value = res.id;
  }

}