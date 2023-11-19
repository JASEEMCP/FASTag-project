import 'package:fastag/screens/payment_history_screen.dart';
import 'package:fastag/screens/payment_screen.dart';
import 'package:fastag/screens/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

import 'widget/row_data_widget.dart';

class VehicalInfoScreen extends StatelessWidget {
  const VehicalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Vehical Info"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const RowDataWidget(
              leadingString: 'FASTag id',
              endString: "F12378",
            ),
            const RowDataWidget(
              leadingString: 'Owner name',
              endString: "Arun BR",
            ),
            const RowDataWidget(
              leadingString: 'Vehical number',
              endString: "KL13AB6758",
            ),
            const RowDataWidget(
              leadingString: 'Phone number',
              endString: "89654356",
            ),
            const RowDataWidget(
              leadingString: 'Vehical name',
              endString: "Swift",
            ),
            const RowDataWidget(
              leadingString: 'Vehical class',
              endString: "One",
            ),
            const RowDataWidget(
              leadingString: 'Tag Status',
              endString: "Active",
            ),
            const RowDataWidget(
              leadingString: 'FASTag balance :',
              endString: "\$ 500",
            ),
            CustomTextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const PaymentScreen()));
              },
              buttonName: "Pending payment,Click here",
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton.extended(
              heroTag: 'btn1',
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const PaymentHistoryScreen()));
              },
              label: const Row(
                children: [Icon(Icons.history), Text("Payment History")],
              ),
            ),
            FloatingActionButton.extended(
              heroTag: 'btn2',
              onPressed: () {
                showDialogBox(context);
              },
              label: const Row(
                children: [Icon(Icons.add), Text("Add FASTag money")],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const CustomTextField(hintText: "Enter money"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                buttonName: "Cancel",
              ),
              CustomTextButton(
                onPressed: () {},
                buttonName: "Add money",
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.buttonName,
  });
  final Function onPressed;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        buttonName,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
