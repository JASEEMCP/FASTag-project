import 'package:fastag/screens/payment_screen.dart';
import 'package:fastag/screens/vehical_info_screen.dart';
import 'package:flutter/material.dart';

import 'widget/text_field_widget.dart';

class VehicalRegistarion extends StatelessWidget {
  const VehicalRegistarion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
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
              "Register vehical :",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const CustomTextField(
              hintText: "Vehical number",
            ),
            const CustomTextField(
              hintText: "Phone number",
            ),
            const CustomTextField(
              hintText: "Password",
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Submit",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const VehicalInfoScreen()));
              },
              buttonName: "Check Vehical Info,Click Here",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const PaymentScreen()));
              },
              buttonName: "Pay Toll Fee ",
            ),
          ],
        ),
      ),
    );
  }
}
