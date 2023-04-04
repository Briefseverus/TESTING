abstract class Post {
  String? id;
  String? name;
  String? description;
  int? createdAt;

  Post(
      {this.id, required this.name, required this.description, this.createdAt});
}
