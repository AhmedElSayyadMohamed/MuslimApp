import 'package:flutter/material.dart';

Widget vedioItem(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 10,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.38,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          // color: Colors.blue,
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(10),
                        topEnd: Radius.circular(10)),
                    color: Colors.red,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.skip_previous)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.play_arrow)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.skip_next))
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Slider(
                              value: 90,
                              max: 120,
                              min: 80,
                              activeColor: Colors.blue,
                              onChanged: (value) {}),
                        ),
                        IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.rectangle_outlined))
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 20,
                      child: Text(
                        'Vedio describtion ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.cloud_download_outlined,
                        size: 30,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
