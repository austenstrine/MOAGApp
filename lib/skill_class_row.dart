import 'package:flutter/material.dart';
import 'skill_class_enum.dart';
import 'base_data.dart';
import 'enum_level_pair.dart';

class SkillClassRow extends StatelessWidget {
  final BaseData<MOAGSkillClassEnum> skillClassData;
  final ValueChanged<EnumLevelPair<MOAGSkillClassEnum>> valueChanged;

  SkillClassRow(this.skillClassData, this.valueChanged);

  void _handleFieldChange(String fieldChange) {
    print("[SkillClassRow]_handleFieldChange()");
    EnumLevelPair<MOAGSkillClassEnum> newLevel =
        EnumLevelPair<MOAGSkillClassEnum>(
            skillClassData.dataNameEnum, fieldChange);
    valueChanged(newLevel);
  }

  @override
  Widget build(BuildContext context) {
    print("[SkillClassRow]build()");
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 0,
              child: Container(
                width: 120,
                child: Text(
                  skillClassData.dataNameEnum.toString().toUpperCase(),
                  textAlign: TextAlign.left,
                ),
              )),
          Expanded(
              flex: 0,
              child: Container(
                  color: Theme.of(context).accentColor.withAlpha(128),
                  width: 60,
                  child: TextField(
                    decoration: InputDecoration.collapsed(hintText: "LEVEL"),
                    controller: TextEditingController.fromValue(
                        TextEditingValue(
                            text: skillClassData.level.toString(),
                            selection: TextSelection.collapsed(
                                offset:
                                    skillClassData.level.toString().length))),
                    onSubmitted: (fieldSubmission) {
                      print('This is the submission: $fieldSubmission');
                      _handleFieldChange(fieldSubmission);
                    },
                    onChanged: (fieldChange) {
                      print('This is the change: $fieldChange');
                      _handleFieldChange(fieldChange);
                    },
                  ))),
          Expanded(
              flex: 0,
              child: Container(
                  width: 30,
                  child: Text(
                    skillClassData.base.toString(),
                    textAlign: TextAlign.center,
                  ))),
          Expanded(
              flex: 0,
              child: Container(
                  width: 30,
                  child: Text(
                    skillClassData.getRoll().toString(),
                    textAlign: TextAlign.right,
                  )))
        ]);
  }
}
