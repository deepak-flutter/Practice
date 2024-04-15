import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:untitled/api/call.api.dart';
import 'package:untitled/models/news.model.dart';

class HiveController extends GetxController {
  HiveController() {
    print("Constructor");
    // Future.delayed(const Duration(milliseconds: 250), () => apiCall(),);
    // hiveCall();
    // Future.delayed(const Duration(milliseconds: 300), () => isConnected());
    // isConnected();
    hiveGet();
    // hiveSet();
  }

  init() {
    print("init");
  }

  Map<dynamic, dynamic> catData = {
    "fact": "The leopard is the most widespread of all big cats.",
    "length": 51
  };

  RxString fact = "".obs;
  RxList? newsList = [].obs;

  List data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List existingData = [];

  void apiCall() async {
    // final res = await http.get(Uri.parse("https://catfact.ninja/fact"));
    var res = await ApiCall.get(
        "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=26ef454f72424685bb87ab491ee9c446");

    NewsModel newsRes = NewsModel.fromJson(res);
    if (newsRes.status == "ok") {
      newsList?.addAll(newsRes.articles!);
      // hiveSet(newsRes.articles!);
    }

    // PublicModel modelRes = PublicModel.fromJson(publicData);
    // print("Model res: : ${modelRes.entries}");

    // publicList.value = modelRes.entries!;
    // print(modelRes.entries?[0].description);
    // hiveCall(modelRes.entries!);

    // fact.value = modelRes.fact!;
    // hiveCall(fact.value);
  }

  void hiveSet() async {
    var box = await Hive.openBox('newsData');
    // await box.clear();

    existingData = await box.get('newsData');
    existingData.addAll(data);
    print(existingData);

    await box.put('newsData', existingData);

    // Box box = Hive.box('newsData');

    // await box.add(data);
    // await box.delete('newsData');

    print('Put News Article: ${box.get('newsData')}');
  }

  void hiveGet() async {
    var box = await Hive.openBox('newsData');

    // Box box = Hive.box('newsData');
    if (box.get("newsData") == null) {
      print("No Internet");
    } else {
      var res = box.get("newsData");
      // newsList?.value = get;
      print(res);

      // newsList?.addAll(res.sublist((res.length - 5), res.length));
      // print(newsList);

      // newsList?.addAll(get);
      //
      // print(newsList?[0].title);
    }
  }

  void isConnected() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    print(connectivityResult);

    if (connectivityResult != ConnectivityResult.none) {
      Future.delayed(
        const Duration(milliseconds: 250),
        () => apiCall(),
      );
    } else {
      hiveGet();
    }
  }
}
