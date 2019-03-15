import 'package:flutter/material.dart';
import 'package:test_app/moag_home_page.dart';
import 'package:test_app/character_calculator.dart';
import 'package:test_app/routes.dart';

/*
MOAG app

used this to rename: https://stackoverflow.com/questions/46694153/changing-the-project-name/46694910

tool: Character Calculator
	Name
	Owner
	Misc. Details

	Attributes:
		Strength +[level] -extra- -base- -roll-
		Endurance
		Knowledge
		Reasoning
		Charisma
		Comeliness
		Dexterity
		Perception
		Heal
    Willpower

   Skill Types: checkbox for 'has teacher'
    RD +[level] -base- -roll-
    SED
    RP
    DP
    EDP
    SDP
    RDP
    ER
    CP
    KR

   XP:
    +[Earned] -Spent- -Balance-

tool: item index

  filters:
    equipment (explosive, gun, armor, utility)
    type (p,r,l) (light, heavy)
    species (gargonan compatible, etc)
    manufacturer (Conar empire, gargonan empire, cynec)
    price
    weight

tool: shop maker

  equipment
  type (small/cheap, vs large/expensive)
 */

void main() => runApp(MOAGApp());

class MOAGApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color brightTextColor = Color.fromARGB(255, 245, 255, 225);
    Color mainMoagMidnightBlue = Color.fromARGB(255, 30, 10, 90);
    Color accentMoagMidnightLavender = Color.fromARGB(255, 60, 20, 180);
    Color brightMoagLilac = Color.fromARGB(255, 180, 180, 255);
    Color selectionHandleRoyalPurple = Color.fromARGB(255, 120, 60, 120);
    ThemeData darkPurpleTheme = ThemeData(
        fontFamily: 'TitilliumWeb',
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: brightTextColor,
            displayColor: brightTextColor,
            decorationColor: brightTextColor),
        buttonTheme: ButtonThemeData(
            buttonColor: accentMoagMidnightLavender.withAlpha(128),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)))),
        primaryColor: mainMoagMidnightBlue,
        primaryColorBrightness: Brightness.dark,
        accentColor: accentMoagMidnightLavender,
        accentColorBrightness: Brightness.dark,
        brightness: Brightness.dark,
        primaryColorLight: brightMoagLilac,
        cursorColor: brightTextColor,
        textSelectionHandleColor: selectionHandleRoyalPurple);

    return MaterialApp(
      title: 'MOAG Assistant',
      theme: darkPurpleTheme,
      initialRoute: '/',
      routes: {
        RouteEnum.MOAGHomePage.toString(): (context) => HomePage(),
        RouteEnum.CharacterCalculator.toString(): (context) =>
            CharacterCalculatorPage()
      },
    );
  }
}
