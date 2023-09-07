class Location {
  final String name;
  final String url;

  Location(this.name, this.url);

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      map['name'] as String,
      map['url'] as String,
    );
  }
}
