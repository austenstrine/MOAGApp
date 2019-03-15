class MOAGAttributeEnum {
  final _value;

  const MOAGAttributeEnum._internal(this._value);

  toString() => '$_value';

  static const strength = const MOAGAttributeEnum._internal('strength');
  static const endurance = const MOAGAttributeEnum._internal('endurance');
  static const knowledge = const MOAGAttributeEnum._internal('knowledge');
  static const reasoning = const MOAGAttributeEnum._internal('reasoning');
  static const charisma = const MOAGAttributeEnum._internal('charisma');
  static const comeliness = const MOAGAttributeEnum._internal('comeliness');
  static const dexterity = const MOAGAttributeEnum._internal('dexterity');
  static const perception = const MOAGAttributeEnum._internal('perception');
  static const heal = const MOAGAttributeEnum._internal('heal');
  static const willpower = const MOAGAttributeEnum._internal('willpower');
}
