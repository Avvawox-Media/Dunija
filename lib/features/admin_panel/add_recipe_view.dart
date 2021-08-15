import 'package:dunija/core/utils/colors.dart';
import 'package:dunija/core/utils/custom_icon_icons.dart';
import 'package:dunija/core/utils/quantities.dart';
import 'package:dunija/core/utils/styles.dart';
import 'package:dunija/core/widgets/category_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddRecipeListView extends StatefulWidget {
  @override
  _AddRecipeListViewState createState() => _AddRecipeListViewState();
}

class _AddRecipeListViewState extends State<AddRecipeListView> {
  //
  int stages = 1;

  //
  ScrollController _scrollController;
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _authorController = TextEditingController();

  //
  final TextEditingController _stageTitleController = TextEditingController(),
      _stageDurationController = TextEditingController(),
      _stageDescController = TextEditingController();

  //
  List<Widget> widgetList;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    widgetList = [renderPrepStage(index: 0, removable: false)];
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(children: [
            Icon(
              Icons.create,
              size: 20.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Submit Recipe',
              style:
                  AppStyles.setTextStyle(weight: FontWeight.bold, size: 16.0),
            ),
          ]),
        ),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            // reverse: true,
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(vertical: 0.0),
            children: [
              Column(
                children: [
                  createTitleField(),
                  createDescriptionField(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        createRecipeIcon(),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              createAuthorField(),
                              SizedBox(
                                height: 15.0,
                              ),
                              CategoryDropdown(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.0, left: 15.0, bottom: 10.0),
                    child: Row(
                      children: [
                        Text(
                          'Add Stages',
                          style:
                              AppStyles.setTextStyle(weight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: widgetList,
                  )
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [createAddStageButton(), createRemoveStageButton()],
        ),
      ],
    );
  }

  //Create ADD STAGE button
  Row createAddStageButton() {
    return Row(
      children: [
        Container(
          child: InkWell(
            child: Container(
              padding: EdgeInsets.only(
                  right: 10.0, top: 5.0, bottom: 5.0, left: 5.0),
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.4),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add_circle,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Add Stage'),
                ],
              ),
            ),
            onTap: () {
              if (stages < 7) {
                //Insert a Stage
                widgetList.add(renderPrepStage(index: stages, removable: true));

                setState(
                  () {
                    stages += 1;
                  },
                );

                _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent + 50.0,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOutCubic);
              }
            },
          ),
        )
      ],
    );
  }

  //Create REMOVE STAGE button
  Row createRemoveStageButton() {
    return Row(
      children: [
        Container(
          child: InkWell(
            child: Container(
              padding: EdgeInsets.only(
                  right: 10.0, top: 5.0, bottom: 5.0, left: 5.0),
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.8),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove_circle,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Remove Stage'),
                ],
              ),
            ),
            onTap: () {
              //Remove last Stage
              if (!(widgetList.length == 1)) {
                widgetList.removeAt(stages - 1);

                setState(
                  () {
                    stages = stages - 1;
                  },
                );
              }
            },
          ),
        )
      ],
    );
  }

  //Create Recipe Title Stage
  Widget createTitleField() {
    return Container(
      alignment: Alignment.center,
      height: 40.0,
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: TextField(
        cursorColor: AppColors.darkAccent,
        controller: _titleController,
        maxLines: 1,
        style: TextStyle(fontSize: 14.0, height: 0.8),
        autocorrect: false,
        decoration: InputDecoration(
          prefixIcon: Icon(CustomIcon.food),
          contentPadding: EdgeInsets.all(10.0),
          hintText: 'Recipe Title',
          fillColor: AppColors.accent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Numbers.largeBoxBorderRadius,
            ),
            borderSide: BorderSide(color: AppColors.accent),
          ),
        ),
      ),
    );
  }

  //Create Decsription Field
  Widget createDescriptionField() {
    return Container(
      alignment: Alignment.center,
      // height: 40.0,
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: TextField(
        cursorColor: AppColors.darkAccent,
        controller: _descController,
        maxLines: 4,
        maxLength: 255,
        style: TextStyle(fontSize: 14.0, height: 0.8),
        autocorrect: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          hintText: 'Short Description',
          fillColor: AppColors.accent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Numbers.smallBoxBorderRadius,
            ),
            borderSide: BorderSide(color: AppColors.accent),
          ),
        ),
      ),
    );
  }

  //Create Recipe Author
  Widget createAuthorField() {
    return Container(
      alignment: Alignment.center,
      height: 40.0,
      child: TextField(
        cursorColor: AppColors.darkAccent,
        controller: _authorController,
        maxLines: 1,
        style: TextStyle(fontSize: 14.0, height: 0.8),
        autocorrect: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.all(10.0),
          hintText: 'Author',
          fillColor: AppColors.accent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Numbers.largeBoxBorderRadius,
            ),
            borderSide: BorderSide(color: AppColors.accent),
          ),
        ),
      ),
    );
  }

  //Create Recipe Icon Upload Section
  Widget createRecipeIcon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.darkAccent.withOpacity(
          0.5,
        )),
        borderRadius: BorderRadius.circular(Numbers.smallBoxBorderRadius),
      ),
      height: 100.0, // Numbers.deviceWidth / 3,
      width: 100.0, // Numbers.deviceWidth / 3,
      child: Icon(
        CustomIcon.food,
        size: 35.0,
      ),
    );
  }

