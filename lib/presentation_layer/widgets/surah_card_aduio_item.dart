import 'package:audio_wave/audio_wave.dart';
import 'package:flutter/material.dart';
import 'package:muslim/data_layer/bloc/cubit.dart';
import 'package:muslim/presentation_layer/models/radio_data_model/radio_data_model.dart';

Widget surahCardItem({
  required BuildContext context,
  required surahIndex,
  required String surahName,
  required onTap,
}) {
  var cubit = MuslimCubit.get(context);
  return Card(
    elevation: 2,
    color: Theme.of(context).scaffoldBackgroundColor,
    child: InkWell(
      onTap: onTap,
      splashColor: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          cubit.currentSurah == surahIndex
              ? Container(
                  color: Colors.teal,
                )
              : const SizedBox(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.08,
            child: Center(
              child: Text(
                surahName,
                maxLines: 1,
                textDirection: TextDirection.rtl,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: cubit.currentSurah == surahIndex &&
                              cubit.isStop != true
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.bodyText2!.color,
                    ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            splashRadius: 25,
            icon: Icon(
              Icons.pending_outlined,
              color: cubit.currentSurah == surahIndex && cubit.isStop != true
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).textTheme.bodyText2!.color,
            ),
          ),
        ],
      ),
    ),
  );
}

// AudioWave(
//         animation: cubit.isPlay ? true : false,
//         height: 32,
//         width: 88,
//         spacing: 2.5,
//         bars: [
//           AudioWaveBar(height: 10, color: Colors.lightBlueAccent),
//           AudioWaveBar(height: 30, color: Colors.blue),
//           AudioWaveBar(height: 70, color: Colors.black),
//           AudioWaveBar(height: 40),
//           AudioWaveBar(height: 20, color: Colors.orange),
//           AudioWaveBar(height: 10, color: Colors.lightBlueAccent),
//           AudioWaveBar(height: 30, color: Colors.blue),
//           AudioWaveBar(height: 70, color: Colors.black),
//           AudioWaveBar(height: 40),
//           AudioWaveBar(height: 20, color: Colors.orange),
//           AudioWaveBar(height: 10, color: Colors.lightBlueAccent),
//           AudioWaveBar(height: 30, color: Colors.blue),
//           AudioWaveBar(height: 70, color: Colors.black),
//           AudioWaveBar(height: 40),
//           AudioWaveBar(height: 20, color: Colors.orange),
//           AudioWaveBar(height: 10, color: Colors.lightBlueAccent),
//           AudioWaveBar(height: 30, color: Colors.blue),
//           AudioWaveBar(height: 70, color: Colors.black),
//           AudioWaveBar(height: 40),
//           AudioWaveBar(height: 20, color: Colors.orange),
//         ],
//       )
