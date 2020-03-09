import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router.dart' as router;
import 'theme.dart';
import 'utils/utils.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>.value(value: ThemeChanger()),
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: theme.isDarkTheme ? darkTheme : lightTheme,
      onGenerateRoute: router.generateRoute,
      initialRoute: router.homeViewRoute,
    );
  }
}
