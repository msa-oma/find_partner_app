import 'package:flutter/material.dart';

class FormSubmitBtn extends StatelessWidget {
  final void Function() onPressed;
  final String buttonTxt;
  const FormSubmitBtn(
      {Key? key, required this.buttonTxt, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.edit),
      label: Text(buttonTxt),
    );
  }
}
