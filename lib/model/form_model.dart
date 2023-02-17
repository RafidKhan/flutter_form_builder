class FormModel {
  final String? type;
  final String? title;
  final List<dynamic>? options;
  dynamic value;

  FormModel({
    this.type,
    this.title,
    this.options,
    this.value,
  });

  FormModel.fromJson(Map<String, dynamic> json)
      : type = json['type'] ?? "",
        title = json['title'] ?? "",
        options = json['options'] ?? [],
        value = json['value'] ?? "";

  Map<String, dynamic> toJson() => {
        'type': type,
        'title': title,
        'options': options,
        'value': value,
      };
}
