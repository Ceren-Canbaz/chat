extension DateFormatWithoutTime on DateTime {
  String get formatDateWithoutTime {
    return "${day.toString().padLeft(2, "0")}.${month.toString().padLeft(2, "0")}.$year";
  }
}
