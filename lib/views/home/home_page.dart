import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  String generateRandomText(int length) {
    const String charset =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    Random random = Random();
    String result = "";

    for (int i = 0; i < length; i++) {
      int randomIndex = random.nextInt(charset.length);
      result += charset[randomIndex];
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(12),
      children: [
        Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 50,
              right: MediaQuery.of(context).size.width / 30,
              bottom: MediaQuery.of(context).size.width / 30,
              top: MediaQuery.of(context).size.width / 10),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            /* crossAxisAlignment: CrossAxisAlignment.start, */
            direction: (orientation == Orientation.landscape)
                ? Axis.horizontal
                : Axis.vertical,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MY NAME ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 9,
                    ),
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: 'IS ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Tw Cen MT Std Medium Cond',
                          fontSize: MediaQuery.of(context).size.height / 10,
                        ),
                      ),
                      TextSpan(
                        text: 'SIYAPZE',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Tw Cen MT Std Bold Cond',
                          fontSize: MediaQuery.of(context).size.height / 10,
                        ),
                      ),
                    ]),
                  ),
                  Text(
                    'FRANCK...',
                    style: TextStyle(
                      fontFamily: 'Tw Cen MT Std Bold Cond',
                      fontSize: MediaQuery.of(context).size.height / 9,
                    ),
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: 'FullStack Developer',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Tw Cen MT Italic',
                          fontSize: MediaQuery.of(context).size.height / 25,
                        ),
                      ),
                      TextSpan(
                        text: ' based in ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Tw Cen MT',
                          fontSize: MediaQuery.of(context).size.height / 25,
                        ),
                      ),
                      TextSpan(
                        text: 'Canada',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Tw Cen MT Italic',
                          fontSize: MediaQuery.of(context).size.height / 25,
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Let\'s talk with me',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Tw Cen MT',
                            fontSize: MediaQuery.of(context).size.height / 45,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [
                                0.1,
                                0.4,
                                0.6,
                                0.9,
                              ],
                              colors: [
                                Colors.yellow,
                                Colors.red,
                                Colors.indigo,
                                Colors.teal,
                              ],
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_outward,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  )
                ],
              ),
              if (orientation == Orientation.landscape)
                RotationTransition(
                  turns: AlwaysStoppedAnimation(15 / 360),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(
                        (orientation == Orientation.landscape)
                            ? MediaQuery.of(context).size.width / 7.5
                            : MediaQuery.of(context).size.width / 4,
                      ),
                      child: Image.asset(
                        'assets/images/mecolor2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
