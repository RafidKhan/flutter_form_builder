import 'package:flutter/material.dart';
import 'package:form_builder/model/form_model.dart';

class RadioComponent extends StatefulWidget {
  final FormModel formModel;
  final Function(dynamic) formValue;

  const RadioComponent({
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
    if (selectedOption == index) {
      selectedOption = null;
    } else {
      selectedOption = index;
    }
    if (selectedOption != null) {
      widget.formValue(widget.formModel.options?[index]);
    } else {
      widget.formValue(null);
    }
    setState(() {});
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
                    selectOption(index);
                  },
                  child: Container(
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
                          Text("$option"),
                        ],
                      )),
                );
              })
        ],
      ),
    );
  }

  Widget selectedRadioOption({required int index}) {
    return Container(
      height: 20,
      width: 20,
      decoration:
          const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
      child: Center(
        child: Container(
          height: 15,
          width: 15,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
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
    );
  }

  Widget unSelectedRadioOption({required int index}) {
    return Container(
      height: 20,
      width: 20,
      decoration:
          const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
      child: Center(
        child: Container(
          height: 15,
          width: 15,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
