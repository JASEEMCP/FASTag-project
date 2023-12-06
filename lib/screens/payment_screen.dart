import 'package:fastag/screens/login_screen.dart';
import 'package:fastag/screens/vehical_info_screen.dart';
import 'package:flutter/material.dart';

import 'widget/text_field_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isVisible = false;
  Map<String, dynamic> result = {};
  TextEditingController vNo = TextEditingController();
  TextEditingController tId = TextEditingController();
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
            "Pay amount :",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          CustomTextField(
            hintText: "Vehical number",
            controller: vNo,
          ),
          CustomTextField(
            hintText: "Tollbooth Id",
            controller: tId,
          ),
          ElevatedButton(
            onPressed: () async {
              isVisible = true;
              result = await api.getAmoutToPay(vNo.text, tId.text);
              $username = result['username'];
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
              "\$ ${result['price']} ",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          isVisible
              ? ElevatedButton(
                  onPressed: () async {
                    await api.payAmout($username, tId.text);
                  },
                  child: Text(
                    "Fill the field",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
