import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/data_layer/bloc/cubit.dart';
import 'package:muslim/data_layer/bloc/states.dart';
import 'package:muslim/presentation_layer/models/radio_data_model/radio_data_model.dart';
import 'package:muslim/presentation_layer/widgets/radio_card_item.dart';

class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MuslimCubit, MuslimStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = MuslimCubit.get(context);
        return Scaffold(
            body: Column(
          children: [
            Card(
              elevation: 10,
              color: Theme.of(context).backgroundColor.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.15,
                  child: TextFormField(
                      decoration: InputDecoration(
                    label: Text('Search'),
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    focusColor: Theme.of(context).primaryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  )),
                ),
              ),
            ),
            Card(
              color: Theme.of(context).backgroundColor.withOpacity(0.5),
              elevation: 7,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.23,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.23,
                      child: Image(
                        image: NetworkImage(
                            'https://26.mchs.gov.ru/uploads/resize_cache/news/2021-02-12/vsemirnyy-den-radio_1613124797641637987__800x800.jpg'),
                        // fit: BoxFit.none,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => cardRadioItem(
                    context: context,
                    channelIndex: index,
                    channelName: RadioDataModel.getName(index),
                  ),
                  itemCount: RadioDataModel.radioDataList!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}
