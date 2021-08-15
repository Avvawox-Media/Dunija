import 'package:dunija/core/dialog/infodialog.dart';
import 'package:dunija/features/kitchen/timer_widget.dart';
import 'package:dunija/models/prep_stage.dart';
import 'package:dunija/core/utils/colors.dart';
import 'package:dunija/core/utils/custom_icon_icons.dart';
import 'package:dunija/core/utils/quantities.dart';
import 'package:dunija/core/utils/strings.dart';
import 'package:dunija/core/utils/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Kitchen extends StatefulWidget {
  final recipe;
  final List<PrepStage> stages;

  Kitchen({@required this.recipe, @required this.stages});

  @override
  _KitchenState createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> with TickerProviderStateMixin {
  //Initial Stage
  int stageId = 1;

  //Text to Speech Items
  String ttsStageIntro = 'Stage 1';
  String ttsTitle = '';
  String ttsMessage = '';

  //PageView Controller
  PageController _pageController = PageController();

  //Scrollables
  bool forwardScrollable = true;
  bool backwardScrollable = false;

  //Text to Speach Status
  bool ttsEnabled = true;

  //Text to Speach Status
  bool isAlarmMuted = false;

  //Animation Controller
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
    setTtsText(stageId);
  }

  @override
  Widget build(BuildContext context) {
    //Return Widget
    return WillPopScope(
      onWillPop: () async {
        // Navigator.pop(context);

        InfoDialog.showExitDialog(
          context: context,
          title: AppStrings.exitKitchenTitle,
          msg: AppStrings.exitKitchenMsg,
        );
        return null;
      },
      child: Scaffold(
        backgroundColor: AppColors.accent, extendBodyBehindAppBar: true,
        appBar: AppBar(
          brightness: Brightness.dark,
          toolbarHeight: 80.0,
          backgroundColor: AppColors.darkAccent.withOpacity(0.2),
          automaticallyImplyLeading: false,
          elevation: 0,

          ///////////////////////////////////////
          ///Kitchen Title Box
          ///////////////////////////////////////

          title: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///////////////////////////////////////
                  //Dunija Title Icon
                  ///////////////////////////////////////
                  Row(
                    children: [
                      Image(
                        image: AssetImage('assets/imgs/dunija.png'),
                        width: 100.0,
                      ),
                    ],
                  ),

                  ///////////////////////////////////////
                  /// Recipe Title Text
                  ///////////////////////////////////////
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.darkAccent.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 2))
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            AppColors.darkAccent.withOpacity(0.5),
                            AppColors.accent.withOpacity(0.5),
                          ],
                        ),
                        borderRadius:
                            BorderRadius.circular(Numbers.largeBoxBorderRadius),
                        color: AppColors.accent),
                    width: Numbers.deviceWidth / 2 - 20,
                    height: 30.0,
                    child: Row(
                      children: [
                        // SizedBox(
                        //   width: 5.0,
                        // ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.brightColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Image(
                            image: AssetImage('assets/imgs/icon.png'),
                            width: 25.0,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          widget.recipe,
                          style: AppStyles.boldWhiteLabel,
                          overflow: TextOverflow.fade,
                        )
                      ],
                    ),
                  ),

                  ///////////////////////////////////////
                  //Exit Kitchen Button
                  ///////////////////////////////////////
                  GestureDetector(
                    onTap: () {
                      InfoDialog.showExitDialog(
                          context: context,
                          title: AppStrings.exitKitchenTitle,
                          msg: AppStrings.exitKitchenMsg);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            AppColors.darkAccent,
                            AppColors.accent,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.darkAccent,
                              spreadRadius: 1.0,
                              blurRadius: 2.0,
                              offset: Offset(0, 1))
                        ],
                        // color: AppColors.darkAccent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                      child: Icon(
                        Icons.close,
                        color: AppColors.brightColor,
                      ),
                    ),
                  ),
                ]),
          ),
        ),

        ///////////////////////////////////////
        //Body Region
        ///////////////////////////////////////
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Container(
              child: Image(
                image: AssetImage('assets/imgs/kitchen_bg.png'),
                fit: BoxFit.fill,
              ),
            ),

            //////////////////////////////////////
            /// PAGEVIEW GOES HERE
            //////////////////////////////////////

            stagedView(controller: _pageController),

            //////////////////////////////////////
            /// Bottom bar
            //////////////////////////////////////
            SafeArea(
              top: true,
              bottom: false,
              maintainBottomViewPadding: false,
              child: Container(
                child: Container(
                  width: Numbers.deviceWidth,
                  height: 0.07 * Numbers.deviceHeight,
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    alignment: Numbers.deviceWidth > 500
                        ? Alignment.center
                        : Alignment.topCenter,
                    children: [
                      Image(
                        image: AssetImage('assets/imgs/bottom_bar.png'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /////////////////////////////////////
                          /// Alarm Button
                          /////////////////////////////////////
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.only(top: 25.0),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              child: Icon(
                                Icons.alarm_on,
                                color: AppColors.brightColor,
                              ),
                              decoration: BoxDecoration(
                                gradient: !isAlarmMuted
                                    ? LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          AppColors.darkAccentTrans,
                                          AppColors.accent,
                                        ],
                                      )
                                    : null,
                                color: AppColors.accent,
                                borderRadius: BorderRadius.circular(
                                  Numbers.largeBoxBorderRadius,
                                ),
                                border: Border.all(
                                    width: 1.0,
                                    color: AppColors.brightColorTrans2
                                        .withOpacity(0.3)),
                              ),
                            ),
                            onDoubleTap: () {},
                            onTap: () {
                              // if (backwardScrollable) {
                              //   _pageController
                              //       .previousPage(
                              //           duration: Duration(milliseconds: 500),
                              //           curve: Curves.ease)
                              //       .then((value) {
                              //     setState(() {
                              //       forwardScrollable =
                              //           stageId < widget.stages.length;
                              //       backwardScrollable = stageId > 1;
                              //     });
                              //   });
                              // }

                              setMuteToggle();
                              // ringAlarm();
                            },
                          ),
                          SizedBox(
                            width: 15.0,
                          ),

                          /////////////////////////////////////
                          /// Text to Speech Button
                          /////////////////////////////////////
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.only(top: 25.0),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              child: Icon(
                                CustomIcon.bullhorn,
                                color: AppColors.brightColor,
                              ),
                              decoration: BoxDecoration(
                                gradient: ttsEnabled
                                    ? LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          AppColors.darkAccentTrans,
                                          AppColors.accent,
                                        ],
                                      )
                                    : null,
                                color: AppColors.accent,
                                borderRadius: BorderRadius.circular(
                                  Numbers.largeBoxBorderRadius,
                                ),
                                border: Border.all(
                                    width: 1.0,
                                    color: AppColors.brightColorTrans2
                                        .withOpacity(0.3)),
                              ),
                            ),
                            onDoubleTap: () {},
                            onTap: () {
                              setTtsToggle();
                            },
                          ),
                          SizedBox(
                            width: 15.0,
                          ),

                          /////////////////////////////////////
                          /// Fast Forward Button
                          /////////////////////////////////////
                          InkWell(
                              onDoubleTap: () {},
                              child: Container(
                                margin: EdgeInsets.only(top: 15.0, right: 10.0),
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  CustomIcon.done_all,
                                  color: AppColors.brightColor,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      AppColors.darkAccentTrans,
                                      AppColors.accent,
                                    ],
                                  ),
                                  color: AppColors.accent,
                                  borderRadius: BorderRadius.circular(32.0),
                                  border: Border.all(
                                      width: 1.5,
                                      color: AppColors.accent.withOpacity(0.6)),
                                ),
                              ),
                              onTap: () {
                                if (forwardScrollable) {
                                  _pageController
                                      .nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  )
                                      .then((value) {
                                    setState(() {
                                      forwardScrollable =
                                          stageId < widget.stages.length;
                                      backwardScrollable = stageId >= 1;
                                    });
                                  });

                                  setTtsText(stageId + 1);
                                }
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget stagedView({PageController controller}) {
    return Stack(
      fit: StackFit.expand,
      children: [
        PageView(
          physics: NeverScrollableScrollPhysics(),
          children: widget.stages.map((e) {
            return createScene(
                title: e.title,
                procedure: e.procedure,
                imageUrl: e.image,
                stageId: e.stageNo,
                duration: e.duration);
          }).toList(),
          dragStartBehavior: DragStartBehavior.down,
          controller: controller,
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          onPageChanged: (value) {
            // print(value + 1);
            setState(() {
              stageId = value + 1;
            });
          },
        ),
        // Container(
        //   color: AppColors.darkAccent.withOpacity(0.0),
        // ),
      ],
    );
  }

  Widget createScene({title, procedure, imageUrl, stageId, duration}) {
    return Column(
      children: [
        ///////////////////////////////////////
        // Kitchen Screen Area
        ///////////////////////////////////////
        Expanded(
          key: Key('Kitchen: ${widget.recipe}'),
          child: Container(
            width: Numbers.deviceWidth,
            child: SafeArea(
              bottom: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 5.0),
                  ///////////////////////////////////////
                  //Stage Title Label
                  ///////////////////////////////////////
                  Container(
                    padding: EdgeInsets.all(10.0),
                    width: Numbers.deviceWidth,
                    child: RichText(
                      text: TextSpan(
                        children: [TextSpan(text: stageId.toString())],
                        text: 'Stage ',
                        style: TextStyle(
                          shadows: [
                            Shadow(offset: Offset(0, 3), blurRadius: 2.0)
                          ],
                          color: AppColors.brightColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  ///////////////////////////////////////
                  /// Main Content Area
                  ///////////////////////////////////////
                  Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 5.0, color: AppColors.accent.withOpacity(0.3)),
                      borderRadius:
                          BorderRadius.circular(Numbers.mediumBoxBorderRadius),
                      color: AppColors.accent,
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            AppColors.accent
                                .withBlue(20)
                                .withGreen(20)
                                .withRed(80),
                            AppColors.accent,
                          ]),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.darkAccent.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 5))
                      ],
                    ),
                    width: Numbers.deviceWidth,
                    margin: EdgeInsets.all(1.0),
                    child: Column(
                      children: [
                        ///////////////////////////////////////
                        /// Inner Image Container
                        ///////////////////////////////////////
                        Container(
                          width: Numbers.deviceWidth,
                          height: Numbers.deviceWidth > 500
                              ? 0.45 * Numbers.deviceHeight
                              : 0.30 * Numbers.deviceHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Numbers.mediumBoxBorderRadius),
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.darkAccent.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 5))
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  AppColors.lightAccent,
                                  AppColors.accent,
                                ]),
                          ),
                          ///////////////////////////////////////
                          /// Set default URL
                          ///////////////////////////////////////

                          child: Container(
                            alignment: Alignment.center,
                            child: Image(
                              image: AssetImage(imageUrl),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 25.0,
                        ),

                        ///////////////////////////////////////
                        //Timer Widget
                        ///////////////////////////////////////
                        TimerWidget(
                            duration: duration,
                            endAlarm: () {
                              toggleAlarm(ring: false);
                            }),
                      ],
                    ),
                  ),

                  ///////////////////////////////////////
                  //Stage Title
                  ///////////////////////////////////////

                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    width: Numbers.deviceWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: AppColors.lightAccent.withOpacity(0.3),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Text(
                      title,
                      style: AppStyles.setTextStyle(
                          weight: FontWeight.bold, color: 0xFFDDFFDD),
                    ),
                  ),

                  ///////////////////////////////////////
                  //Text Content Area
                  ///////////////////////////////////////
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListView(
                        // controller: ScrollController(),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ///////////////////////////////////////
                              //Stage Procedures
                              ///////////////////////////////////////
                              Container(
                                width: Numbers.deviceWidth,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                                child: Text(
                                  procedure,
                                  style:
                                      AppStyles.setTextStyle(color: 0xFFDDFFDD),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void setTtsText(stageId) {
    for (PrepStage ps in widget.stages) {
      String title = ps.title.toString();
      String procedure = ps.procedure.toString();

      if (ps.stageNo == stageId) {
        setState(() {
          ttsStageIntro = 'Stage ${ps.stageNo}';
          ttsTitle = title;
          ttsMessage = procedure;
        });
      }
    }
    //Speak Text after 5 or 3 seconds
    Future.delayed(Duration(seconds: stageId == 1 ? 5 : 3), () {
      speakText();
    });
  }

  void speakText() async {
    FlutterTts tts = FlutterTts();
    tts.setSpeechRate(0.70);
    if (ttsEnabled) {
      await tts.stop();
      await tts.speak(ttsStageIntro);
      // await tts.setSilence(500);
      await tts.speak(ttsTitle);
      // await tts.setSilence(500);
      await tts.speak(ttsMessage);
    }
  }

  void toggleAlarm({bool ring}) {
    if (ring) {
      FlutterRingtonePlayer.play(
        android: AndroidSounds.alarm,
        ios: IosSounds.triTone,
        looping: true,
        asAlarm: true,
      );
    } else {
      FlutterRingtonePlayer.stop();
    }
  }

  //Toggle Mute
  void setTtsToggle() {
    setState(() {
      ttsEnabled = !ttsEnabled;
    });
  }

  //Toggle Mute
  void setMuteToggle() {
    setState(() {
      isAlarmMuted = !isAlarmMuted;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
