import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addtrans;
  NewTransaction({@required this.addtrans});
  static final titlecontroller = TextEditingController();
  static final amountcontroller = TextEditingController();

  @override
  NewTransactionState createState() {
    return new NewTransactionState();
  }
}

class NewTransactionState extends State<NewTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'title'),
              controller: NewTransaction.titlecontroller,
            ),
            TextField(
              autocorrect: true,
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'amount'),
              controller: NewTransaction.amountcontroller,
              onSubmitted: (_) => widget.addtrans(),
            ),
            FlatButton(
                onPressed: widget.addtrans,
//
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Colors.blue[800],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
