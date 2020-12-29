import 'package:flutter/material.dart';
import './widgets/Transactionw.dart';
import './widgets/chart_bar.dart';

class ChartLogic extends StatelessWidget {
  final double pcntc = 0;
  final List<Transactionw> recentTransactions;
  ChartLogic({this.recentTransactions});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      double sumAmount = 0.0;
      final workingDay = DateTime.now().subtract(Duration(days: index));
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == workingDay.day &&
            recentTransactions[i].date.month == workingDay.month &&
            recentTransactions[i].date.year == workingDay.year) {
          sumAmount += double.parse(recentTransactions[i].amount);
        }
      }

      return {'day': workingDay, 'amount': sumAmount};
    });
  }

  double get sumOfAmounts {
    double sumamounts = 0.0;
    for (var i = 0; i < recentTransactions.length; i++) {
      sumamounts += groupedTransactions[i]['amount'];
    }
    return sumamounts;
  }

  List<double> get percentOfAmount {
    return List.generate(7, (index) {
      return double.parse(groupedTransactions[index]['amount']) / sumOfAmounts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
