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
            "Pay now :",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          CustomTextField(
            hintText: "Vehical number",
            controller: vNo,
          ),
          CustomTextField(
            hintText: "Toolbooth Id",
            controller: tId,
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
          FutureBuilder(
              future: api.getAmoutToPay(vNo.text, tId.text),
              builder: (context, snapshot) {
                final data = snapshot.data ;
                $username = data?['username'];
                print(snapshot.data);
                return Visibility.maintain(
                  visible: isVisible,
                  child: Text(
                    "\$ ${data?['price']}",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                );
              }),
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
