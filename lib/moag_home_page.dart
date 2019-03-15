import 'package:flutter/material.dart';
import 'character_calculator.dart';
import 'routes.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size getScreenSize() {
      return MediaQuery.of(context).size;
    }

    List<String> _toolTitles = [
      'Character Calculator',
      'Item Index',
      'Shop Maker'
    ];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset('assets/title.png', fit: BoxFit.cover),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return Container(
              constraints: BoxConstraints.expand(
                height: getScreenSize().height,
              ),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/spaceBack.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView(
                  padding: EdgeInsets.all(0),
                  children: _toolTitles
                      .map((title) => Container(
                          padding: EdgeInsets.fromLTRB(12, 6, 12, 0),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RouteEnum.getRoute_throws_(title).toString(),
                              );
                            },
                            child: Text(title),
                          )))
                      .toList()));
        }));
  }
}
