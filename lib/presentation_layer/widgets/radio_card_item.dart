import 'package:flutter/material.dart';
import 'package:muslim/data_layer/bloc/cubit.dart';
import 'package:muslim/presentation_layer/models/radio_data_model/radio_data_model.dart';

Widget cardRadioItem({
  required BuildContext context,
  required channelIndex,
  required String channelName,
}) {
  var cubit = MuslimCubit.get(context);
  return Card(
    color: Theme.of(context).appBarTheme.backgroundColor,
    elevation: 7,
    child: InkWell(
      onTap: () {
        cubit.playingRadio(
            RadioDataModel.getServer(channelIndex), channelIndex);
        cubit.changeRadioChanel(channelIndex);
        print(RadioDataModel.getServer(channelIndex));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_border)),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://26.mchs.gov.ru/uploads/resize_cache/news/2021-02-12/vsemirnyy-den-radio_1613124797641637987__800x800.jpg'),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Live Now',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Text(
                channelName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: cubit.currentRadioChanel == channelIndex &&
                              cubit.isStop != true
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.bodyText2!.color,
                    ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
