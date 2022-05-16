import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/data_layer/bloc/states.dart';
import 'package:muslim/presentation_layer/models/radio_data_model/radio_data_model.dart';
import 'package:muslim/presentation_layer/models/reciter_model/reciter_model.dart';
import 'package:muslim/presentation_layer/models/surah_model/surah_model.dart';
import 'package:muslim/presentation_layer/modules/favourite/favourite_screen.dart';
import 'package:muslim/presentation_layer/modules/home/home_screen.dart';
import 'package:muslim/presentation_layer/modules/radio/radio_screen.dart';
import 'package:muslim/presentation_layer/shared/constant.dart';
import 'package:muslim/presentation_layer/shared/end_points/end_points.dart';
import 'package:muslim/presentation_layer/shared/surahs_name.dart';
import 'package:muslim/web_services/dio_helper.dart';
import 'package:muslim/web_services/shared_prefrence.dart';

class MuslimCubit extends Cubit<MuslimStates> {
  MuslimCubit() : super(InitialState());
  static MuslimCubit get(BuildContext context) => BlocProvider.of(context);
  //////////////////////////////////////////////
  int bottomNavBarIndex = 0;
  double maxSurahTime = 0;
  double positionSurahTime = 0;
  bool isSearch = false;
  var searchController = TextEditingController();
  int totalTasbiha = 0;
  int tasbihaPage = 0;
  // double maxTasbih = 33;
  double tasbeh = 0;
  int surahDuration = 0;
  int onAudioPositionChanged = 0;
  List<int> favouriteReciter = [];
  List<String> reciterSearch = [];

  ////////////////////////////////////////////////////////
  List<BottomNavigationBarItem> bottomNavBarList = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.radio),
      label: 'Radio',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outlined), label: 'Favourite'),
  ];

  List<Widget> screen = [
    HomeScreen(),
    RadioScreen(),
    FavouriteScreen(),
  ];

  void toggleAppMode() {
    isDark = !isDark;
    CachHelper.setData(value: isDark, key: 'isDark');
    emit(ChangeState());
  }

  void changeBottomNavBarIndex(int index) {
    bottomNavBarIndex = index;
    emit(MuslimChangeBottomNavBarIndex());
  }

  ///////////////sebhaMethod//////////////

  void changeSebhaSlide(double value) {
    tasbeh = value;
    emit(ChangeTasbihaSliderState());
  }

  void changeState() {
    emit(ChangeState());
  }

  void changeTasbihaCount() {
    ++totalTasbiha;
    emit(ChangeTasbihaCountState());
  }

  /////////////// listening quran screen //////////////////

  bool isReciterAtFistElement = false;
  void changeIsReciterAtFirstIndex() {
    isReciterAtFistElement = !isReciterAtFistElement;
    emit(ChangeIsReciterAtFistElementState());
  }

  int currentReciter = 0;
  int currentSurah = 0;
  void chooseReciter(int reciterIndex) async {
    currentReciter = reciterIndex;
    playingSurah();
    emit(ChangeReciterState());
  }

  void makeReciterInFavourite(int index) {
    ReciterModel.allReciter[index]['inFavourite'] =
        !ReciterModel.allReciter[index]['inFavourite'];
    changeState();
  }

  final assetsAudioPlayer = AssetsAudioPlayer();
  bool isPlay = false;
  bool isStop = true;
  void playingSurah() async {
    isPlay = true;
    if (isPlay) isStop = false;
    changeState();

    await assetsAudioPlayer.open(
      Audio.network(
        ReciterModel.getReciterServer(currentReciter) +
            ReciterModel.getReciterSuras(currentSurah),
        metas: Metas(
          title: surahsName[currentSurah]['name'],
          artist: ReciterModel.getReciterName(currentReciter),
          // album: "CountryAlbum",
          image: MetasImage.network(
              ReciterModel.allReciter[currentReciter]['image']),
        ),
      ),
      showNotification: true,
    );
  }

  void playingRadio(String radioUrl, int index) async {
    isPlay = true;
    if (isPlay) isStop = false;
    changeState();
    assetsAudioPlayer.open(
        Audio.liveStream(
          radioUrl,
          metas: Metas(
              // title: RadioDataModel.getName(index),
              artist: RadioDataModel.getName(index),
              image: const MetasImage.network(
                  'https://26.mchs.gov.ru/uploads/resize_cache/news/2021-02-12/vsemirnyy-den-radio_1613124797641637987__800x800.jpg')),
        ),
        showNotification: true,
        notificationSettings: const NotificationSettings(
          stopEnabled: true,
          nextEnabled: false,
          prevEnabled: false,
          playPauseEnabled: true,
        ));
  }

  void changeSurah(int surahIndex) {
    currentSurah = surahIndex;
    emit(ChangeState());
  }

  int currentRadioChanel = 0;
  void changeRadioChanel(int channelIndex) {
    currentRadioChanel = channelIndex;
    emit(ChangeState());
  }

  void playingOrPauseSurah() async {
    isPlay = !isPlay;
    await assetsAudioPlayer.playOrPause();
    emit(ToggleCurrentIconState());
  }

  void stopSurah() async {
    await assetsAudioPlayer.stop();

    isStop = true;
    isPlay = false;
    currentSurah = 0;
    emit(StopPlayingState());
  }

  void playNextSurah() {
    if (isPlay) isStop = false;
    if (currentSurah < 114) {
      ++currentSurah;
      playingSurah();
    } else {
      return;
    }

    emit(PlayingNextState());
  }

  void playPreviousSurah() {
    if (currentSurah > 0) {
      --currentSurah;
      playingSurah();
    } else {
      return;
    }

    emit(PlayingPreviousState());
  }

  void maxAndPositionAndSeekTime() {
    assetsAudioPlayer.current.listen((d) {
      if (d == null) {
      } else {
        maxSurahTime = d.audio.duration.inSeconds.toDouble();
        print(maxSurahTime);
      }
    });
    changeState();

    assetsAudioPlayer.currentPosition.listen((Duration p) {
      print(p.inSeconds.toDouble());
      positionSurahTime = p.inSeconds.toDouble();
      if (positionSurahTime == maxSurahTime - 1) {
        isPlay = false;
      }
      changeState();
    });
  }

  void searchAboutReciter(String value) {
    ReciterModel.allReciter.forEach((element) {
      if (element['name'].contains(value)) {
        ReciterModel.allReciter.add(element);
        changeState();
      } else
        return;
    });
  }
  /////////////readJson////////////////////

  void getAllReciter() {
    emit(QuranReciterDataLoadingState());

    DioHelper.readJson(jsonPath: allReciterEndPoint).then((value) {
      ReciterModel.allData = List<Map<String, dynamic>>.from(value);
      ReciterModel.allData!.forEach((element) {
        if (int.parse(element['count']) == 114) {
          ReciterModel.allReciter.add(element);
          element['inFavourite'] = false;
        } else {
          return;
        }
      });
      emit(QuranReciterDataSuccessState());
    }).catchError((error) {
      print("error when get all reciter :${error.toString()}");

      emit(QuranReciterDataErrorState());
    });
  }

  void getAllRadioData() {
    emit(GetAllRadioDataLoadingState());
    DioHelper.readJson(jsonPath: allRadioEndPoint).then((value) {
      RadioDataModel.radioDataList = List<Map<String, dynamic>>.from(value);

      emit(GetAllRadioDataSuccessState());
    }).catchError((error) {
      print('error when getAllRadioData: ${error.toString()}');
      emit(GetAllRadioDataErrorState());
    });
  }
}
