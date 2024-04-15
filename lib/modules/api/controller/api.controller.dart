import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  ScrollController scrollController = ScrollController();

  RxString stringResponse = "".obs;
  RxString id = "".obs;
  RxString email = "".obs;
  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString avatar = "".obs;

  late Map mapResponse;
  late Map dataResponse;
  RxList listResponse = [].obs;

  int index = 1;

  Future apiCall(int index) async {
    print("Api Call");
    http.Response response;
    response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=$index"));
    // Single User Data: https://reqres.in/api/users/2
    // User user = User.fromJson(response);

    print("Api Called $response");

    if (response.statusCode == 200) {
      mapResponse = json.decode(response.body);
      print(mapResponse['data']);
      // listResponse.value = listResponse + mapResponse['data'];
      listResponse.value = [...listResponse, ...mapResponse['data']];
      dataResponse = listResponse[0];
      // stringResponse.value = dataResponse['email'].toString();
      id.value = dataResponse['id'].toString();
      email.value = dataResponse['email'].toString();
      firstName.value = dataResponse['first_name'].toString();
      lastName.value = dataResponse['last_name'].toString();
      avatar.value = dataResponse['avatar'].toString();
    } else {
      print(response.statusCode);
    }

    print("Response");
    // print("Response: $listResponse");
  }

  onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (index == mapResponse['total_pages']) {
        index = 0;
      }
      apiCall(++index);
      print("Call");
    } else {
      print("Scroll");
    }
  }
}
