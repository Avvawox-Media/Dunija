import 'dart:async';
import 'dart:convert';
import 'package:dunija/layout/dialog/infodialog.dart';
import 'package:dunija/models/prep_stage.dart';
import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/quantities.dart';
import 'package:dunija/utils/strings.dart';
import 'package:dunija/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:http/http.dart' as http;

class KitchenScreen extends StatefulWidget {
  final recipe, recipeId;

  //
  KitchenScreen({
    @required this.recipe,
    this.recipeId,
  });

  @override
  _KitchenScreenState createState() => _KitchenScreenState();
}

class _KitchenScreenState extends State<KitchenScreen> {
  //

  var pageName = 'Kitchen';

  //Screen type
  bool isLongScreen = Numbers.deviceHeight > 960 ? true : false;

  Future<bool> _onBackPressed() {
    //
    Navigator.pop(context);
  }

  var stageId = 1, maxStage = 0;

  //Progress Bar rate
  var progressRate = 0.0;

  //Scroll Controller
  ScrollController _scrollController = ScrollController();

  bool isPlay = false;

  computeProgress() {
    var timer;
    timer = Timer.periodic(Duration(milliseconds: 200), (t) {
      //
      progressRate += 1;
      print(progressRate);
      if (progressRate >= 100) {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    //computeProgress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(Numbers.deviceHeight);
    //
    var progress = Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: (Numbers.deviceWidth - 150) * 0.7, //(progressRate / 100),
          height: 25.0,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.accent,
                  AppColors.whiteColor,
                ]),
            border: Border.all(color: AppColors.brightColor, width: 2.0),
            borderRadius: BorderRadius.circular(
              Numbers.largeBoxBorderRadius,
            ),
            image: DecorationImage(
              image: AssetImage('assets/imgs/progress.png'),
              fit: BoxFit.fitHeight,
              repeat: ImageRepeat.repeatX,
            ),
          ),
        ));

    //Test
    getStage(1);

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          toolbarHeight: 80.0,
          backgroundColor: AppColors.whiteColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage('assets/imgs/dunija.png'),
                        width: 100.0,
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Numbers.largeBoxBorderRadius),
                        color: AppColors.accent),
                    width: Numbers.deviceWidth / 2 - 20,
                    height: 30.0,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.0,
                        ),
                        Image(
                          image: AssetImage('assets/imgs/icon.png'),
                          width: 28.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          widget.recipe,
                          style: AppStyles.whiteLabel,
                        )
                      ],
                    ),
                  ),
                  //Exit Kitchen Button
                  GestureDetector(
                    onTap: () {
                      InfoDialog.showExitKitchenDialog(
                          context: context,
                          title: AppStrings.exitKitchenTitle,
                          msg: AppStrings.exitKitchenMsg);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.darkAccent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                      child: Icon(
                        Icons.cancel_outlined,
                      ),
                    ),
                  ),
                ]),
          ),
        ),
        body: Column(
          children: [
            //Content area
            Expanded(
              key: Key('Kitchen: ${widget.recipe}'),
              child: Container(
                child: SafeArea(
                  child: Container(
                    width: Numbers.deviceWidth,
                    child: Column(
                      children: [
                        SizedBox(height: 5.0),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          width: Numbers.deviceWidth,
                          child: RichText(
                            text: TextSpan(
                              children: [TextSpan(text: '$stageId')],
                              text: 'Step ',
                              style: AppStyles.titleStyle,
                            ),
                          ),
                        ),

                        //Content Area
                        Container(
                          padding: EdgeInsets.all(10.0),
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Numbers.mediumBoxBorderRadius),
                            color: AppColors.accent,
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  AppColors.accent,
                                  AppColors.lightAccent,
                                ]),
                          ),
                          width: Numbers.deviceWidth,
                          margin: EdgeInsets.all(1.0),
                          child: Column(
                            children: [
                              //Inner Image Container
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
                                        color: AppColors.darkAccent,
                                        spreadRadius: 1,
                                        blurRadius: 25,
                                        offset: Offset(0, 15))
                                  ],
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        AppColors.brightColor,
                                        AppColors.whiteColor,
                                      ]),
                                ),
                                child: Container(
                                  child: FutureBuilder(
                                    future: getStage(widget.recipeId),
                                    builder: (context,
                                        AsyncSnapshot<List<PrepStage>>
                                            snapshot) {
                                      //Set default URL
                                      String imageUrl =
                                          'assets/imgs/stage4.png';
                                      if (snapshot.hasData) {
                                        for (PrepStage prepStage
                                            in snapshot.data) {
                                          if (prepStage.stageNo == stageId) {
                                            imageUrl = prepStage.image;
                                          }
                                        }
                                        return Image(
                                          image: AssetImage(imageUrl),
                                          fit: BoxFit.cover,
                                        );
                                      } else {
                                        return Container(
                                            alignment: Alignment.center,
                                            child: Text('Loading'));
                                      }
                                    },
                                  ),
                                  // child: Image(
                                  //   image: AssetImage('assets/imgs/stage4.png'),
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                              ),
                              SizedBox(
                                height: 35.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  //Progress Bar
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height:
                                        Numbers.deviceWidth > 500 ? 20.0 : 15.0,
                                    width: Numbers.deviceWidth * 0.65,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Numbers.largeBoxBorderRadius),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          AppColors.whiteColor,
                                          AppColors.brightColor
                                        ],
                                      ),
                                    ),
                                    child: progress,
                                    clipBehavior: Clip.hardEdge,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  //Count-down Time
                                  Container(
                                    alignment: Alignment.center,
                                    width: 0.15 * Numbers.deviceWidth,
                                    decoration: BoxDecoration(
                                      color: AppColors.accent,
                                      borderRadius: BorderRadius.circular(
                                        Numbers.smallBoxBorderRadius,
                                      ),
                                      border: Border.all(
                                          width: 0.5,
                                          color: AppColors.brightColorTrans2),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 3.0),
                                    child: Text(
                                      '2:30',
                                      style: AppStyles.boldWhiteLabel,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Scrollbar(
                              controller: _scrollController,
                              child: ListView(
                                controller: _scrollController,
                                children: [
                                  FutureBuilder(
                                    future: getStage(stageId),
                                    builder: (_,
                                        AsyncSnapshot<List<PrepStage>>
                                            snapshot) {
                                      String title = '';
                                      String procedure = '';

                                      if (snapshot.hasData) {
                                        for (PrepStage prepStage
                                            in snapshot.data) {
                                          if (prepStage.stageNo == stageId) {
                                            title = prepStage.title;
                                            procedure = prepStage.procedure;
                                          }
                                        }

                                        // procedure = procedure.replaceRange(
                                        //     procedure.indexOf('.'),
                                        //     procedure.indexOf('.') + 1,
                                        //     '\n\n');

                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              width: Numbers.deviceWidth,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                color: AppColors.lightAccent
                                                    .withOpacity(0.3),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 10.0),
                                              child: Text(
                                                title,
                                                style: AppStyles.setTextStyle(
                                                    weight: FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Container(
                                              width: Numbers.deviceWidth,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 10.0),
                                              child: Text(
                                                procedure,
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Container();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //Bottom bar
            Container(
              child: Container(
                width: Numbers.deviceWidth,
                height: 0.07 * Numbers.deviceHeight,
                alignment: Alignment.bottomCenter,
                child: Stack(
                  alignment:
                      isLongScreen ? Alignment.center : Alignment.topCenter,
                  children: [
                    Numbers.deviceWidth > 415.0
                        ? Container(
                            decoration:
                                BoxDecoration(color: AppColors.brightColor),
                            width: Numbers.deviceWidth,
                          )
                        : Image(
                            image: AssetImage('assets/imgs/player_bg.png'),
                            width: Numbers.deviceWidth,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Rewind Button
                        IconButton(
                          color: AppColors.brightColor,
                          iconSize: 30.0,
                          splashRadius: 20.0,
                          icon: Icon(Icons.fast_rewind),
                          onPressed: stageId == 1 ? null : reverseStage,
                        ),

                        //Play Button
                        GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: 80.0,
                            height: 0.06 * Numbers.deviceHeight,
                            decoration: BoxDecoration(
                              color: AppColors.accent,
                              borderRadius: BorderRadius.circular(30.0),
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.lightAccent,
                                  AppColors.accent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: Icon(
                                isPlay ? Icons.pause : Icons.play_arrow_rounded,
                                color: AppColors.brightColor,
                                size: 30.0,
                              ),
                            ),
                          ),
                          onTap: playPause,
                        ),

                        //Fast Forward Button
                        IconButton(
                          color: AppColors.brightColor,
                          iconSize: 30.0,
                          splashRadius: 20.0,
                          icon: Icon(Icons.fast_forward),
                          onPressed: stageId == maxStage ? null : forwardStage,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  playPause() {
    setState(() {
      isPlay = !isPlay;
    });
  }

  forwardStage() {
    if (!((stageId + 1) > maxStage)) {
      setState(() {
        stageId += 1;
      });
    }
  }

  reverseStage() {
    if (!((stageId - 1) < 1)) {
      setState(() {
        stageId -= 1;
      });
    }
  }

  getRecipe() async {
    String future = await DefaultAssetBundle.of(context)
        .loadString('assets/offline/sample.json');
    final parsed = json.decode(future);

    // print(parsed['stages']);
    return parsed;
  }

  Future<List<PrepStage>> getStage(final key) async {
    String baseUrl = AppStrings.baseUrl;
    String endpoint = '/recipe/stages';

    //List containing stages
    List<PrepStage> stages = [];

    ///For Fetching JSON file online
    // var response = await http.post(baseUrl + endpoint, body:{
    //   recipe_id: key
    // });

    var response = await DefaultAssetBundle.of(context)
        .loadString('assets/offline/sample.json');
    // final parsed = json.decode(future);
    // print(parsed['stages'][key]['procedure']);

    var result = json.decode(response);

    String recipe = result['recipe'];
    int steps = result['steps'];

    setState(() {
      maxStage = steps;
    });

    var stageResult = result['stages'];

    //Clear list
    stages.clear();

    //Iterate
    for (int i = 0; i < steps; i++) {
      stages.add(
        PrepStage(
            title: stageResult[i]['title'],
            procedure: stageResult[i]['procedure'],
            duration: stageResult[i]['duration'],
            image: stageResult[i]['image_url'],
            stageNo: stageResult[i]['stage']),
      );
    }
    return stages;
  }
}
