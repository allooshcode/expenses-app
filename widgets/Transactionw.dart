import 'package:flutter/material.dart';

class Transactionw extends StatelessWidget {
  final String amount;
  final String title;
  final DateTime date;
  Transactionw(this.amount, this.title, this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '\$$amount',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Theme.of(context).primaryColorDark,
                width: 2,
              )),
            ),
            Column(
              children: <Widget>[
                Text(
                  '$title',
                  style: Theme.of(context).textTheme.title,

                  //                style: TextStyle(
                  // color: Colors.lightGreenAccent,
                  //  fontWeight: FontWeight.bold,
                  //fontSize: 16,
                ),
                //),
                Text(
                  '$date',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
