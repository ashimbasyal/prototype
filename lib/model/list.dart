class ListPage {
  final int price;
  final String title;
  final String description;
  final String urlImage;

  const ListPage({
    required this.price,
    required this.description,
    required this.title,
    required this.urlImage,
  });

  factory ListPage.fromJson(Map<String, dynamic> json) => ListPage(
        price: json['price'],
        description: json['description'],
        title: json['title'],
        urlImage: json['urlImage'],
      );

  Map<String, dynamic> toJson() => {
        'price': price,
        'title': title,
        'description': description,
        'urlImage': urlImage,
      };
}
