import 'package:flutter/material.dart';
import 'package:form_builder/module/form_module/controller/form_controller.dart';
import 'package:form_builder/module/form_submit_view/component/form_data_tile.dart';
import 'package:get/get.dart';

class FormSubmitView extends StatefulWidget {
  const FormSubmitView({Key? key}) : super(key: key);

  @override
  State<FormSubmitView> createState() => _FormSubmitViewState();
}

class _FormSubmitViewState extends State<FormSubmitView> {
  final formController = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Form Information"),
        ),
        body: ListView.separated(
            itemCount: controller.listForms.length,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final element = controller.listForms[index];
              return FormDataTile(
                formModel: element,
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(thickness: 2,);
            }),
      );
    });
  }
}
