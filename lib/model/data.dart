class Data {
  final String name;
  final String url;
  final String img;
  // Add any other properties you need

  Data( {
    required this.name,
    required this.url,
    required this.img,
    // Add any other properties you need
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json['name'],
      url: json['url'],
      img: json['img']
      // Map other properties accordingly
    );
  }
}
