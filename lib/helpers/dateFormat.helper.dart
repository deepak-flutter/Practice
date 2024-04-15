class DateFormatHelper {
  static String dateTimeConverter(DateTime dateTime) {
    List<String> dateSplitList = dateTime.toString().substring(0, 10).split("-");
    return "${dateSplitList[2]}-${dateSplitList[1]}-${dateSplitList[0]}";
  }


}
