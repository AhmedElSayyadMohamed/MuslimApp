import 'package:flutter/material.dart';
import 'package:muslim/data_layer/bloc/cubit.dart';

class QuranScreenSearch {
  static Widget toggleBetweenTitleInAppBar(context) {
    var cubit = MuslimCubit.get(context);
    if (cubit.isSearch) {
      return Center(
        child: TextField(
          controller: cubit.searchController,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
              hintTextDirection: TextDirection.rtl,
              border: InputBorder.none,
              hintText: 'أبحث عن سورة او شيخ',
              hintStyle: TextStyle(
                fontSize: 18,
                color: Theme.of(context).primaryColor,
              )),
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
          onChanged: (value) {
            cubit.searchAboutReciter(value);
          },
        ),
      );
    } else {
      return Text(
        'Muslim',
        style: Theme.of(context).textTheme.bodyText2,
      );
    }
  }

  static Widget toggleBetweenLeadingInAppBar(context) {
    var cubit = MuslimCubit.get(context);
    if (!cubit.isSearch) {
      return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).iconTheme.color,
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  static List<Widget> toggleBetweenActionInAppBar(context) {
    var cubit = MuslimCubit.get(context);
    if (cubit.isSearch) {
      return [
        IconButton(
          onPressed: () {
            stopSearch(context);
            cubit.isSearch = false;
            cubit.changeState();
          },
          icon: const Icon(
            Icons.clear,
            size: 27,
          ),
          color: Theme.of(context).iconTheme.color,
        )
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            startSearch(context);
            cubit.changeState();
          },
          icon: Icon(
            Icons.search,
            size: 27,
            color: Theme.of(context).iconTheme.color,
          ),
        )
      ];
    }
  }

  static void startSearch(context) {
    var cubit = MuslimCubit.get(context);

    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
      onRemove: () {
        stopSearch(context);
      },
    ));
    cubit.isSearch = true;
  }

  static void stopSearch(context) {
    var cubit = MuslimCubit.get(context);
    cubit.searchController.clear();
    cubit.isSearch = false;
  }
}
