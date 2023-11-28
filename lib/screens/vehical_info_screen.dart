import 'package:fastag/api.dart';
import 'package:fastag/screens/login_screen.dart';
import 'package:fastag/screens/payment_history_screen.dart';
import 'package:fastag/screens/payment_screen.dart';
import 'package:fastag/screens/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

import 'widget/row_data_widget.dart';

final ApiService api = ApiService();

class VehicalInfoScreen extends StatefulWidget {
  const VehicalInfoScreen({super.key});

  @override
  State<VehicalInfoScreen> createState() => _VehicalInfoScreenState();
}

class _VehicalInfoScreenState extends State<VehicalInfoScreen> {
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
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'Error occurred',
                        style: TextStyle(fontSize: 18),
                      ),
                    );

                    // if we got our data
                  } else if (snapshot.hasData) {
                    final data = snapshot.data;

                    return Column(
                      children: <Widget>[
                        RowDataWidget(
                          leadingString: 'FASTag id',
                          endString: "${data?['fastag_id']}",
                        ),
                        RowDataWidget(
                          leadingString: 'Owner name',
                          endString: "${data?['username']}",
                        ),
                        RowDataWidget(
                          leadingString: 'Vehical number',
                          endString: "${data?['v_no']}",
                        ),
                        const RowDataWidget(
                          leadingString: 'Tag Status',
                          endString: "Active",
                        ),
                        RowDataWidget(
                          leadingString: 'FASTag credit :',
                          endString: "\$ ${data?['credit']}",
                        ),
                      ],
                    );
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              future: api.getVehicalInfo($username),
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const PaymentHistoryScreen()));
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
    var data = 0;
    return showDialog(
      context: context,
      builder: (context) {
        final TextEditingController cont = TextEditingController();
        return AlertDialog(
          title:  CustomTextField(hintText: "Enter money",controller: cont,),
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
                onPressed: () async {
                  
                    data = int.parse(cont.text.trim());
           
                  

                  await api.updateCreditBalance($username, data);
                },
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
