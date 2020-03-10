import 'package:calculator/global_widgets/button.dart';
import 'package:calculator/global_widgets/custom_switch.dart';
import 'package:calculator/utils/colors.dart';
import 'package:calculator/view_models/home.vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final model = Provider.of<HomeViewModel>(context);
    final double screenHeight = MediaQuery.of(context).size.height;

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
            color: theme.isDarkTheme
                ? CustomColors.primaryColor
                : CustomColors.primaryDarkColor),
      ),
    );

    final controls = Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          switcher,
          historyBtn,
        ],
      ),
    );

    final equation = Expanded(
      child: SingleChildScrollView(
        reverse: true,
        child: Container(
          alignment: Alignment.centerRight,
          child: Text(
            model.equation,
            style: TextStyle(
              fontSize: model.equationFontSize,
              color: CustomColors.primaryColor,
            ),
          ),
        ),
      ),
    );

    final result = Container(
      height: screenHeight * 0.1,
      alignment: Alignment.centerRight,
      child: Text(
        model.result,
        style: TextStyle(
          fontSize: model.resultFontSize,
          fontWeight: FontWeight.w500,
          color: CustomColors.primaryColor,
        ),
      ),
    );

    final screen = Container(
      child: Column(
        children: <Widget>[equation, result],
      ),
    );

    final keypad = Container(
      child: GridView.builder(
        itemCount: model.buttons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (BuildContext context, int index) {
          String val = model.buttons[index];
          return Button(
            text: val,
            isOperator: model.isOperator(val),
            onPressed: () => model.buttonPressed(val),
          );
        },
      ),
    );

    final calculator = Expanded(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(child: screen),
            Expanded(
              child: keypad,
              flex: 3,
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 40.0),
        child: Column(children: [controls, calculator]),
      ),
    );
  }
}
