import 'package:flutter/material.dart';
import 'package:form_builder/model/form_model.dart';

class CheckBoxComponent extends StatefulWidget {
  FormModel formModel;
  Function(dynamic) formValue;

  CheckBoxComponent({
    Key? key,
    required this.formModel,
    required this.formValue,
  }) : super(key: key);

  @override
  State<CheckBoxComponent> createState() => _CheckBoxComponentState();
}

class _CheckBoxComponentState extends State<CheckBoxComponent> {
  List selectedOptions = [];

  selectOption(option) {
    if (selectedOptions.contains(option)) {
      selectedOptions.remove(option);
    } else {
      selectedOptions.add(option);
    }
    widget.formValue(selectedOptions);
    setState(() {});
  }

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
          ListView.builder(
              shrinkWrap: true,
              itemCount: widget.formModel.options?.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final option = widget.formModel.options?[index];
                return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        selectedOptions.contains(option)
                            ? selectedRadioOption(option: option)
                            : unSelectedRadioOption(option: option),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("${option}"),
                      ],
                    ));
              })
        ],
      ),
    );
  }

  Widget selectedRadioOption({required option}) {
    return InkWell(
      onTap: () {
        selectOption(option);
      },
      child: Container(
        height: 20,
        width: 20,
        decoration:
            const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        child: Center(
          child: Container(
            height: 15,
            width: 15,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: Center(
              child: Container(
                height: 12,
                width: 12,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget unSelectedRadioOption({required option}) {
    return InkWell(
      onTap: () {
        selectOption(option);
      },
      child: Container(
        height: 20,
        width: 20,
        decoration:
            const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        child: Center(
          child: Container(
            height: 15,
            width: 15,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}
