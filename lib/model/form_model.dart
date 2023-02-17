class FormModel {
  final String? type;
  final String? title;
  final List<dynamic>? options;
  dynamic fieldValue;
  bool? isRequired;

  FormModel({
    this.type,
    this.title,
    this.options,
    this.fieldValue,
    this.isRequired,
  });

  FormModel.fromJson(Map<String, dynamic> json)
      : type = json['type'] ?? "",
        title = json['title'] ?? "",
        options = json['options'] ?? [],
        fieldValue = json['fieldValue'],
        isRequired = json['isRequired'] ?? false;

  Map<String, dynamic> toJson() => {
        'type': type,
        'title': title,
        'options': options,
        'value': fieldValue,
        'isRequired': isRequired,
      };
}
