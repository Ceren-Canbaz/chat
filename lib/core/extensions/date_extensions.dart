extension DateFormat on DateTime {
  String get formatDate {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(days: 1));

    if (year == now.year && month == now.month && day == now.day) {
      return "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}";
    } else if (year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day) {
      return "yesterday ${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}";
    } else {
      return "${day.toString().padLeft(2, "0")}.${month.toString().padLeft(2, "0")}.$year";
    }
  }
}
