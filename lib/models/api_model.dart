class ApiModel {
  String? id;
  String? title;
  String? original_title;
  String? original_title_romanised;
  String? image;
  String? description;
  String? director;
  String? producer;
  String? release_date;

  ApiModel(
      {this.id,
      this.title,
      this.original_title,
      this.original_title_romanised,
      this.image,
      this.description,
      this.director,
      this.producer,
      this.release_date});

  factory ApiModel.fromJsonMap(Map<String, dynamic> json) {
    return ApiModel(
        id: json['id'],
        title: json['title'],
        original_title: json['original_title'],
        original_title_romanised: json['original_title_romanised'],
        image: json['image'],
        description: json['description'],
        director: json['director'],
        producer: json['producer'],
        release_date: json['release_date']);
  }
}
