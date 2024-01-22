import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
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
            left: MediaQuery.of(context).size.width / 10,
            right: MediaQuery.of(context).size.width / 10,
            bottom: MediaQuery.of(context).size.width / 30,
            top: MediaQuery.of(context).size.width / 30,
          ),
          child: Flex(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            /* crossAxisAlignment: CrossAxisAlignment.start, */
            direction: (orientation == Orientation.landscape)
                ? Axis.horizontal
                : Axis.vertical,
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(360 / 360),
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
                          Colors.grey,
                          // Couleur du filtre, dans ce cas, le gris pour le noir et blanc
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
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width/10,),
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        '01 | A propos de Moi',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/20,),
                    Text(
                      generateRandomText(500),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/20,),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/github-mark-white.svg",
                                // ignore: deprecated_member_use
                                color: Colors.white,
                                height: 18,
                              ),
                              Text(
                                ' | Github',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/50,),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/iconmonstr-linkedin-1.svg",
                                // ignore: deprecated_member_use
                                color: Colors.white,
                                height: 18,
                              ),
                              Text(
                                ' | LinkedIn',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/50,),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/x.svg",
                                // ignore: deprecated_member_use
                                color: Colors.white,
                                height: 18,
                              ),
                              Text(
                                ' | X (Anciennement Twitter)',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
