import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/data_layer/bloc/cubit.dart';
import 'package:muslim/data_layer/bloc/states.dart';
import 'package:muslim/presentation_layer/shared/tasbiha_count.dart';

class TasbihScreen extends StatelessWidget {
  var pageController = PageController();
  double toggleBetweenMaxTasbihCount = 33;
  bool toggleBetweenMaxTasbih = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MuslimCubit, MuslimStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = MuslimCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              toggleBetweenMaxTasbih = !toggleBetweenMaxTasbih;
              toggleBetweenMaxTasbihCount = toggleBetweenMaxTasbih ? 33 : 99;
              cubit.changeState();
            },
            child: Text(toggleBetweenMaxTasbih ? '33' : '99'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: Container(
            width: double.infinity,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    reverse: true,
                    itemBuilder: (context, index) => SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: const Image(
                                  image: AssetImage('assets/images/tasbih.png'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  start: 10.0,
                                  bottom: 135,
                                ),
                                child: Text(tasbiha[index]['count'].toString()),
                              ),
                              SizedBox(
                                width: 150,
                                height: 100,
                                child: Center(
                                    child: Text(
                                  tasbiha[index]['name'].toString(),
                                  style: Theme.of(context).textTheme.bodyText2,
                                )),
                              ),
                            ],
                          ),
                          Slider(
                            value: tasbiha[index]['count'].toDouble() >=
                                    toggleBetweenMaxTasbihCount
                                ? toggleBetweenMaxTasbihCount
                                : tasbiha[index]['count'].toDouble(),
                            max: toggleBetweenMaxTasbihCount,
                            min: 0,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (value) {
                              tasbiha[index]['count'].toDouble() >= 115
                                  ? ++cubit.tasbihaPage
                                  : SizedBox();
                              cubit.changeState();
                              // cubit.changeSebhaSlide(value);
                            },
                          ),
                        ],
                      ),
                    ),
                    onPageChanged: (value) {
                      print(value);
                      cubit.tasbihaPage = value;
                    },
                    itemCount: tasbiha.length,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 180,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Container(
                      width: 167,
                      height: 207,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.only(
                              start: 30.0,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 20,
                              child: Text(
                                'TASBIH',
                                style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 105,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 30,
                                color: Colors.grey[600],
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    start: 8.0,
                                    top: 5,
                                  ),
                                  child: Text(
                                    cubit.totalTasbiha.toString(),
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: tasbiha[cubit.tasbihaPage]
                                                      ['count']
                                                  .toString()
                                                  .length >=
                                              6
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                              start: 30.0,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 20,
                              child: Text(
                                'COUNT',
                                style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)),
                            clipBehavior: Clip.antiAlias,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                cubit.changeTasbihaCount();
                                ++tasbiha[cubit.tasbihaPage]['count'];
                                cubit.changeState();
                              },
                              child: Container(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
