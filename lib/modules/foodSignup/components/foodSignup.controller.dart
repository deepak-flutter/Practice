import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../models/json.model.dart';

class FoodSignupController extends GetxController {
  Logger logger = Logger();

  FoodSignupController() {
    Future.delayed(
      200.milliseconds,
      () {
        postData();
      },
    );
  }

  Future<dynamic> getData() async {
    // final uri = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    final uri = Uri.parse('https://flavor-crave.onrender.com/api/get-all-item');
    final res = await http.get(uri);

    var encodeFirst = json.encode(res.body);

    var values = json.decode(encodeFirst);
    // JsonModel jsonModel = JsonModel.fromJson(values);

    logger.i(values);
  }

  Future<dynamic> postData() async {
    Map<String, dynamic> data = {
      "name": "Deepak",
      "email": "aac@gmail.com",
      "password": "1234",
      "confirmPassword": "1234"
    };

    final uri = Uri.parse('https://flavor-crave.onrender.com/api/signup');
    logger.i(uri);
    final res = await http.post(uri, body: data);
    logger.i("res");
    var encodeFirst = json.encode(res.body);
    var values = json.decode(encodeFirst);
    logger.i(values);
  }
}
