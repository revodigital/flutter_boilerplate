import 'dart:convert';

//import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
//import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/view/error_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl_standalone.dart';
import 'package:logger/logger.dart';
//import 'package:flutter_revo_boilerplate/view/first_view.dart';
//import 'package:flutter_revo_boilerplate/view/installer_home_view.dart';
//import 'package:flutter_revo_boilerplate/view/user_home_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
//import 'package:screenshot/screenshot.dart';
//import 'package:shake_gesture/shake_gesture.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'amplifyconfiguration.dart';
import 'package:flutter_revo_boilerplate/model/auth_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:widgetbook_workspace/main.dart';

import 'navigation/router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load();
  await ScreenUtil.ensureScreenSize();
  findSystemLocale();
  if (dotenv.env['STORYBOOK']! == 'true') {
    FlutterNativeSplash.remove();
    runApp(const WidgetbookApp());
  } else {
    runApp(const MainApp());
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey preview = GlobalKey();
  //static ScreenshotController screenshotController = ScreenshotController();

  static void navigateToScreen (BuildContext context, AppRouterRouteInfo routeInfo, {required Function updateScreen}) {
    context.push(routeInfo.value, extra: routeInfo.extra).then((_) {
      updateScreen();
    });
  }

  static void replaceScreen (BuildContext context, AppRouterRouteInfo routeInfo, {required Function updateScreen}) {
    while (context.canPop() == true) {
      context.pop();
    }
    context.push(routeInfo.value, extra: routeInfo.extra).then((_) {
      updateScreen();
    });
  }

  @override
  State<MainApp> createState() => _MC2App();
}

class _MC2App extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    //_configureAmplify().then((_) {
      _getLoginStatus().then((_) {
        FlutterNativeSplash.remove();
      });
    //});
  }

  /*Future<void> _configureAmplify() async {
    try {
      final auth = AmplifyAuthCognito();
      await Amplify.addPlugin(auth);

      await Amplify.configure(amplifyconfig);
    } on Exception catch (e, s) {
      Logger().e('[MAIN_1]: $e $s');
    }
  }*/

  Future<void> _getLoginStatus () async {
    final prefs = await SharedPreferences.getInstance();
    String? loggedAs = prefs.getString('logged_as');
    //final authSession = (await Amplify.Auth.fetchAuthSession()) as CognitoAuthSession;

    if (loggedAs != null/* && authSession.isSignedIn*/){
      final json = jsonDecode(loggedAs);
      AuthGetModel.fromJson(json);
      AuthGetModel auth = AuthGetModel();

      if (auth.email != null && auth.email != 'null') {
        try {
          /*Response<User>? response = await MC2ApiClient.client.userGet();
          if (response.body != null){
            auth = AuthGetModel(
              email: response.body?.email,
              profilePicture: response.body?.image?.url,
              name: response.body?.name,
              surname: response.body?.lastName,
              type: response.body?.type,
              id: authSession.userPoolTokensResult.value.userId,
            );

            if (response.body!.type == UserType.installer) {
              _initialLocation = const InstallerHomeView();
            } else {
              _initialLocation = const UserHomeView();
            }
          }*/

          auth = AuthGetModel(
            email: 'giosue@revodigital.it',
            profilePicture: 'fakeUrl',
            name: 'Giosue',
            surname: 'Trapani',
            id: 'authSession.userPoolTokensResult.value.userId',
          );

          prefs.setString('logged_as', auth.toJsonString());
          MainApp.replaceScreen(context, AppRouterRoutes.home.value, updateScreen: (){});
        } catch (e, s) {
          Logger().e('[MAIN_2]: $e $s');
        }
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
      bottom: false,
      top: false,
      child: ScreenUtilInit(
        designSize: const Size(390, 827),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        builder: (_, context) {
          return AdaptiveTheme(
            initial: AdaptiveThemeMode.system,
            light: ThemeData.light(useMaterial3: true),
            dark: ThemeData.dark(useMaterial3: true),
            builder: (theme, darkTheme) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Boilerplate',
                theme: theme,
                darkTheme: darkTheme,
                color: CustomColors.primary[50],
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: AppRouter.getRouter(),
                builder: (context, widget) {
                  return RepaintBoundary(
                    key: MainApp.preview,
                    child: ResponsiveSizer(
                      builder: (context, orientation, screenType) {
                        return widget ?? ErrorView();
                      },
                    ),
                  );
                },
              );
            }
          );
        },
      ),
    );
  }
}