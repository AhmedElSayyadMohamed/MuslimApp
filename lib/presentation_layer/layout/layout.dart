import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/data_layer/bloc/cubit.dart';
import 'package:muslim/data_layer/bloc/states.dart';
import 'package:muslim/presentation_layer/modules/active_currentplay_screen.dart';
import 'package:muslim/presentation_layer/shared/constant.dart';
import 'package:muslim/presentation_layer/widgets/playing_model_sheet.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MuslimCubit, MuslimStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = MuslimCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Muslim',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              actions: [
                IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  onPressed: () {
                    cubit.toggleAppMode();
                  },
                  icon: Icon(
                    isDark ? Icons.wb_sunny_outlined : Icons.brightness_2,
                    size: 30,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
            bottomSheet: cubit.isStop
                ? const SizedBox()
                : modelBottomSheet(
                    context: context,
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Theme.of(context).backgroundColor,
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => ActiveScreen(),
                      );
                    },
                  ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomNavBarList,
              currentIndex: cubit.bottomNavBarIndex,
              onTap: (currentBottomNavIndex) {
                cubit.changeBottomNavBarIndex(currentBottomNavIndex);
              },
            ),
            body: cubit.screen[cubit.bottomNavBarIndex],
          ),
        );
      },
    );
  }
}
