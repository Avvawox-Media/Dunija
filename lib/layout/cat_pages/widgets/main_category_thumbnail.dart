import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/quantities.dart';
import 'package:dunija/utils/styles.dart';
import 'package:flutter/material.dart';

class MainCategoryThumbnail extends StatefulWidget {
  final String title;
  final String image;
  final Function onTap;

  const MainCategoryThumbnail({Key key, this.title, this.image, this.onTap})
      : super(key: key);
  @override
  _MainCategoryThumbnailState createState() => _MainCategoryThumbnailState();
}

class _MainCategoryThumbnailState extends State<MainCategoryThumbnail> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Align(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Numbers.smallBoxBorderRadius),
            color: AppColors.accent,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3.0,
                  spreadRadius: 1.0)
            ],
          ),
          width: 0.45 * Numbers.deviceWidth,
          height: 0.46 * Numbers.deviceWidth,
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Numbers.smallBoxBorderRadius),
                  color: AppColors.lightAccent,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.darkAccent.withOpacity(0.5),
                        blurRadius: 10.0,
                        spreadRadius: 1.0)
                  ],
                ),
                width: 0.45 * Numbers.deviceWidth,
                height: 0.36 * Numbers.deviceWidth,
                child: Image(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
                alignment: Alignment.center,
              ),
              Center(
                child: Text(
                  widget.title,
                  style: Numbers.deviceWidth > 500
                      ? AppStyles.catBigLabel
                      : AppStyles.catLabel,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 2.0,
              )
            ],
          ),
        ),
      ),
      onTap: () {
        //
        widget.onTap();
      },
    );
  }
}
