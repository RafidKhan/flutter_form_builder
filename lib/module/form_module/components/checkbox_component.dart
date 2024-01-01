import 'package:flutter/material.dart';
import 'package:form_builder/constants.dart';
import 'package:form_builder/model/form_model.dart';

class CheckBoxComponent extends StatefulWidget {
  final FormModel formModel;
  final Function(dynamic) formValue;

  const CheckBoxComponent({
    Key? key,
    required this.formModel,
    required this.formValue,
  }) : super(key: key);

  @override
  State<CheckBoxComponent> createState() => _CheckBoxComponentState();
}

class _CheckBoxComponentState extends State<CheckBoxComponent> {
  final List selectedOptions = [];

  selectOption(option) {
    if (selectedOptions.contains(option)) {
      selectedOptions.remove(option);
    } else {
      selectedOptions.add(option);
    }
    if (selectedOptions.isEmpty) {
      widget.formValue(null);
    } else {
      widget.formValue(selectedOptions);
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prefillFields();
  }

  void prefillFields() {
    if (widget.formModel.type == checkbox) {
      if (widget.formModel.fieldValue is List) {
        selectedOptions.addAll(widget.formModel.fieldValue as List);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
          ListView.builder(
              shrinkWrap: true,
              itemCount: widget.formModel.options?.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final option = widget.formModel.options?[index];
                return InkWell(
                  onTap: () {
                    selectOption(option);
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          selectedOptions.contains(option)
                              ? selectedRadioOption(option: option)
                              : unSelectedRadioOption(option: option),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("$option"),
                        ],
                      )),
                );
              })
        ],
      ),
    );
  }

  Widget selectedRadioOption({required option}) {
    return Container(
      height: 20,
      width: 20,
      decoration: const BoxDecoration(color: Colors.blue),
      child: Center(
        child: Container(
          height: 17,
          width: 17,
          decoration: const BoxDecoration(color: Colors.white),
          child: const Center(
            child: Icon(
              Icons.done,
              size: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget unSelectedRadioOption({required option}) {
    return Container(
      height: 20,
      width: 20,
      decoration: const BoxDecoration(color: Colors.blue),
      child: Center(
        child: Container(
          height: 17,
          width: 17,
          decoration: const BoxDecoration(color: Colors.white),
        ),
      ),
    );
  }
}