//Create Duration Field
  Widget createStageDurationField() {
    return Container(
      constraints: BoxConstraints(maxWidth: (Numbers.deviceWidth - 100.0) / 2),
      alignment: Alignment.center,
      height: 35.0,
      padding: EdgeInsets.only(
        left: 10.0,
      ),
      child: TextField(
        cursorColor: AppColors.darkAccent,
        controller: _stageDurationController,
        maxLines: 1,
        keyboardType: TextInputType.number,
        maxLengthEnforced: true,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: TextStyle(fontSize: 14.0, height: 0.8),
        autocorrect: false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.watch_later,
            size: 20,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
          hintText: 'Minutes',
          fillColor: AppColors.accent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: AppColors.accent),
          ),
        ),
      ),
    );
  }

//Create distinct stages
  Widget renderPrepStage({@required int index, @required bool removable}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: AppColors.whiteColor.withOpacity(0.3),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: Numbers.deviceWidth - 80, minHeight: 80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    createStageTitleField(),
                    createStageDurationField(),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                createStageDescriptionFiled(),
              ],
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          createStageImageArea(index: stages),
        ],
      ),
    );
  }

//Create Description Field
  Container createStageDescriptionFiled() {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 50.0,
        maxWidth: ((Numbers.deviceWidth - 80)),
      ),
      child: TextField(
        style: AppStyles.setTextStyle(size: 14.0),
        cursorColor: AppColors.darkAccent,
        // controller: _stageDescController,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        maxLines: 2,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            hintText: 'Decription',
            hintStyle: AppStyles.setTextStyle(size: 12.0, color: 0xFF666666),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }

//Create Stage Title Field
  Container createStageTitleField() {
    return Container(
      constraints: BoxConstraints(
          maxHeight: 35.0, maxWidth: (Numbers.deviceWidth - 60) / 2),
      child: TextField(
        cursorColor: AppColors.darkAccent,
        // controller: _stageTitleController,
        textCapitalization: TextCapitalization.sentences,
        style: AppStyles.setTextStyle(size: 14.0),
        decoration: InputDecoration(
            hintText: 'Stage Title',
            hintStyle: AppStyles.setTextStyle(size: 12.0, color: 0xFF666666),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }

//Create Stage Image Upload area
  Widget createStageImageArea({@required index}) {
    return Column(
      children: [
        Container(
          width: 50.0,
          height: 50.0,
          constraints: BoxConstraints(maxHeight: 80.0, maxWidth: 80.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Numbers.smallBoxBorderRadius),
              border: Border.all(width: 1.0, color: AppColors.darkAccent)),
          transform: Matrix4.identity(),
          key: Key('Stage $index'),
          child: InkWell(
            onTap: () {
              //
            },
            child: Icon(Icons.ac_unit),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          'Add Image',
          style: AppStyles.setTextStyle(size: 9.0),
        ),
      ],
    );
  }
}
