import 'package:flutter/material.dart';
import 'attribute_enum.dart';
import 'base_data.dart';
import 'enum_level_pair.dart';

class AttributeRow extends StatelessWidget {
  final BaseData<MOAGAttributeEnum> attributeData;
  final ValueChanged<EnumLevelPair<MOAGAttributeEnum>> valueChanged;

  AttributeRow(this.attributeData, this.valueChanged);

  void _handleFieldChange(String fieldChange) {
    print("[AttributeRow]_handleFieldChange()");
    EnumLevelPair<MOAGAttributeEnum> newLevel =
    EnumLevelPair<MOAGAttributeEnum>(attributeData.dataNameEnum, fieldChange);
    valueChanged(newLevel);
  }

  @override
  Widget build(BuildContext context) {
    print("[AttributeRow]build()");
    print("Attribute Data Object: $attributeData");
    MOAGAttributeEnum data = attributeData.dataNameEnum;
    print("Attribute Data Enum: $data");
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 0,
              child: Container(
                width: 120,
                child: Text(
                  attributeData.dataNameEnum.toString().toUpperCase(),
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
                            text: attributeData.level.toString(),
                            selection: TextSelection.collapsed(
                                offset: attributeData.level.toString().length))),
//                    onSubmitted: (fieldChange) {
//                      print('This is the change: $fieldChange');
//                      _handleFieldChange(fieldChange);
//                    },
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
                    attributeData.base.toString(),
                    textAlign: TextAlign.center,
                  ))),
          Expanded(
              flex: 0,
              child: Container(
                  width: 30,
                  child: Text(
                    attributeData.getRoll().toString(),
                    textAlign: TextAlign.right,
                  )))
        ]);
  }
}
