import 'package:flutter/material.dart';
import 'core/services/service_locator.dart';
import 'core/widgets/home_layout.dart';
import 'core/util/themes.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI App',
      theme: appTheme(),
      initialRoute: HomeLayout.routeName,
      onGenerateRoute: (settings) {
        if (settings.name == HomeLayout.routeName) {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeLayout(),
          );
        }
        return null;
      },
    );
  }
}
