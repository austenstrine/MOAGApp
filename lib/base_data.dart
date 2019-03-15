class BaseData<T> {
  final T dataNameEnum;
  final int level;
  int base;
  int _roll;

  BaseData(this.dataNameEnum, {this.level: 0, List<int> baseValues}) {
    _calculateBase(baseValues);
    _calculateRoll();
  }

  void _calculateBase(List<int> baseValues)
  {
    if (baseValues != null && baseValues.isNotEmpty)
    {
      int added = 0;
      baseValues.forEach((value) => added += value);
      base = ((added / baseValues.length) + 0.99).toInt();
    }
    else
    {
      base = 25;
    }
  }

  void _calculateRoll() {
    this._roll = this.base - this.level;
    if (this.level == 0)
    {
      this._roll += 10;
    }
  }

  int getRoll() {
    return this._roll;
  }
}
