import 'package:fastag/api.dart';
import 'package:fastag/screens/payment_screen.dart';
import 'package:fastag/screens/vehical_info_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'widget/text_field_widget.dart';

class VehicalRegistarion extends StatelessWidget {
  VehicalRegistarion({super.key});

  final ApiService api = ApiService();

  final TextEditingController userName = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController vehicalNO = TextEditingController();
  final TextEditingController host = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
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
              CustomTextField(
                hintText: "Vehical number",
                controller: vehicalNO,
              ),
              CustomTextField(
                hintText: "Email",
                controller: emailCon,
              ),
              CustomTextField(
                hintText: "Username",
                controller: userName,
              ),
              CustomTextField(
                hintText: "Password",
                controller: passwordCon,
              ),
              CustomTextField(
                hintText: "Host",
                controller: host,
              ),
              CustomTextButton(
                  onPressed: () {
                    if (!host.text.contains('http')) return;
                    baseUrl = host.text;
                  },
                  buttonName: "Host"),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  await api.registerVehical(
                    vehicalNO.text,
                    emailCon.text,
                    userName.text,
                    passwordCon.text,
                  );
                },
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const LoginScreen()));
                },
                buttonName: "Check Vehical Info,Click Here",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const PaymentScreen()));
                },
                buttonName: "Pay Toll Fee ",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
