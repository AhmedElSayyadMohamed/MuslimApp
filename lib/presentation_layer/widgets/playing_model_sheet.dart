import 'package:flutter/material.dart';
import 'package:muslim/data_layer/bloc/cubit.dart';
import 'package:muslim/presentation_layer/models/reciter_model/reciter_model.dart';
import 'package:muslim/presentation_layer/shared/surahs_name.dart';

Widget modelBottomSheet({
  required BuildContext context,
  required onTap,
}) {
  var cubit = MuslimCubit.get(context);

  return InkWell(
    onTap: onTap,
    child: Container(
      color: Theme.of(context).backgroundColor,
      width: double.infinity,
      height: 70,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.3,
            child: ClipRect(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(10),
                  ),
                ),
                child: Image(
                  image: NetworkImage(
                      ReciterModel.allReciter[cubit.currentReciter]['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.37,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        surahsName[cubit.currentSurah]['name'],
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Text(
                      ReciterModel.allReciter[cubit.currentReciter]['name'],
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.playingOrPauseSurah();
                },
                splashRadius: 25,
                icon: cubit.isPlay
                    ? const Icon(
                        Icons.pause,
                        size: 30,
                      )
                    : const Icon(
                        Icons.play_arrow,
                        size: 30,
                      ),
              ),
              IconButton(
                onPressed: () {
                  cubit.stopSurah();
                },
                splashRadius: 25,
                color: Colors.redAccent,
                icon: const Icon(
                  Icons.stop,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.playNextSurah();
                },
                splashRadius: 25,
                icon: const Icon(
                  Icons.skip_next,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget reFormatDuration({
  required BuildContext context,
  required time,
}) {
  var hours = (time / (60 * 60)).floor();
  var minutes = ((time - hours * 60 * 60) / 60).floor();
  var second = ((time - hours * 60 * 60 - minutes * 60)).floor();
  String convertedTime =
      '${hours.toString()}:${minutes.toString()}:${second.toString()}';
  return Text(
    convertedTime,
    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
  );
}
