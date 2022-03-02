

class Article {
  String? title;
  String? description;
  String? imageUrl;
  String? url;

  Article({this.title, this.description, this.imageUrl,this.url});

  factory Article.fromJson(Map<String, dynamic> jsonData) {
    return Article(
        title: jsonData['title'],
        description: jsonData['description'],
        imageUrl: jsonData['urlToImage'],
        url: jsonData['url']);
  }
}
// class Article {
//   @HiveType(typeId: 1)
//   class ItemModel extends HiveObject{
//   @HiveField(0)
//   int id;
//   @HiveField(1)
//   String title;
//   @HiveField(2)
//   dynamic price;
//   @HiveField(3)
//   String description;
//   @HiveField(4)
//   String category;
//   @HiveField(5)
//   String image;
//   @HiveField(6)
//   Rating rating;
//
//   ItemModel(
//   {this.id,
//   this.title,
//   this.price,
//   this.description,
//   this.category,
//   this.image,
//   this.rating});
//
//   ItemModel.fromJson(Map<String, dynamic> json) {
//   id = json['id'];
//   title = json['title'];
//   price = json['price'];
//   description = json['description'];
//   category = json['category'];
//   image = json['image'];
//   rating = json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['title'] = this.title;
//   data['price'] = this.price;
//   data['description'] = this.description;
//   data['category'] = this.category;
//   data['image'] = this.image;
//   if (this.rating != null) {
//   data['rating'] = this.rating.toJson();
//   }
//   return data;
//   }
//   }
// }
