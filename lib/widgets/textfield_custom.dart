import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/quantities.dart';
import 'package:dunija/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomeTextField extends StatefulWidget {
  final hint, icon, controller, hidden, type;

  CustomeTextField({
    @required this.controller,
    @required this.hint,
    @required this.icon,
    this.hidden,
    this.type,
    Key key,
  }) : super(key: key);

  @override
  _CustomeTextFieldState createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  var _passwordHidden = true;
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    //Focus Node
    focusNode.addListener(() {
      print("${widget.hint} Has focus: ${focusNode.hasFocus}");
    });

    return Container(
      height: Numbers.buttonHeight,
      child: TextFormField(
        focusNode: focusNode,
        obscureText: widget.hidden == false ? false : _passwordHidden,
        cursorColor: AppColors.darkAccent,
        controller: widget.controller,
        textAlign: TextAlign.start,
        textInputAction: TextInputAction.done,
        style: AppStyles.textFieldLabel,
        decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: Icon(widget.icon),
            suffixIcon: setSuffixIcon(),
            filled: true,
            // fillColor: AppColors.textFieldLight,
            // focusColor: AppColors.universalLight,
            //
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Numbers.inputBorderRadius),
              borderSide: BorderSide(color: AppColors.darkAccent),
            ),

            //
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Numbers.inputBorderRadius),
              borderSide: BorderSide(color: AppColors.darkAccent),
            ),
            contentPadding: EdgeInsets.all(15.0)),
      ),
    );
  }

  Widget setSuffixIcon() {
    if (widget.hidden) {
      return InkWell(
        child: Icon(Icons.visibility),
        onTap: () {
          togglePasswordVisibility();
        },
      );
    } else {
      return null;
    }
  }

  togglePasswordVisibility() {
    setState(() {
      _passwordHidden = !_passwordHidden;
    });
  }
}
