import 'package:flutter/material.dart';
import 'package:form_builder/model/form_model.dart';

class TextFieldComponent extends StatefulWidget {
  final FormModel formModel;
  final Function(dynamic) formValue;

  const TextFieldComponent({
    Key? key,
    required this.formModel,
    required this.formValue,
  }) : super(key: key);

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "${widget.formModel.title}",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: widget.formModel.isRequired == true ? " *" : "",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: widget.formModel.fieldValue,
              decoration: InputDecoration(
                hintText: widget.formModel.title,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
              ),
              onChanged: (value) {
                bool isValid = formKey.currentState!.validate();
                if (isValid) {
                  widget.formValue(value);
                } else {
                  widget.formValue(null);
                }
              },
              validator: (value) {
                if (widget.formModel.isRequired == true) {
                  if (value!.trim().isEmpty) {
                    return widget.formModel.validationMessage ??
                        "Input is required";
                  }
                  return null;
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
