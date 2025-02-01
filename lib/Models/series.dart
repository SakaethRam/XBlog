class Series {
  final String id;
  final String name;
  final String tag;
  final String imagePath;

  Series({required this.id, required this.name, required this.tag, required this.imagePath});

  // Convert Series object to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tag': tag,
      'imagePath': imagePath,
    };
  }

  // Convert Firestore document to Series object
  factory Series.fromMap(Map<String, dynamic> map) {
    return Series(
      id: map['id'] ?? '',  // Handle missing ID
      name: map['name'] ?? '',
      tag: map['tag'] ?? '',
      imagePath: map['imagePath'] ?? '',
    );
  }
}
