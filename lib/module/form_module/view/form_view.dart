import 'package:flutter/material.dart';
import 'package:form_builder/constants.dart';
import 'package:form_builder/module/form_module/components/checkbox_component.dart';
import 'package:form_builder/module/form_module/components/radio_component.dart';
import 'package:form_builder/module/form_module/components/text_field_component.dart';
import 'package:form_builder/module/form_module/controller/form_controller.dart';
import 'package:form_builder/module/form_submit_view/view/form_view.dart';
import 'package:get/get.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  var formController = Get.put(FormController());

  @override
  void initState() {
    // TODO: implement initState
    formController.generateForm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Enter Your Information"),
        ),
        body: controller.loading == true
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.listForms.length,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final element = controller.listForms[index];
                          final type = element.type;
                          if (type == textfield) {
                            return TextFieldComponent(
                              formModel: element,
                              formValue: (value) {
                                element.fieldValue = value;
                                controller.update();
                              },
                            );
                          }
                          if (type == radio) {
                            return RadioComponent(
                              formModel: element,
                              formValue: (value) {
                                element.fieldValue = value;
                                print("RADIO: ${element.fieldValue}");
                                controller.update();
                              },
                            );
                          }
                          if (type == checkbox) {
                            return CheckBoxComponent(
                              formModel: element,
                              formValue: (value) {
                                element.fieldValue = value;
                                controller.update();
                              },
                            );
                          }
                          return const SizedBox();
                        }),
                    InkWell(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (controller.isActive() == true) {
                          Get.to(() => const FormSubmitView());
                        } else {
                          Get.snackbar(
                            'Please Fill Up Required Fields',
                            '',
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        margin: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 20,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color:
                              controller.isActive() ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                      ),
                    )
                  ],
                ),
              ),
      );
    });
  }
}
