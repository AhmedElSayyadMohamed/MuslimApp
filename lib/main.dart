import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/presentation_layer/layout/layout.dart';
import 'package:muslim/presentation_layer/shared/app_style/app_theme.dart';
import 'package:muslim/presentation_layer/shared/constant.dart';
import 'package:muslim/web_services/dio_helper.dart';
import 'package:muslim/web_services/shared_prefrence.dart';

import 'data_layer/bloc/cubit.dart';
import 'data_layer/bloc/states.dart';
import 'data_layer/bloc_observer/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CachHelper.init();
  if (CachHelper.getData(key: 'isDark') == null) {
    isDark = false;
  } else {
    isDark = CachHelper.getData(key: 'isDark');
  }
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MuslimCubit()
            ..getAllReciter()
            ..getAllRadioData(),
        ),
      ],
      child: BlocConsumer<MuslimCubit, MuslimStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MuslimApp',
            theme: isDark ? darkMode : lightMode,
            home: LayoutScreen(),
          );
        },
      ),
    );
  }
}
