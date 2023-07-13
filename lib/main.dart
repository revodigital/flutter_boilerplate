import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_revo_boilerplate/stroybook/dashbook.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'feedback/feedbackHandler.dart';
import 'navigation/BottomNavigation.dart';

void main() async {
  await initHiveForFlutter();
  await dotenv.load(fileName: "./lib/.env");
  final dashbookApp = DashbookApp().init();
  
  runApp(dotenv.env["STORYBOOK"] == "true" ? dashbookApp : const MyApp());
}

class MyApp extends StatefulWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey preview = GlobalKey();

  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FeedbackHandler().initShakeCallback();
  }

  void init() async {

  }

  @override
  void dispose() async {
    FeedbackHandler().disposeShakeCallback();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: RepaintBoundary(
              key: MyApp.preview,
              child: const BottomNavigation(),
            ),
          );
        }
    );
  }
}
