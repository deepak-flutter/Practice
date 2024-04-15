import 'package:get/get.dart';

class FontChangeController extends GetxController{


  String? currentFontFamily;
  List<String> fontFamilyList = ['Genos', 'RobotoMono', 'DancingScript'];
  String selectedItem = '';

  onSelect(String value){
    selectedItem = value;
    print(selectedItem);
  }
}