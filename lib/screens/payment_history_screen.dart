import 'package:fastag/screens/login_screen.dart';
import 'package:fastag/screens/vehical_info_screen.dart';
import 'package:flutter/material.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: FutureBuilder(
        future: api.getPaymentHistory($username),
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
              print(snapshot.data);
              final data = snapshot.data;
              return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: Text(
                      "- \$${data?[index]['t_cost']}",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.red),
                    ),
                    title: Text("Toolbooth ID : ${data?[index]['t_id']}"),
                    subtitle: Text("Fstag ID : ${data?[index]['t_fastag']}"),
                  );
                },
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
