class FormModel {
  final String? type;
  final String? title;
  final dynamic value;
  final List<dynamic>? options;

  FormModel({
    this.type,
    this.title,
    this.value,
    this.options,
  });

  FormModel.fromJson(Map<String, dynamic> json)
      : type = json['type'] ?? "",
        title = json['title'] ?? "",
        value = json['value'] ?? "",
        options = json['options'] ?? [];

  Map<String, dynamic> toJson() => {
        'type': type,
        'title': title,
        'value': value,
        'options': options,
      };
}
