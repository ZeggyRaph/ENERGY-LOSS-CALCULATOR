//'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'portrait.dart';
import 'landscape.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(EnergylossCalculator());
}

class EnergylossCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //USING THE MATERIALAPP THEME PROPS.
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(
          // primaryColor: Color(0xFF0A0E21),
          backgroundColor: Color(0xFF0A0E21),
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

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
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (MediaQuery.of(context).orientation == Orientation.landscape) {
              return LandscapeView();
            } else {
              return PortraitView();
            }
          },
        )
        //PortraitView(),
        //PUTTING EVERTHING INSIDE A CONTAINING SO AS TO HAVE SOME MARGIN & PADDING PROPS.
        );
  }
}
