import 'package:flutter/material.dart';
import 'portrait.dart';
import 'landscape.dart';
import 'package:flutter/services.dart';
import 'palette.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // final double screenHeight =
  //MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
  //if (screenHeight < 360) {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // } else {
  // SystemChrome.setPreferredOrientations([
  //  DeviceOrientation.portraitUp,
  // DeviceOrientation.portraitDown,
  //  DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight
  //]);
  // }
  runApp(EnergylossCalculator());
}

class EnergylossCalculator extends StatelessWidget {
// Using "static" so that we can easily access it later
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            //TO REMOVE THE DEBUG BANNER
            debugShowCheckedModeBanner: false,

            //USING THE MATERIALAPP THEME PROPS.
            /* theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Color(0xFF0A0E21),
              appBarTheme: AppBarTheme(
                // primaryColor: Color(0xFF0A0E21),
                backgroundColor: Color(0xFF0A0E21),
              ),
            ),*/
            theme: ThemeData(
              //scaffoldBackgroundColor: Colors.blue,
              // accentColor: Colors.red,
              // brightness: Brightness.dark,
              // primaryColor: Colors.teal

              //For light mode appbar color
              primarySwatch: Palette.myColor,
            ),
            darkTheme: ThemeData.dark().copyWith(
              //For darkmode scaffold color
              scaffoldBackgroundColor: Color(0xFF0A0E21),

              //For darkmode appBar color
              appBarTheme: AppBarTheme(
                backgroundColor: Color(0xFF0A0E21),
              ),
            ),
            themeMode: currentMode,

            home: MainPage(),
          );
        });
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // final data = MediaQuery.of(context);
    // Size size = MediaQuery.of(context).size;
    // Orientation orientation = MediaQuery.of(context).orientation;
    // double boxSide = size.shortestSide;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // CENTERING AND STYLING THE APPBAR
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(
                    EnergylossCalculator.themeNotifier.value == ThemeMode.light
                        ? Icons.dark_mode
                        : Icons.light_mode),
                onPressed: () {
                  EnergylossCalculator.themeNotifier.value =
                      EnergylossCalculator.themeNotifier.value ==
                              ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                })
          ],
          title: Center(
            child: Text(
              'ENERGY LOSS CALCULATOR',
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xFFA5672B),
              ),
            ),
          ),
        ),
        body:
            //THIS CHECKS THE ORIENTATION AND RENDERS ACCORDINGLY
            OrientationBuilder(
          builder: (context, orientation) {
              if (MediaQuery.of(context).orientation == Orientation.landscape) {
                return LandscapeView();
              } else {
                return PortraitView();
              }
          },
        ),

        //PortraitView(),
        //PUTTING EVERTHING INSIDE A CONTAINING SO AS TO HAVE SOME MARGIN & PADDING PROPS.
        );
  }
}
