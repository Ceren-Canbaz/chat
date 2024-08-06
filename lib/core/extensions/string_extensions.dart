extension StringListExtensions on List<String> {
  String sortAndJoin({String separator = '_'}) {
    sort();
    // Listeyi birleştirin
    return join(separator);
  }
}
