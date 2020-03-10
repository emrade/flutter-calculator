import 'package:calculator/theme.dart';
import 'package:calculator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  final String text;
  final bool isOperator;
  final Function onPressed;

  const Button({
    Key key,
    @required this.text,
    this.isOperator = false,
    @required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final Color textColor = isOperator && !theme.isDarkTheme
        ? CustomColors.primaryColor
        : text == "C"
            ? CustomColors.primaryColor
            : theme.isDarkTheme
                ? CustomColors.primaryLightColor
                : CustomColors.primaryDarkColor;

    final Color operatorCircleColor =
        theme.isDarkTheme ? Color(0xFF756959) : Color(0xFFDDDEE0);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
        elevation: 0,
        shape: CircleBorder(),
        onPressed: onPressed,
        color: isOperator ? operatorCircleColor : null,
        child: Container(
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
