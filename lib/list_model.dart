class ListModel {
  final int id;
  final String name;
  final String group;

  ListModel({required this.id, required this.name, required this.group});

  ListModel copyWith({int? id, String? name, String? group}) {
    return ListModel(
        id: id ?? this.id, name: name ?? this.name, group: group ?? this.group);
  }
}
