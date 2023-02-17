import 'package:flutter/material.dart';
import 'package:form_builder/model/form_model.dart';

class TextFieldComponent extends StatefulWidget {
  FormModel formModel;
  Function(String) formValue;

  TextFieldComponent({
    Key? key,
    required this.formModel,
    required this.formValue,
  }) : super(key: key);

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.formModel.title}",
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            initialValue: widget.formModel.value,
            decoration: InputDecoration(
              hintText: "${widget.formModel.title}",
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.black),
              ),
            ),
            onChanged: (value) {
              widget.formValue(value);
            },
          )
        ],
      ),
    );
  }
}
