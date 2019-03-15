class RouteEnum {
  final _value;
  const RouteEnum._internal(this._value);
  toString() => '$_value';
  static RouteEnum getRoute_throws_(String fromString)
  {
    if (fromString != null && fromString != '')
    {
      switch (fromString)
      {
        case 'MOAGHomePage':
          return RouteEnum.MOAGHomePage;
        case 'CharacterCalculator':
          return RouteEnum.CharacterCalculator;
        case 'ItemIndex':
          return RouteEnum.ItemIndex;
        case 'ShopMaker':
          return RouteEnum.ShopMaker;
          //the below are titles
        case 'Character Calculator':
          return RouteEnum.CharacterCalculator;
        case 'Item Index':
          return RouteEnum.ItemIndex;
        case 'Shop Maker':
          return RouteEnum.ShopMaker;
        default:
          throw 'Invalid String.';
      }
    }
    throw 'Cannot convert empty string.';

  }

  static const MOAGHomePage = const RouteEnum._internal('/');
  static const CharacterCalculator = const RouteEnum._internal('/CharacterCalculator');
  static const ItemIndex = const RouteEnum._internal('/ItemIndex');
  static const ShopMaker = const RouteEnum._internal('/ShopMaker');
}

/*
class Enum {
  final _value;
  const Enum._internal(this._value);
  toString() => 'Enum.$_value';

  static const FOO = const Enum._internal('FOO');
  static const BAR = const Enum._internal('BAR');
  static const BAZ = const Enum._internal('BAZ');
}


const Map<Routes, String> PathForRoute = {
  Routes.MOAGHomePage: "/",
  Routes.CharacterCalculator: "/character_calculator",
  Routes.ItemIndex: "/item_index",
  Routes.ShopMaker: "/shop_maker",
};
*/