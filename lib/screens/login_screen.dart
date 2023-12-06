import 'package:fastag/api.dart';
import 'package:fastag/screens/vehical_info_screen.dart';
import 'package:flutter/material.dart';

import 'widget/text_field_widget.dart';

String $username = "";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ApiService api = ApiService();
  final TextEditingController userNameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
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
            "Login user",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          CustomTextField(
            hintText: "Username",
            controller: userNameC,
          ),
          CustomTextField(
            hintText: "Password",
            controller: passwordC,
          ),
          ElevatedButton(
            onPressed: () async {
              final response =
                  await api.loginUser(userNameC.text, passwordC.text);
              $username = response['username'];
              if (context.mounted) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const VehicalInfoScreen()));
              }
            },
            child: Text(
              "Get information",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
