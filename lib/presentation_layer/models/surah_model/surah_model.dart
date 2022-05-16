class QuranSurahsModel {
  int? code;
  String? status;
  static List<dynamic>? surahs;
  QuranSurahsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    surahs = json['data']['surahs'];
  }

  static getAllAyahs(int index) {
    return surahs![index]['ayahs'];
  }

  static Map getAllAyah(int index, int ayahIndex) {
    return surahs![index]['ayahs'][ayahIndex];
  }

  static int getSurahNumber(int index) {
    return surahs![index]['number'];
  }

  static String getSurahName(int index) {
    return surahs![index]['name'];
  }

  static String getSurahEnglishName(int index) {
    return surahs![index]['englishName'];
  }

  static String getSurahRevelationType(int index) {
    return surahs![index]['revelationType'];
  }
}

class AyahModel {
  List? ayahat;
  String? audio;
  int? number;
  String? ayahText;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  dynamic? sajda;

  AyahModel.fromJson(Map<String, dynamic> json) {
    audio = json['audio'];
    number = json['number'];
    ayahText = json['text'];
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'];
  }
}
