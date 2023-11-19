import 'package:flutter/material.dart';

class RowDataWidget extends StatelessWidget {
  const RowDataWidget({
    super.key,
    required this.leadingString,
    required this.endString,
  });
  final String leadingString;
  final String endString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leadingString,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            endString,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.grey[500], fontWeight: FontWeight.w100),
          ),
        ],
      ),
    );
  }
}
