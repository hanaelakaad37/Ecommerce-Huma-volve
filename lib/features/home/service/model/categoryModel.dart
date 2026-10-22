class CategoryModel {
  int? id;
  String? name;

  CategoryModel({this.id, this.name});

  CategoryModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
}
