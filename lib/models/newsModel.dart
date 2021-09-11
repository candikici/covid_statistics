import 'dart:convert';

import 'package:covid_statistics/constants/constant_strings.dart';

class News {
  String key = "";
  String url = "";
  String description = "";
  String image = "";
  String name = "";
  String source = "";
  News({
    required this.key,
    required this.url,
    required this.description,
    required this.image,
    required this.name,
    required this.source,
  });

  News copyWith({
    String? key,
    String? url,
    String? description,
    String? image,
    String? name,
    String? source,
  }) {
    return News(
      key: key ?? this.key,
      url: url ?? this.url,
      description: description ?? this.description,
      image: image ?? this.image,
      name: name ?? this.name,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'url': url,
      'description': description,
      'image': image,
      'name': name,
      'source': source,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      key: map['key'] ?? unknown,
      url: map['url'] ?? unknown,
      description: map['description'] ?? unknown,
      image: map['image'] ?? unknown,
      name: map['name'] ?? unknown,
      source: map['source'] ?? unknown,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source));

  @override
  String toString() {
    return 'News(key: $key, url: $url, description: $description, image: $image, name: $name, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is News &&
        other.key == key &&
        other.url == url &&
        other.description == description &&
        other.image == image &&
        other.name == name &&
        other.source == source;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        url.hashCode ^
        description.hashCode ^
        image.hashCode ^
        name.hashCode ^
        source.hashCode;
  }
}
