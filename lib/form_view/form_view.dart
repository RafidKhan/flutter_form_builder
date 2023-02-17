import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form_builder/components/radio_component.dart';
import 'package:form_builder/components/text_field_component.dart';
import 'package:form_builder/constants.dart';
import 'package:form_builder/model/form_model.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  List<FormModel> listForms = <FormModel>[];

  @override
  void initState() {
    // TODO: implement initState
    generateForm();
    super.initState();
  }

  generateForm() {
    listForms.add(FormModel(
      type: "textfield",
      title: "Enter Your Name",
    ));

    listForms.add(FormModel(
        type: "radio", title: "Select Gender", options: ["male", "female"]));

    listForms.add(FormModel(
        type: "checkbox",
        title: "Your Skills",
        options: ["flutter", "web", "backend", "devops"]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Your Information"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.done),
        onPressed: () {
          listForms.forEach((element) {
            log("FORM: ${element.toJson()}");
          });
        },
      ),
      body: ListView.builder(
          itemCount: listForms.length,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final element = listForms[index];
            final type = element.type;
            if (type == textfield) {
              return TextFieldComponent(
                formModel: element,
                formValue: (value) {
                  element.value = value;
                },
              );
            }
            if (type == radio) {
              return RadioComponent(
                formModel: element,
                formValue: (value) {
                  element.value = value;
                },
              );
            }
            if (type == checkbox) {}
            return const SizedBox();
          }),
    );
  }
}
