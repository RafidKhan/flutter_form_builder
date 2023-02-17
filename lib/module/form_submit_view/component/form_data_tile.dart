import 'package:flutter/material.dart';
import 'package:form_builder/constants.dart';
import 'package:form_builder/model/form_model.dart';

class FormDataTile extends StatefulWidget {
  FormModel formModel;

  FormDataTile({
    Key? key,
    required this.formModel,
  }) : super(key: key);

  @override
  State<FormDataTile> createState() => _FormDataTileState();
}

class _FormDataTileState extends State<FormDataTile> {
  List values = [];

  @override
  void initState() {
    // TODO: implement initState
    if (widget.formModel.type == checkbox) {
      if (widget.formModel.fieldValue != null) {
        values = widget.formModel.fieldValue;
      }
    }
    print("HERE: ${values}");
    super.initState();
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
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          widget.formModel.type == checkbox
              ? Wrap(
                  children: [
                    for (int i = 0; i < values.length; i++)
                      i == values.length - 1
                          ? Text(
                              values[i],
                            )
                          : Text(
                              values[i] + ", ",
                            )
                  ],
                )
              : Text(
                  widget.formModel.fieldValue ?? "",
                ),
        ],
      ),
    );
  }
}
