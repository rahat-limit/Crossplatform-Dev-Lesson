import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final TextEditingController groupController;
  final TextEditingController nameController;
  final VoidCallback callback;
  final String btnText;
  const CustomDialog(
      {super.key,
      required this.groupController,
      required this.nameController,
      this.btnText = 'Save',
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: groupController,
            decoration: const InputDecoration(labelText: 'Group'),
          ),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            clearControllers();
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
            onPressed: () {
              callback();
              clearControllers();
              Navigator.of(context).pop();
            },
            child: Text(btnText)),
      ],
    );
  }

  void clearControllers() {
    groupController.clear();
    nameController.clear();
  }
}
