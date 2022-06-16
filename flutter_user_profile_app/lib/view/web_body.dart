import 'package:animate_do/animate_do.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';

import '../utils/my_strings.dart';
import '../components.dart';
import '../user_shared_preferences.dart';
import '../utils/colors.dart';

class WebBody extends StatefulWidget {
  const WebBody({Key? key}) : super(key: key);

  @override
  State<WebBody> createState() => _WebBodyState();
}

class _WebBodyState extends State<WebBody> {
  bool isAboutMeTextOpen = false;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: UserSharedPreferences.getValue() ?? true
          ? LightColors.bgColor
          : DarkColors.bgColor,
      extendBodyBehindAppBar: true,

      /// AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: DayNightSwitcherIcon(
          isDarkModeEnabled: UserSharedPreferences.getValue() ?? true,
          onStateChanged: (value) {
            setState(() {
              UserSharedPreferences.setValue(value);
            });
          },
        ),
      ),

      /// Body
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            /// Pics
            SizedBox(
              width: screenWidth,
              height: screenHeight / 2,
              child: Stack(alignment: Alignment.center, children: [
                /// Top Banner
                Positioned(
                  top: 0,
                  child: Material(
                    elevation: 5,
                    shadowColor: Colors.black,
                    child: FadeIn(
                      child: SizedBox(
                        width: screenWidth,
                        height: screenHeight / 3,
                        child: Image.network(
                          'assets/web.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                /// Profile pic
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                  child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: FadeInDown(
                        delay: const Duration(milliseconds: 400),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/yourProfileImage',
                                  ),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color:
                                      UserSharedPreferences.getValue() ?? true
                                          ? Colors.white
                                          : Colors.black,
                                  width: 3)),
                        ),
                      )),
                ),

                /// Your name
                Positioned(
                  bottom: 0,
                  child: FadeInDown(
                    delay: const Duration(milliseconds: 800),
                    child: Text(
                      MyStrings.name,
                      style: textTheme.headline1?.copyWith(
                        fontSize: screenWidth < 700 ? 30 : 35,
                        color: UserSharedPreferences.getValue() ?? true
                            ? LightColors.titleColor
                            : DarkColors.titleColor,
                      ),
                    ),
                  ),
                )
              ]),
            ),

            /// your career
            FadeInDown(
              delay: const Duration(milliseconds: 1200),
              child: Text(
                MyStrings.jop,
                style: textTheme.headline2?.copyWith(
                  fontSize: screenWidth < 700 ? 15 : 20,
                ),
              ),
            ),

            /// about me text and btn
            FadeInDown(
              delay: const Duration(milliseconds: 1600),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isAboutMeTextOpen = !isAboutMeTextOpen;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        MyStrings.aboutMe,
                        style: textTheme.headline2?.copyWith(
                          fontSize: screenWidth < 700 ? 15 : 18,
                        ),
                      ),
                      Icon(
                        isAboutMeTextOpen
                            ? Icons.arrow_drop_up_outlined
                            : Icons.arrow_drop_down_outlined,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            /// About Me Text
            Visibility(
              visible: isAboutMeTextOpen,
              child: FadeInDown(
                delay: const Duration(milliseconds: 50),
                from: 30,
                child: SizedBox(
                  width: screenWidth / 1.2,
                  height: screenHeight / 4,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Text(
                      MyStrings.aboutMeText,
                      textAlign: TextAlign.center,
                      style: textTheme.headline3
                          ?.copyWith(fontSize: screenWidth < 700 ? 14 : 16),
                    ),
                  ),
                ),
              ),
            ),

            Expanded(child: Container()),

            /// Social Icons
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight / 60, horizontal: 30),
              child: FadeInUp(
                delay: const Duration(milliseconds: 2000),
                child: BottomSideIcons(
                  isLightThemeEnabled: UserSharedPreferences.getValue() ?? true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
