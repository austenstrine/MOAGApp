import 'package:flutter/material.dart';
import 'routes.dart';
import 'attribute_row.dart';
import 'attribute_enum.dart';
import 'base_data.dart';
import 'skill_class_row.dart';
import 'skill_class_enum.dart';
import 'enum_level_pair.dart';

class CharacterCalculatorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print("[CharacterCalculatorPage]createState()");
    return _CharacterCalculatorPageState();
  }
}

class _CharacterCalculatorPageState extends State<CharacterCalculatorPage>
{
  List<BaseData<MOAGAttributeEnum>> attributeData = [
    BaseData<MOAGAttributeEnum>(MOAGAttributeEnum.strength),
    BaseData<MOAGAttributeEnum>(MOAGAttributeEnum.endurance),
    BaseData<MOAGAttributeEnum>(MOAGAttributeEnum.knowledge),
    BaseData<MOAGAttributeEnum>(MOAGAttributeEnum.reasoning),
    BaseData<MOAGAttributeEnum>(MOAGAttributeEnum.charisma),
    BaseData<MOAGAttributeEnum>(MOAGAttributeEnum.comeliness),
    BaseData<MOAGAttributeEnum>(MOAGAttributeEnum.dexterity),
    BaseData<MOAGAttributeEnum>(MOAGAttributeEnum.perception),
    BaseData<MOAGAttributeEnum>(MOAGAttributeEnum.heal),
    BaseData<MOAGAttributeEnum>(MOAGAttributeEnum.willpower)
  ];

  List<BaseData<MOAGSkillClassEnum>> skillClassData = [
    BaseData<MOAGSkillClassEnum>(MOAGSkillClassEnum.RD),
    BaseData<MOAGSkillClassEnum>(MOAGSkillClassEnum.SED),
    BaseData<MOAGSkillClassEnum>(MOAGSkillClassEnum.RP),
    BaseData<MOAGSkillClassEnum>(MOAGSkillClassEnum.DP),
    BaseData<MOAGSkillClassEnum>(MOAGSkillClassEnum.EDP),
    BaseData<MOAGSkillClassEnum>(MOAGSkillClassEnum.SDP),
    BaseData<MOAGSkillClassEnum>(MOAGSkillClassEnum.RDP),
    BaseData<MOAGSkillClassEnum>(MOAGSkillClassEnum.ER),
    BaseData<MOAGSkillClassEnum>(MOAGSkillClassEnum.CP),
    BaseData<MOAGSkillClassEnum>(MOAGSkillClassEnum.KR),
  ];

