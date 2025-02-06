

import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        'إلغاء',
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Colors.orange),
      ),
    );
  }
}