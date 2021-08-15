import 'package:dunija/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppSectionItem extends StatelessWidget {
  final String title;
  final String image;
  final Function onTap;

  const AppSectionItem({
    Key key,
    @required this.title,
    @required this.image,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Image(image: AssetImage('assets/imgs/$image.png')),
            SizedBox(
              height: 10.0,
            ),
            Text(
              title,
              style: TextStyle(
                color: AppColors.lightAccent,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
