import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double pcnt;
  final String day;
  final double amnt;
  ChartBar({this.pcnt, this.day, this.amnt});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 10,
        child: Column(
          children: [
            Text(
              amnt.toString(),
              style: TextStyle(fontSize: 18),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                    heightFactor: pcnt,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ))
              ],
            ),
            Text(
              day,
              style: TextStyle(fontFamily: 'OPenSans'),
            )
          ],
        ));
  }
}
