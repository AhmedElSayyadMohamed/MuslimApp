class ReciterModel {
  static List<Map<String, dynamic>>? allData;
  static List<Map<String, dynamic>> allReciter = [];

  static String getReciterID(int index) {
    return allReciter[index]['id'];
  }

  static String getReciterName(int index) {
    return allReciter[index]['name'];
  }

  static String getReciterServer(int index) {
    return allReciter[index]['Server'] + "/";
  }

  static String getReciterSurasCount(int index) {
    return allReciter[index]['count'];
  }

  static String getReciterRewaya(int index) {
    return allReciter[index]['rewaya'];
  }

  static String getReciterFirstLetter(int index) {
    return allReciter[index]['letter'];
  }

  static String getReciterSuras(int index) {
    List<String> getReciterAllSurahs = [];
    allReciter[index]['suras'].split(',').forEach((e) {
      if (int.parse(e) <= 9) {
        e = ("00" + e + ".mp3");
        getReciterAllSurahs.add(e);
      } else if (int.parse(e) > 9 && int.parse(e) <= 99) {
        e = ("0" + e + ".mp3");
        getReciterAllSurahs.add(e);
      } else {
        e = (e + ".mp3");
        getReciterAllSurahs.add(e);
      }
    });

    return getReciterAllSurahs[index];
  }
}
