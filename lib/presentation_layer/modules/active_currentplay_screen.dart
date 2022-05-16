import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/data_layer/bloc/cubit.dart';
import 'package:muslim/data_layer/bloc/states.dart';
import 'package:muslim/presentation_layer/models/reciter_model/reciter_model.dart';
import 'package:muslim/presentation_layer/shared/surahs_name.dart';
import 'package:muslim/presentation_layer/widgets/playing_model_sheet.dart';

class ActiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MuslimCubit, MuslimStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = MuslimCubit.get(context);

        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                child: ClipRect(
                  child: Image(
                    image: NetworkImage(
                        ReciterModel.allReciter[cubit.currentReciter]['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Slider(
                value: cubit.positionSurahTime,
                max: cubit.maxSurahTime,
                min: 0,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (value) {
                  cubit.assetsAudioPlayer
                      .seek(Duration(seconds: value.toInt()));
                  cubit.maxAndPositionAndSeekTime();
                  // value = cubit.positionSurahTime;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reFormatDuration(
                        context: context, time: cubit.positionSurahTime),
                    reFormatDuration(
                        context: context, time: cubit.maxSurahTime),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "سورة " + surahsName[cubit.currentSurah]['name'],
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                    Text(
                      "الشيخ " +
                          ReciterModel.allReciter[cubit.currentReciter]['name'],
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.cloud_download_outlined,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.playPreviousSurah();
                    },
                    splashRadius: 25,
                    icon: Icon(
                      Icons.skip_previous,
                      size: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.2),
                    child: IconButton(
                      onPressed: () {
                        cubit.playingOrPauseSurah();
                      },
                      splashRadius: 25,
                      icon: cubit.isPlay
                          ? Icon(
                              Icons.pause,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            )
                          : Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  IconButton(
                    onPressed: () {
                      //   // cubit.makeAudioLoop();
                      cubit.playNextSurah();
                    },
                    splashRadius: 25,
                    icon: Icon(
                      Icons.skip_next,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      size: 30,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
