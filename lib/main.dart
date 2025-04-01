// ignore_for_file: unused_local_variable, duplicate_ignore

import 'package:energy_loss_calculator/screens/amp_to_kw_Kwh_screen.dart';
import 'package:energy_loss_calculator/screens/calculator_screen.dart';
import 'package:energy_loss_calculator/screens/load_calculator_screen.dart';
import 'package:energy_loss_calculator/screens/loss_of_revenue.dart';
import 'package:energy_loss_calculator/screens/negative_kwh.dart';
import 'package:energy_loss_calculator/screens/power_to_current_screen.dart';
import 'package:energy_loss_calculator/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'screens/portrait.dart';
import 'landscape.dart';
import 'package:flutter/services.dart';
import 'palette.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(EnergylossCalculator());
}



class EnergylossCalculator extends StatelessWidget {
// Using "static" so that we can easily access it later
  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.dark);

  const EnergylossCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(

                primarySwatch: Palette.myColor,
              ),
              darkTheme: ThemeData.dark().copyWith(
                //For darkmode scaffold color
                scaffoldBackgroundColor: const Color(0xFF0A0E21),

                //For dark mode appBar color
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color(0xFF0A0E21),
                ),
              ),
              themeMode: currentMode,



              initialRoute: '/',
              routes: {
                '/': (context) => MainPage(),
                '/second': (context) => const PortraitView(),
                '/third': (context) => const PowerToCurrentScreen(),
                '/fourth': (context) => const Energy(),
                '/fifth': (context) => const LorCharge(),
                '/sixth': (context) => const NegativeKwh(),
                '/seventh': (context) => const CalculatorScreen(),
                '/eighth': (context) => const LoadCalculatorScreen(),


              });
        });}}





class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    // ignore: unused_local_variable
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
          title: const Center(
            child: Text(
              'ENERGY CALCULATOR',
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
              return const LandscapeView();
            } else {
              return const WelcomeScreen();
            }
          },
        )
    );
  }
}




