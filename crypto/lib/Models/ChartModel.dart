class ChartModel {
  int time;
  double? open;
  double? high;
  double? low;
  double? close;

  ChartModel({required this.time, this.open, this.high, this.low, this.close});

  factory ChartModel.fromJson(List l) {
    return ChartModel(
      time: l[0] == null ? 0 : _formatTime(l[0] as int),
      open: l[1] == null ? null : l[1] as double,
      high: l[2] == null ? null : l[2] as double,
      low: l[3] == null ? null : l[3] as double,
      close: l[4] == null ? null : l[4] as double,
    );
  }

  static int _formatTime(int timestamp) {
    String formattedTime = timestamp.toString().substring(0, 8);
    return int.parse(formattedTime);
  }
}
