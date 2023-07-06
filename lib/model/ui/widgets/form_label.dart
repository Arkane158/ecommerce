import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final String formLabel;
  const FormLabel({super.key, required this.formLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Text(
        formLabel,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
