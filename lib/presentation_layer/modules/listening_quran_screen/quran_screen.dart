import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/data_layer/bloc/cubit.dart';
import 'package:muslim/data_layer/bloc/states.dart';
import 'package:muslim/presentation_layer/models/reciter_model/reciter_model.dart';
import 'package:muslim/presentation_layer/modules/active_currentplay_screen.dart';
import 'package:muslim/presentation_layer/modules/search/quran_screen_search.dart';
import 'package:muslim/presentation_layer/shared/surahs_name.dart';
import 'package:muslim/presentation_layer/widgets/surah_card_aduio_item.dart';
import 'package:muslim/presentation_layer/widgets/playing_model_sheet.dart';
import 'package:muslim/presentation_layer/widgets/reciter_cart_item.dart';

class QuranScreen extends StatelessWidget {
  final ScrollController controller = ScrollController();

  QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MuslimCubit, MuslimStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = MuslimCubit.get(context);
        return Scaffold(
          ///////////when reciter talk this bottom sheet appear //////////////

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

          ////////////////////////////////////////
          appBar: AppBar(
            title: QuranScreenSearch.toggleBetweenTitleInAppBar(context),
            leading: QuranScreenSearch.toggleBetweenLeadingInAppBar(context),
            actions: QuranScreenSearch.toggleBetweenActionInAppBar(context),
          ),
          body: ReciterModel.allReciter.isNotEmpty
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.22,
                            child: ListView.separated(
                              controller: controller,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => reciterCardItem(
                                context: context,
                                index: index,
                              ),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(width: 5),
                              itemCount: ReciterModel.allReciter.length,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: InkWell(
                              onTap: () {
                                cubit.isReciterAtFistElement
                                    ? _animateToIndex(
                                        cubit.currentReciter, context)
                                    : _animateToIndex(0, context);
                                cubit.changeIsReciterAtFirstIndex();
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                height:
                                    MediaQuery.of(context).size.height * 0.215,
                                color: Colors.grey[200]!.withOpacity(0.4),
                                child: cubit.isReciterAtFistElement
                                    ? const Icon(
                                        Icons.arrow_forward_ios_rounded)
                                    : const Icon(Icons.arrow_back_ios),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => surahCardItem(
                          context: context,
                          surahIndex: index,
                          surahName: "سورة " + surahsName[index]['name'],
                          onTap: () {
                            cubit.changeSurah(index);
                            cubit.playingSurah();
                            cubit.maxAndPositionAndSeekTime();
                          },
                        ),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: 114,
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
        );
      },
    );
  }

  void _animateToIndex(int index, BuildContext context) {
    controller.animateTo(
      index * MediaQuery.of(context).size.width * 0.46,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }
}
