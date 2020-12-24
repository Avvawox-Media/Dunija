import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/custom_icon_icons.dart';
import 'package:dunija/utils/quantities.dart';
import 'package:dunija/utils/styles.dart';
import 'package:dunija/widgets/category_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdminArea extends StatefulWidget {
  @override
  _AdminAreaState createState() => _AdminAreaState();
}

// final style = TextStyle(color: AppSettings.bgColor);

class _AdminAreaState extends State<AdminArea> with TickerProviderStateMixin {
  var pageName = 'Admin';

  TabController _tabController;
  ScrollController _scrollController;
  final _recipeSearchController = TextEditingController();
  final _userSearchController = TextEditingController();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _authorController = TextEditingController();

  int stages = 1;

  List<Widget> widgetList;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();

    widgetList = [renderPrepStage(index: 0, removable: false)];
  }

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //render Search Bar

    //
    return Scaffold(
      body: Stack(children: [
        Container(
          color: AppColors.accent,
          width: Numbers.deviceWidth,
          height: Numbers.deviceHeight,
        ),
        Positioned(
          top: 0.0,
          child: Image(
            image: AssetImage('assets/imgs/dunija_bg.png'),
            fit: BoxFit.fitHeight,
            width: Numbers.deviceWidth,
          ),
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Image(
            image: AssetImage('assets/imgs/top_right.png'),
            width: 200.0,
          ),
        ),
        Positioned(
          top: 0.0,
          right: -50.0,
          child: Image(
            image: AssetImage('assets/imgs/top_right.png'),
            width: 200.0,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.whiteColor,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ]),
                      SizedBox(
                        width: 0.0,
                      ),
                      Image(
                        image: AssetImage('assets/imgs/dunija.png'),
                        width: 120.0,
                      ),
                      SizedBox(
                        width: Numbers.deviceWidth - 230,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: TabBar(
                indicatorColor: AppColors.darkAccent.withOpacity(0.5),
                indicator: BoxDecoration(
                    color: AppColors.darkAccent.withOpacity(0.3),
                    borderRadius:
                        BorderRadius.circular(Numbers.largeBoxBorderRadius)),
                controller: _tabController,
                tabs: [
                  Tab(
                    icon: Icon(CustomIcon.food),
                  ),
                  Tab(
                    icon: Icon(Icons.add_box),
                  ),
                  Tab(
                    icon: Icon(Icons.mail),
                  ),
                  // Tab(
                  //   icon: Icon(Icons.add_box),
                  // ),
                  Tab(
                    icon: Icon(Icons.group),
                  ),
                ],
              ),
            ),

            //Bottom Section
            Expanded(
              child: Container(
                width: Numbers.deviceWidth,
                decoration: BoxDecoration(
                  color: AppColors.brightColor.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x33000000),
                        spreadRadius: 1.0,
                        blurRadius: 15.0)
                  ],
                ),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    //First Tab's View (Manage Recipe)
                    renderManageRecipeTabView(),

                    //Second Tab's View (Create Recipe)
                    renderNewRecipeTabView(),

                    //Third Tab's View ()
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Messages for users',
                        style: AppStyles.setTextStyle(),
                      ),
                    ),

                    //Fift Tab's View (Manage Users)
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'List of registered users',
                        style: AppStyles.setTextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              child: SizedBox(
                height: 0,
              ),
            ),
          ],
        )
      ]),
    );
  }

  ////////////////////////////////////////
  /// Recipe list item MODEL
  Widget createRecipeItem(
      {@required context,
      @required title,
      @required category,
      @required image}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0),
      decoration: BoxDecoration(
        color: AppColors.brightColor,
        boxShadow: [
          BoxShadow(
              spreadRadius: 0.5,
              blurRadius: 3.0,
              color: AppColors.darkAccent.withOpacity(0.2),
              offset: Offset(0, 1))
        ],
        borderRadius: BorderRadius.circular(Numbers.smallBoxBorderRadius),
      ),
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          print(title.toString());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          // margin: EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Numbers.smallBoxBorderRadius),
            color: AppColors.accent.withOpacity(0.5),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                AppColors.brightColor.withOpacity(0.5),
                AppColors.accent.withOpacity(0.1),
              ],
            ),
          ),
          //Child
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.0,
                child: image,
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                // width: Numbers.deviceWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.toString(),
                      style: AppStyles.setTextStyle(
                          weight: FontWeight.bold, size: 16.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(category.toString()),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                    color: AppColors.darkAccent.withOpacity(0.8),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {},
                    color: AppColors.accent.withOpacity(0.9),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Create Search Bar for recipe live view
  Widget createRecipeSearchBar() {
    return Container(
      alignment: Alignment.center,
      height: 40.0,
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: TextField(
        cursorColor: AppColors.darkAccent,
        controller: _recipeSearchController,
        maxLines: 1,
        style: TextStyle(fontSize: 14.0, height: 0.8),
        autocorrect: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.all(10.0),
          hintText: 'Search Recipes',
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

  //Create Manage Recipe List View
  Widget renderManageRecipeTabView() {
    return Column(
      children: [
        createRecipeSearchBar(),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          // alignment: Alignment.center,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 0.0),
            children: List.generate(
                10,
                (index) => createRecipeItem(
                    context: context,
                    title: 'Food Recipe ${index + 1}',
                    category: 'Category',
                    image: Icon(CustomIcon.food))),
          ),
        ),
      ],
    );
  }

  //Create New Recipe
  Widget renderNewRecipeTabView() {
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

  final TextEditingController _stageTitleController = TextEditingController(),
      _stageDurationController = TextEditingController(),
      _stageDescController = TextEditingController();

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
        controller: _stageDescController,
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
        controller: _stageTitleController,
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
