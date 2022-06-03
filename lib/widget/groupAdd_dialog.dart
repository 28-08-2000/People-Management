import 'package:flutter/material.dart';

import '../model/group.dart';

// ------------THIS IS ALL ABOUT TAKING INPUT THROUGH
// THE ALERT DIALOG---------------------------------
class groupDialog extends StatefulWidget {
  final group? groups;
  final Function(String name) onClickedDone;

  const groupDialog ({
    Key? key,
    this.groups,
    required this.onClickedDone,
  }) : super(key: key);

  @override
  _GroupDialogState createState() => _GroupDialogState();
}

class _GroupDialogState extends State<groupDialog> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.groups != null) {
      final groups = widget.groups!;

      nameController.text = groups.name;
    }
  }

  @override
  void dispose() {
    nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.groups != null;
    final title = isEditing ? 'Edit group' : 'Add group';

    return AlertDialog(
      title: Text(title),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              buildName(),
            ],
          ),
        ),
      ),

      actions: <Widget>[
        buildCancelButton(context),
        buildAddButton(context, isEditing: isEditing),
      ],
    );
  }

  // BUILD NAME
  Widget buildName() => TextFormField(
    controller: nameController,

    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'Enter Group Name',
    ),

    validator: (name) =>
    name != null && name.isEmpty ? 'Enter a name' : null,
  );

  // CANCEL BUTTON
  Widget buildCancelButton(BuildContext context) => TextButton(
    child: const Text('Cancel'),
    onPressed: () => Navigator.of(context).pop(),
  );

  // ADD BUTTON
  Widget buildAddButton(BuildContext context, {required bool isEditing}) {
    final text = isEditing ? 'Save' : 'Add';

    return TextButton(
      child: Text(text),
      onPressed: () async {
        final isValid = formKey.currentState!.validate();

        if (isValid) {
          final name = nameController.text;

          widget.onClickedDone(name);

          Navigator.of(context).pop();
        }
      },
    );
  }

}