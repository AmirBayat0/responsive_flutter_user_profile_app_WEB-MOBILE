import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter_user_profile_app/user_shared_preferences.dart';

///
import '../utils/colors.dart';
import '../utils/my_strings.dart';
import '../components.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  /////////////////////////////////////
  //@CodeWithFlexz on Instagram
  //
  //AmirBayat0 on Github
  //Programming with Flexz on Youtube
  /////////////////////////////////////
  bool isAboutMeTextOpen = false;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: UserSharedPreferences.getValue() ?? true
              ? LightColors.bgColor
              : DarkColors.bgColor,
          extendBodyBehindAppBar: true,

          /// App Bar
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


                /// Profile Pic
                SizedBox(
                  width: screenWidth,
                  height: screenHeight / 2,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -screenWidth / 10,
                        right: -screenWidth / 3.7,
                        child: FadeInRight(
                          child: Container(
                            width: screenWidth,
                            height: screenHeight / 2,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: UserSharedPreferences.getValue() ??
                                              true
                                          ? const Color.fromARGB(
                                              255, 194, 194, 194)
                                          : const Color.fromARGB(
                                              255, 30, 30, 30),
                                      offset: const Offset(7, 5),
                                      blurRadius: 10,
                                      spreadRadius: 1),
                                  BoxShadow(
                                      color: UserSharedPreferences.getValue() ??
                                              true
                                          ? const Color.fromARGB(
                                              255, 194, 194, 194)
                                          : const Color.fromARGB(255, 5, 5, 5),
                                      offset: const Offset(-7, -5),
                                      blurRadius: 10,
                                      spreadRadius: 1),
                                ],
                                color: Colors.red,
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                    image: AssetImage('assets/yourProfileImage'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// My Information
                SizedBox(
                  width: screenWidth / 1.2,
                  height: screenHeight / 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInDown(
                        delay: const Duration(milliseconds: 400),
                        child: Text(
                          MyStrings.name,
                          style: textTheme.headline1?.copyWith(
                              color: UserSharedPreferences.getValue() ?? true
                                  ? LightColors.titleColor
                                  : DarkColors.titleColor),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeInDown(
                        delay: const Duration(milliseconds: 800),
                        child: Text(
                          MyStrings.jop,
                          style: textTheme.headline2,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      FadeInDown(
                        delay: const Duration(milliseconds: 1200),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isAboutMeTextOpen = !isAboutMeTextOpen;
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                MyStrings.aboutMe,
                                style: textTheme.headline2,
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
                    ],
                  ),
                ),

                /// About Me Text
                Visibility(
                  visible: isAboutMeTextOpen,
                  child: FadeInDown(
                    delay: const Duration(milliseconds: 50),
                    from: 30,
                    child: SizedBox(
                      width: screenWidth / 1.2,
                      height: screenHeight / 6,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          MyStrings.aboutMeText,
                          style: textTheme.headline3,
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(child: Container()),

                /// Social Icons
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight / 45, horizontal: 20),
                  child: FadeInUp(
                    delay: const Duration(milliseconds: 1600),
                    child: BottomSideIcons(
                        isLightThemeEnabled:
                            UserSharedPreferences.getValue() ?? true),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
