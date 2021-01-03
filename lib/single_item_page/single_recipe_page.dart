import 'package:dunija/layout/dialog/infodialog.dart';
import 'package:dunija/layout/kitchen_/kitchen_.dart';
import 'package:dunija/services/data_manager.dart';
import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/styles.dart';
import 'package:flutter/material.dart';

class SinglePageView extends StatelessWidget {
  final recipe;

  SinglePageView({this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            recipe,
            overflow: TextOverflow.fade,
          ),
          centerTitle: false,
          elevation: 0.0,
          backgroundColor: AppColors.accent,
          actions: [
            Row(
              // padding: EdgeInsets.all(5.0),
              children: [
                FlatButton(
                  color: AppColors.accent
                      .withBlue(0)
                      .withGreen(0)
                      .withRed(120)
                      .withOpacity(0.8),
                  child: Container(
                    child: Text(
                      'Start Cooking',
                      style: AppStyles.setTextStyle(
                        color: 0xFFEEFFDD,
                      ),
                    ),
                  ),
                  //////////////////////////////////
                  ///Start Cooking
                  //////////////////////////////////
                  onPressed: () async {
                    InfoDialog.showLoadingDialog(context,
                        msg: 'Preparing your Kitchen');
                    await DataManager.getStageData(context, '').then((value) {
                      ///////////////////////////////////////////
                      ///Temporary Delay to show loading action
                      ///////////////////////////////////////////
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.popUntil(
                          context,
                          ModalRoute.withName('/SingleRecipeView'),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Kitchen(
                                recipe: recipe,
                                stages: value,
                              );
                            },
                          ),
                        );
                      });
                    });
                  },
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2.0,
                        color: AppColors.lightAccent.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                )
              ],
            ),
          ],
        ),
        backgroundColor: AppColors.whiteColor,
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              automaticallyImplyLeading: false,
              centerTitle: false,
              backgroundColor: AppColors.accent,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(
                  MediaQuery.of(context).size.height / 3,
                ),
                child: Container(
                  child: Image(
                    image: AssetImage('assets/imgs/bg_ml.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        color: AppColors.accentTrans,
                        height: 60.0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        color: AppColors.accent.withOpacity(0.2),
                        height: 180.0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        color: AppColors.accentTrans,
                        height: 120.0,
                      ),
                    ],
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ));
  }
}