  @override
  void initState() {
    print("[_CharacterCalculatorPageState]initState()");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("[_CharacterCalculatorPageState]build()");

    void _calculateBaseForSkills() {
      int strengthRoll = 25;
      int enduranceRoll = 25;
      int knowledgeRoll = 25;
      int reasoningRoll = 25;
      int charismaRoll = 25;
      int comelinessRoll = 25;
      int dexterityRoll = 25;
      int perceptionRoll = 25;
      int healRoll = 25;
      int willpowerRoll = 25;
      for (BaseData<MOAGAttributeEnum> attributeBaseData in attributeData) {
        switch (attributeBaseData.dataNameEnum) {
          case MOAGAttributeEnum.strength:
            strengthRoll = attributeBaseData.getRoll();
            break;
          case MOAGAttributeEnum.endurance:
            enduranceRoll = attributeBaseData.getRoll();
            break;
          case MOAGAttributeEnum.knowledge:
            knowledgeRoll = attributeBaseData.getRoll();
            break;
          case MOAGAttributeEnum.reasoning:
            reasoningRoll = attributeBaseData.getRoll();
            break;
          case MOAGAttributeEnum.charisma:
            charismaRoll = attributeBaseData.getRoll();
            break;
          case MOAGAttributeEnum.comeliness:
            comelinessRoll = attributeBaseData.getRoll();
            break;
          case MOAGAttributeEnum.dexterity:
            dexterityRoll = attributeBaseData.getRoll();
            break;
          case MOAGAttributeEnum.perception:
            perceptionRoll = attributeBaseData.getRoll();
            break;
          case MOAGAttributeEnum.heal:
            healRoll = attributeBaseData.getRoll();
            break;
          case MOAGAttributeEnum.willpower:
            willpowerRoll = attributeBaseData.getRoll();
            break;
        }
      }
      List<BaseData<MOAGSkillClassEnum>> newSkillClassData = [];
      for (BaseData<MOAGSkillClassEnum> skillClassBaseData in skillClassData)
      {
        List<int> baseRolls = [];
        switch (skillClassBaseData.dataNameEnum) {
          case MOAGSkillClassEnum.RD:
            baseRolls = [reasoningRoll, dexterityRoll];
            break;
          case MOAGSkillClassEnum.SED:
            baseRolls = [strengthRoll, enduranceRoll, dexterityRoll];
            break;
          case MOAGSkillClassEnum.RP:
            baseRolls = [reasoningRoll, perceptionRoll];
            break;
          case MOAGSkillClassEnum.DP:
            baseRolls = [dexterityRoll, perceptionRoll];
            break;
          case MOAGSkillClassEnum.EDP:
            baseRolls = [enduranceRoll, dexterityRoll, perceptionRoll];
            break;
          case MOAGSkillClassEnum.SDP:
            baseRolls = [strengthRoll, dexterityRoll, perceptionRoll];
            break;
          case MOAGSkillClassEnum.RDP:
            baseRolls = [reasoningRoll, dexterityRoll, perceptionRoll];
            break;
          case MOAGSkillClassEnum.ER:
            baseRolls = [enduranceRoll, reasoningRoll];
            break;
          case MOAGSkillClassEnum.CP:
            baseRolls = [charismaRoll, perceptionRoll];
            break;
          case MOAGSkillClassEnum.KR:
            baseRolls = [knowledgeRoll, reasoningRoll];
            break;
        }

        newSkillClassData.add(BaseData<MOAGSkillClassEnum>(
            skillClassBaseData.dataNameEnum,
            level: skillClassBaseData.level,
            baseValues: baseRolls));
      }
      skillClassData = newSkillClassData;
    }

    void _handleAttributeLevelChanged(
        EnumLevelPair<MOAGAttributeEnum> attributeLevel) {
      print("[_CharacterCalculatorPageState]_handleAttributeLevelChanged()");
      setState(() {
        int parsedLevel = int.parse(attributeLevel.value);
        for (int i = 0; i < attributeData.length; i++) {
          if (attributeData[i].dataNameEnum.toString() ==
              attributeLevel.name.toString()) {
            attributeData[i] = BaseData<MOAGAttributeEnum>(attributeLevel.name,
                level: parsedLevel);
            _calculateBaseForSkills();

            return;
          }
        }
        print("Could not find attribute " + attributeLevel.name.toString());
      });
    }

    void _handleSkillClassLevelChanged(
        EnumLevelPair<MOAGSkillClassEnum> skillClassLevel)
    {
      print("[_CharacterCalculatorPageState]_handleSkillClassLevelChanged()");
      setState(() {
        int parsedLevel = int.parse(skillClassLevel.value);
        for (int i = 0; i < skillClassData.length; i++) {
          if (skillClassData[i].dataNameEnum.toString() ==
              skillClassLevel.name.toString()) {
            skillClassData[i] = BaseData<MOAGSkillClassEnum>(
                skillClassLevel.name,
                level: parsedLevel,
                baseValues: [skillClassData[i].base]);
            break;
          }
        }
        print("Could not find skillClass " + skillClassLevel.name.toString());
      });
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleSpacing: 0,
          actions: <Widget>[
            FlatButton(
              child: Container(
                child: Image.asset('assets/title.png', fit: BoxFit.fitWidth),
                width: 60,
              ),
              onPressed: () {
                Navigator.popUntil(context,
                    ModalRoute.withName(RouteEnum.MOAGHomePage.toString()));
              },
            )
          ],
          title: Text('Character Calculator'),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return Container(
              padding: EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              width: 120,
                              child: Text(
                                "Attribute",
                                textAlign: TextAlign.left,
                              )),
                          Container(
                              width: 60,
                              child: Text(
                                "Level",
                                textAlign: TextAlign.center,
                              )),
                          Container(
                              width: 40,
                              child: Text(
                                "Base",
                                textAlign: TextAlign.center,
                              )),
                          Container(
                              width: 40,
                              child: Text(
                                "Roll",
                                textAlign: TextAlign.right,
                              )),
                        ],
                      )),
                  Container(
                      height: 200,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                              width: 1,
                              color: Theme.of(context).primaryColorLight,
                              style: BorderStyle.solid)),
                      child: ListView(
                        children: attributeData
                            .map((element) => AttributeRow(
                                element, _handleAttributeLevelChanged))
                            .toList(),
                      )),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              width: 120,
                              child: Text(
                                "Skill Class",
                                textAlign: TextAlign.left,
                              )),
                          Container(
                              width: 60,
                              child: Text(
                                "Level",
                                textAlign: TextAlign.center,
                              )),
                          Container(
                              width: 40,
                              child: Text(
                                "Base",
                                textAlign: TextAlign.center,
                              )),
                          Container(
                              width: 40,
                              child: Text(
                                "Roll",
                                textAlign: TextAlign.right,
                              )),
                        ],
                      )),
                  Container(
                      height: 200,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                              width: 1,
                              color: Theme.of(context).primaryColorLight,
                              style: BorderStyle.solid)),
                      child: ListView(
                        children: skillClassData
                            .map((element) => SkillClassRow(
                                element, _handleSkillClassLevelChanged))
                            .toList(),
                      )),
                ],
              ));
        }));
  }
}
