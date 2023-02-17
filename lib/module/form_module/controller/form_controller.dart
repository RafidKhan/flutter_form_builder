import 'dart:developer';

import 'package:form_builder/model/form_model.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  List<FormModel> listForms = <FormModel>[];
  bool loading = false;

  Future<void> generateForm() async {
    loading = true;
    update();
    await Future.delayed(const Duration(seconds: 2));
    listForms.add(
      FormModel(
        type: "textfield",
        title: "Enter Your Name",
        isRequired: true,
      ),
    );

    listForms.add(
      FormModel(
        type: "radio",
        title: "Select Gender",
        options: ["male", "female"],
      ),
    );

    listForms.add(
      FormModel(
        type: "checkbox",
        title: "Your Skills",
        options: ["flutter", "web", "backend", "devops"],
      ),
    );

    listForms.add(
      FormModel(
        type: "textfield",
        title: "Enter Your age",
      ),
    );

    listForms.add(
      FormModel(
        type: "radio",
        title: "Select Earning",
        options: [
          "0-9",
          "10-20",
          "21-30",
          "other",
        ],
        isRequired: true,
      ),
    );

    listForms.add(
      FormModel(
        type: "checkbox",
        title: "Source of income",
        options: [
          "business",
          "job",
          "other",
        ],
        isRequired: true,
      ),
    );

    loading = false;
    update();
  }

  getResult() {
    List<dynamic> formData = [];
    listForms.forEach((element) {
      formData.add(element.toJson());
    });
  }

  bool isActive() {
    bool result = false;
    for (int i = 0; i < listForms.length; i++) {
      final element = listForms[i];
      if (element.isRequired == true) {
        if (element.fieldValue == null) {
          result = false;
          break;
        } else {
          result = true;
        }
      } else {
        result = true;
      }
    }
    return result;
  }
}
