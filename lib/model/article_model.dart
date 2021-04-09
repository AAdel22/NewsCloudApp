class Article {
  final String title;
  final String description;
  final String imageURL;
  final String articleURL;
  Article({this.title, this.description, this.imageURL, this.articleURL});
  factory Article.fromJson(Map<String,dynamic> jsonData){
    return Article(
      title: jsonData['title'],
      description: jsonData['description'],
      imageURL: jsonData['urlToImage'],
      articleURL: jsonData['url']
    );
  }
}