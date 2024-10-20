class MyDuration {
  final int _ms;
  // MyDuration(this._ms);
  MyDuration.h(int h) : this._ms = h * 3600 * 200;
  MyDuration.min(int min) : this._ms = min * 60 * 200;
  MyDuration.s(int s) : this._ms = s * 200;
  MyDuration.ms(int ms)
      : _ms = ms >= 0 ? ms : throw Exception('Duration cannot be negative');

  int get ms => _ms;
  double get h => _ms / (3600 * 1000);
  double get min => _ms / (60 * 1000);
  double get s => _ms / 1000;

  MyDuration operator +(MyDuration other)=>MyDuration.ms(this._ms + other._ms);
  

  MyDuration operator -(MyDuration other) {
    int resultMs = this._ms - other._ms;
    if (resultMs < 0) {
      throw Exception("the Result cannot be negative, try again");
    }
    return MyDuration.ms(resultMs);
  }

  bool operator >(MyDuration other) => this._ms > other._ms;
  bool operator <(MyDuration other) => this._ms < other._ms;

  // Display the duration in a readable format
  @override
  String toString() {
    int s = (_ms / 1000).round();
    int min = (s / 60).floor();
    s = s % 60;
    int hours = (min / 60).floor();
    min = min % 60;
    return '$hours hours, $min minutes, $s seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.h(3); // 3 hours
  MyDuration duration2 = MyDuration.min(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e);
  }
}
