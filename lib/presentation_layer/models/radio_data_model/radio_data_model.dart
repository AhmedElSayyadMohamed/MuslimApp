class RadioDataModel {
  static List<Map<String, dynamic>>? radioDataList;

  static String getServer(int index) {
    return radioDataList![index]["URL"];
  }

  static String getName(int index) {
    return radioDataList![index]["Name"];
  }

  static String getId(int index) {
    return radioDataList![index]["id"];
  }

  static bool getFav(int index) {
    return radioDataList![index]["fav"];
  }

  static bool getBool(int index) {
    return radioDataList![index]["bool"];
  }
}
