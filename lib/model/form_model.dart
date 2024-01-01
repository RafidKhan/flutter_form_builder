class FormModel {
  final String? type;
  final String? title;
  final String? validationMessage;
  final List<dynamic>? options;
  dynamic fieldValue;
  final bool? isRequired;

  FormModel({
    this.type,
    this.title,
    this.validationMessage,
    this.options,
    this.fieldValue,
    this.isRequired,
  });

  FormModel.fromJson(Map<String, dynamic> json)
      : type = json['type'] ?? "",
        title = json['title'] ?? "",
        options = json['options'] ?? [],
        fieldValue = json['fieldValue'],
        validationMessage = json['validationMessage'],
        isRequired = json['isRequired'] ?? false;

  Map<String, dynamic> toJson() => {
        'type': type,
        'title': title,
        'validationMessage': validationMessage,
        'options': options,
        'value': fieldValue,
        'isRequired': isRequired,
      };
}
