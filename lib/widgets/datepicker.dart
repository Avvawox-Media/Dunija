import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/quantities.dart';
import 'package:dunija/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateOfBirth extends StatefulWidget {
  final dob;

  DateOfBirth({@required this.dob, Key key}) : super(key: key);
  @override
  _DateOfBirthState createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  var selecteDate = 'Date of Birth';
  var selectedDate =
      DateTime(DateTime.now().year - 13, DateTime.january, DateTime.now().day);
  var restrictedDate = DateTime.now().subtract(Duration(days: 4745));
  var formater = DateFormat('yyyy-MM-dd');

  //
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        decoration: BoxDecoration(
          // color: AppColors.textFieldLight,
          borderRadius: BorderRadius.circular(Numbers.largeBoxBorderRadius),
        ),
        width: Numbers.centerBoxWidth,
        height: Numbers.buttonHeight,
        child: Row(children: [
          Icon(
            Icons.calendar_today,
            color: Colors.grey.shade600,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            formater.format(selectedDate) ==
                    formater.format(DateTime(DateTime.now().year - 13,
                        DateTime.january, DateTime.now().day))
                ? selecteDate
                : formater.format(selectedDate),
            style: AppStyles.textFieldLabel,
          ),
        ]),
      ),
      onTap: () {
        selectDate(context);
      },
    );
  }

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1900),
      lastDate: restrictedDate,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.accent,
            accentColor: AppColors.accent, //selection color
            dialogBackgroundColor: AppColors.whiteColor,
            colorScheme: ColorScheme.light().copyWith(
              primary: AppColors.accent,
              secondary: AppColors.accent,
            ), //Background color
          ),
          child: child,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // RegisterSecond.selectedDOB = formater.format(selectedDate);
      });
    }
  }
}
