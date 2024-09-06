import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:me/animations/entrance_fader.dart';
import 'package:me/utils/colors.dart';

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
      physics: AlwaysScrollableScrollPhysics(), // Enables scrolling gestures
      padding: EdgeInsets.all(12),
      children: [
        Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 10,
              right: MediaQuery.of(context).size.width / 10,
              bottom: MediaQuery.of(context).size.width / 30,
              top: MediaQuery.of(context).size.width / 30),
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
                  /* Text(
                    'Hey ',
                    style: TextStyle(
                      color: kColorText,
                      fontSize: MediaQuery.of(context).size.height / 10,
                    ),
                  ), */
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Hey',
                        style: TextStyle(
                          color: kColorText,
                          fontSize: MediaQuery.of(context).size.height / 10,
                        ),
                      ),
                      EntranceFader(
                        offset: Offset(0, 0),
                        delay: Duration(seconds: 2),
                        duration: Duration(milliseconds: 800),
                        child: Image.asset(
                          "assets/images/wave.gif",
                          height: MediaQuery.of(context).size.height / 10,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'I\'m Franck',
                    style: TextStyle(
                      color: kColorText,
                      fontSize: MediaQuery.of(context).size.height / 10,
                    ),
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: 'Dabryn',
                        style: TextStyle(
                          color: kColorText,
                          fontFamily: 'Tw Cen MT Std Bold Cond',
                          fontSize: MediaQuery.of(context).size.height / 10,
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Row(
                    children: [
                      TyperAnimatedTextKit(
                        isRepeatingAnimation: true,
                        speed: Duration(milliseconds: 100),
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Tw Cen MT Italic',
                          fontSize: MediaQuery.of(context).size.height / 25,
                        ),
                        text: const [
                          "Software Engineer",
                          "Flutter Developer",
                          "Web Developer",
                        ],
                      ),
                      Text(
                        ' Based in ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Tw Cen MT',
                          fontSize: MediaQuery.of(context).size.height / 25,
                        ),
                      ),
                      Text(
                        'Canada',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Tw Cen MT Italic',
                          fontSize: MediaQuery.of(context).size.height / 25,
                        ),
                      ),
                    ],
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
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors
                              .grey, // Couleur du filtre, dans ce cas, le gris pour le noir et blanc
                          BlendMode
                              .saturation, // Mode de fusion pour le filtre BW
                        ),
                        child: Image.asset(
                          'assets/images/me2.jpg',
                          fit: BoxFit.cover,
                        ),
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
