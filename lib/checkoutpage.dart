import 'package:flutter/material.dart';
import 'package:project1_hungry/orders.dart';

class Coutpg extends StatefulWidget {
  final List<String> optionnames;
  final List<int> optionprice;
  final List<int> quantity;

  const Coutpg(
      {Key? key,
      required this.optionnames,
      required this.optionprice,
      required this.quantity})
      : super(key: key);

  @override
  State<Coutpg> createState() => _CoutpgState();
}

class _CoutpgState extends State<Coutpg> {
  void totalprice(List<int> price, List<int> qty) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout '),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.optionnames.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(widget.optionnames[index] +
                      " \$" +
                      widget.optionprice[index].toString() +
                      " " +
                      widget.quantity[index].toString() +
                      " pcs"),
                );
              },
            ),
          ),
          Text("Total amount to pay: \$" +
              totalprices(widget.optionprice, widget.quantity).toString()),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => odialog()),
                );
              },
              child: Text("Confirm Order"))
        ],
      ),
    );
  }
}

int totalprices(List<int> price, List<int> qty) {
  int combined;
  int total = 0;
  for (var i = 0; i < qty.length; i++) {
    combined = price[i] * qty[i];
    total = total + combined;
  }
  return total;
}
