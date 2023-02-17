import 'package:flutter/material.dart';
import 'package:form_builder/model/form_model.dart';

class RadioComponent extends StatefulWidget {
  FormModel formModel;
  Function(dynamic) formValue;

  RadioComponent({
    Key? key,
    required this.formModel,
    required this.formValue,
  }) : super(key: key);

  @override
  State<RadioComponent> createState() => _RadioComponentState();
}

class _RadioComponentState extends State<RadioComponent> {
  int? selectedOption;

  selectOption(int index) {
    selectedOption = index;
    widget.formValue(widget.formModel.options?[index]);
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
          const SizedBox(
            height: 10,
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
                        selectedOption != null
                            ? index == selectedOption
                                ? selectedRadioOption(index: index)
                                : unSelectedRadioOption(index: index)
                            : unSelectedRadioOption(index: index),
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

  Widget selectedRadioOption({required int index}) {
    return InkWell(
      onTap: () {
        selectOption(index);
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

  Widget unSelectedRadioOption({required int index}) {
    return InkWell(
      onTap: () {
        selectOption(index);
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
