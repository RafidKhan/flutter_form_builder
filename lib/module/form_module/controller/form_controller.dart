import 'package:form_builder/constants.dart';
import 'package:form_builder/model/form_model.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final List<FormModel> listForms = <FormModel>[];

  Future<void> generateForm() async {
    listForms.add(
      FormModel(
        type: textfield,
        title: "Enter Your Name",
        isRequired: true,
      ),
    );

    listForms.add(
      FormModel(
        type: textfield,
        title: "Enter Designation",
        fieldValue: "Software Associate",
        validationMessage: "Designation is required",
        isRequired: true,
      ),
    );

    listForms.add(
      FormModel(
        type: radio,
        title: "Select Gender",
        options: ["male", "female"],
        isRequired: true,
      ),
    );

    listForms.add(
      FormModel(
        type: checkbox,
        title: "Your Skills",
        options: ["flutter", "web", "backend", "devops"],
      ),
    );

    listForms.add(
      FormModel(
        type: textfield,
        title: "Enter Your age",
      ),
    );

    listForms.add(
      FormModel(
        type: radio,
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
        type: checkbox,
        title: "Source of income",
        options: [
          "business",
          "job",
          "other",
        ],
        isRequired: true,
      ),
    );

    listForms.add(
      FormModel(
        type: checkbox,
        title: "Passion",
        options: [
          "music",
          "food",
          "other",
        ],
        fieldValue: [
          "music",
        ],
        isRequired: true,
      ),
    );

    listForms.add(
      FormModel(
        type: radio,
        title: "Select Region",
        options: [
          "Dhaka",
          "Sylhet",
          "Other",
        ],
        fieldValue: "Sylhet",
      ),
    );

    update();
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
