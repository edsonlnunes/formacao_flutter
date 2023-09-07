class ApiInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  ApiInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory ApiInfo.fromMap(Map<String, dynamic> map) {
    return ApiInfo(
      count: map['count'] as int,
      pages: map['pages'] as int,
      next: map['next'] != null ? map['next'] as String : null,
      prev: map['prev'] != null ? map['prev'] as String : null,
    );
  }
}
