import 'package:calculator/global_widgets/custom_switch.dart';
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

    // final switcher = SwitchListTile(
    //   value: theme.isDarkTheme,
    //   onChanged: (value) {
    //     theme.toggleTheme();
    //   },
    // );

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 40.0),
        child: Column(children: [switcher]),
      ),
    );
  }
}
