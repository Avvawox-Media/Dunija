import 'package:dunija/utils/colors.dart';
import 'package:flutter/material.dart';

class MainItem extends StatelessWidget {
  final String title;
  final String image;
  final Function onTap;

  const MainItem({
    Key key,
    @required this.title,
    @required this.image,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
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
