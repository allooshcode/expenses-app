import 'package:flutter/material.dart';
import './widgets/Transactionw.dart';
import './widgets/new_transactin.dart';
import './widgets/chart_bar.dart';
import './chart_logic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'expensed app',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.lightBlue,
        fontFamily: 'quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
                fontFamily: 'opensans',
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      home: MyChart(),
    );
  }
}

class MyChart extends StatefulWidget {
  @override
  _MyChartState createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  final List<Transactionw> translist = [];

  List<Transactionw> get recentTrans {
    return translist.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    });
  }

  //var chart = ChartLogic(recentTransactions:recenttrans);

  void addtrans() {
    double amount = double.parse(NewTransaction.amountcontroller.text);
    String title = NewTransaction.titlecontroller.text;
    if (amount < 0 || title.isEmpty) {
      return;
    }
    translist
        .add(Transactionw(amount.toStringAsFixed(2), title, DateTime.now()));

    Navigator.of(context).pop();

    setState(() {});
  }

  void startAddtransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(addtrans: addtrans),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // textTheme: Theme.of(context).textTheme,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => startAddtransaction(context))
        ],
        title: Text(
          'flutter app',
        ),
      ),
      body: translist.isEmpty
          ? Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'no such transacitons',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
                  child: Center(
                    child: Image.asset(
                      'images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                      //color: Colors.blue,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Card(
                            color: Colors.blue,
                            elevation: 5,
                            child: Row(children: <Widget>[]),
                          ),
                        ),
                      ]),

                  //height: 300,
                  Container(
                    height: 600,
                    child: ListView.builder(
                      itemCount: translist.length,
                      itemBuilder: (cnt, index) {
                        return translist[index];
                      },
                      //children: translist,
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddtransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
