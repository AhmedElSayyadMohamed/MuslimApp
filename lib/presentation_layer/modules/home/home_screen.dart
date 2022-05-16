import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/data_layer/bloc/cubit.dart';
import 'package:muslim/data_layer/bloc/states.dart';
import 'package:muslim/presentation_layer/modules/listening_quran_screen/quran_screen.dart';
import 'package:muslim/presentation_layer/modules/tasbih/tasbih_screen.dart';
import 'package:muslim/presentation_layer/shared/component/compnent.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MuslimCubit, MuslimStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = MuslimCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.32,
                  child: const Image(
                    image: AssetImage('assets/images/family.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.02,
                // ),
                // ToggleButtons(
                //   fillColor: Theme.of(context).primaryColor,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text(
                //         'Online',
                //         style: Theme.of(context).textTheme.bodyText2,
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text(
                //         'Offline',
                //         style: Theme.of(context).textTheme.bodyText2,
                //       ),
                //     ),
                //   ],
                //   isSelected: cubit.isSelected,
                //   onPressed: (index) {
                //     cubit.toggleBetweenOnlineOrOffline(index);
                //   },
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuranScreen(),
                              ),
                            );
                          },
                          child: Card(
                            color:
                                Theme.of(context).appBarTheme.backgroundColor,
                            elevation: 7,
                            child: Stack(
                              children: [
                                const Image(
                                  image: AssetImage('assets/images/quranh.png'),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        'استمع للقرأن بأصوات جميع الشيوخ ',
                                        maxLines: 3,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              navigatePushTo(
                                context: context,
                                navigateTo: TasbihScreen(),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Card(
                                color: Theme.of(context)
                                    .appBarTheme
                                    .backgroundColor,
                                elevation: 10,
                                child: Stack(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/sabh.png'),
                                      ),
                                    ),
                                    Positioned(
                                      left: 5,
                                      bottom: 10,
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Text(
                                          'السبحة الالكترونية',
                                          maxLines: 3,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          InkWell(
                            onTap: () {
                              // navigatePushTo(
                              //   context: context,
                              //   navigateTo: TasbihScreen(),
                              // );
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Card(
                                color: Theme.of(context)
                                    .appBarTheme
                                    .backgroundColor,
                                elevation: 10,
                                child: Stack(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/sabh.png'),
                                      ),
                                    ),
                                    Positioned(
                                      left: 5,
                                      bottom: 10,
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Center(
                                          child: Text(
                                            'الأذكار',
                                            maxLines: 3,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuranScreen(),
                              ),
                            );
                          },
                          child: Card(
                            color:
                                Theme.of(context).appBarTheme.backgroundColor,
                            elevation: 7,
                            child: Stack(
                              children: [
                                const Image(
                                  image: AssetImage('assets/images/quranh.png'),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        'استمع للقرأن بأصوات جميع الشيوخ ',
                                        maxLines: 3,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// InkWell(
// onTap: () {},
// child: Container(
// color: Colors.teal,
// width: 100,
// height: 50,
// child: Center(child: Text('Quran')),
// ),
// ),
// SizedBox(
// width: 100,
// ),
// Container(
// color: Colors.teal,
// width: 100,
// height: 50,
// child: Center(child: Text('tasbih')),
// ),])
//
//
//
//
// ]);

/*
* CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: MediaQuery.of(context).size.height * 0.35,
                title: Text(
                  'Ramadan Kareem',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 22),
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        radius: 23,
                      ),
                    ),
                  )
                ],
                flexibleSpace: const FlexibleSpaceBar(
                  background: Image(
                    image: AssetImage('assets/images/ramadan_kareem.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ToggleButtons(
                        fillColor: Theme.of(context).primaryColor,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Online',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Offline',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ],
                        isSelected: cubit.isSelected,
                        onPressed: (index) {
                          cubit.toggleBetweenOnlineOrOffline(index);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.38,
                          child: Card(
                            elevation: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.teal,
                                      width: 100,
                                      height: 50,
                                      child: Center(child: Text('tasbih')),
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.17,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey[200],
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      QuranScreen()));
                                        },
                                        child: Column(
                                          children: [
                                            const Image(
                                              image: AssetImage(
                                                  'assets/images/quran_PNG38.png'),
                                            ),
                                            Center(
                                                child: Text(
                                              'قرآن',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        color: Colors.teal,
                                        width: 100,
                                        height: 50,
                                        child: Center(child: Text('Quran')),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Container(
                                      color: Colors.teal,
                                      width: 100,
                                      height: 50,
                                      child: Center(child: Text('tasbih')),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Card(
                          child: Text(
                            "تفسير الشيخ الشعراوي",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => vedioItem(context),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),
                          itemCount: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )*/
