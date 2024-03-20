

class NestedData {
  final String name;
  final String code;
  final String creationDate;
  final String type;
  final String img;
  final String? urlType;
  final String? url;

  NestedData({
    required this.name,
    required this.code,
    required this.creationDate,
    required this.type,
    required this.img,
    this.urlType,
    this.url,
  });

  factory NestedData.fromJson(Map<String, dynamic> json) {
    return NestedData(
      name: json['name'],
      code: json['code'],
      creationDate: json['creation_date'],
      type: json['type'],
      img: json['img'],
      urlType: json['urltype'],
      url: json['url'],
    );
  }
}

class SubCategory {
  final String name;
  final String code;
  final String creationDate;
  final String type;
  final String img;
  final List<NestedData>? value;

  SubCategory({
    required this.name,
    required this.code,
    required this.creationDate,
    required this.type,
    required this.img,
    this.value,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      name: json['name'],
      code: json['code'],
      creationDate: json['creation_date'],
      type: json['type'],
      img: json['img'],
      value: json['value'] != null
          ? List<NestedData>.from(
              json['value'].map((x) => NestedData.fromJson(x)))
          : null,
    );
  }
}

class Category {
  final String name;
  final String code;
  final String creationDate;
  final String type;
  final String img;
  final String? urlType;
  final String? url;
  final List<SubCategory>? value;

  Category({
    required this.name,
    required this.code,
    required this.creationDate,
    required this.type,
    required this.img,
    this.urlType,
    this.url,
    this.value,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      code: json['code'],
      creationDate: json['creation_date'],
      type: json['type'],
      img: json['img'],
      urlType: json['urltype'],
      url: json['url'],
      value: json['value'] != null
          ? List<SubCategory>.from(
              json['value'].map((x) => SubCategory.fromJson(x)))
          : null,
    );
  }
}
