import 'package:flutter/material.dart';

import 'widget/text_field_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            "FasTag",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Pay now :",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const CustomTextField(
            hintText: "Vehical number",
          ),
          const CustomTextField(
            hintText: "FASTag Id",
          ),
          ElevatedButton(
            onPressed: () {
              isVisible = true;
              setState(() {});
            },
            child: Text(
              "Get information",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Visibility.maintain(
            visible: isVisible,
            child: Text(
              "\$ 50",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          isVisible
              ? ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Pay Now",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
