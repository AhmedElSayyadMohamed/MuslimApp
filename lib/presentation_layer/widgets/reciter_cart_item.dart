import 'package:flutter/material.dart';
import 'package:muslim/data_layer/bloc/cubit.dart';
import 'package:muslim/presentation_layer/models/reciter_model/reciter_model.dart';

Widget reciterCardItem({
  required BuildContext context,
  required int index,
}) {
  var cubit = MuslimCubit.get(context);
  return InkWell(
    onTap: () {
      cubit.chooseReciter(index);
    },
    borderRadius: BorderRadius.circular(20),
    child: Stack(alignment: Alignment.topRight, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 54,
            backgroundColor: cubit.currentReciter != index
                ? Colors.grey[200]
                : Theme.of(context).primaryColor,
            child: CircleAvatar(
              radius: 52,
              backgroundImage:
                  NetworkImage(ReciterModel.allReciter[index]['image']),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.46,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cubit.currentReciter != index
                  ? Colors.grey[200]
                  : Theme.of(context).primaryColor,
            ),
            child: Card(
              child: Center(
                child: Text(
                  ReciterModel.allReciter[index]['name'],
                  textDirection: TextDirection.rtl,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ),
        ],
      ),
      IconButton(
        splashRadius: 25,
        onPressed: () {
          cubit.makeReciterInFavourite(index);
          print(ReciterModel.allReciter[index]);
        },
        icon: ReciterModel.allReciter[index]['inFavourite'] == true
            ? Icon(Icons.favorite, color: Theme.of(context).primaryColor)
            : const Icon(Icons.favorite_outline_rounded),
      ),
    ]),
  );
}
