import 'package:echelon/app/app.locator.dart';
import 'package:echelon/app/app.router.dart';
import 'package:echelon/firebase_options.dart';
import 'package:echelon/services/hive_service.dart';
import 'package:echelon/ui/common/shared_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  await ThemeManager.initialise();
  await locator<HiveService>().initializeHive();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, orientation, deviceType) {
        return ThemeBuilder(
          lightTheme: AppThemes.light,
          darkTheme: AppThemes.dark,
          defaultThemeMode: ThemeMode.system,
          builder: (_, lightTheme, darkTheme, themeMode) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Echelon',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeMode,
              navigatorKey: StackedService.navigatorKey,
              onGenerateRoute: StackedRouter().onGenerateRoute,
              navigatorObservers: [
                StackedService.routeObserver,
              ],
            );
          },
        );
      },
    );
  }
}
