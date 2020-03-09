import 'package:calculator/global_widgets/custom_switch.dart';
import 'package:calculator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    final switcher = CustomSwitch(
      value: !theme.isDarkTheme,
      onChanged: (bool val) {
        theme.toggleTheme();
      },
    );

    final historyBtn = GestureDetector(
      onTap: () {},
      child: Text(
        "History",
        style: TextStyle(
          fontSize: 18.0,
          color: theme.isDarkTheme ? CustomColors.primaryColor : CustomColors.primaryDarkColor
        ),
      ),
    );

    final controls = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          switcher,
          historyBtn,
        ],
      ),
    );

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 40.0),
        child: Column(children: [controls]),
      ),
    );
  }
}
