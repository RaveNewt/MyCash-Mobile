import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_cash_mobile/models/transaction_model.dart';
import 'package:my_cash_mobile/models/user_model.dart';
import 'package:my_cash_mobile/providers/auth_provider.dart';
import 'package:my_cash_mobile/providers/data_provider.dart';
import 'package:my_cash_mobile/providers/transaction_provider.dart';
import 'package:my_cash_mobile/theme.dart';
import 'package:my_cash_mobile/widget/chart.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  // List<StatisticModel> statistic = [];
  // bool loading = true;
  // NetworkHelper _networkHelper = NetworkHelper();
  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  // void getData() async {
  //   var response = await _networkHelper.get("http://10.0.2.2:3000/income/1");
  //   List<StatisticModel> tempdata = statisticModelFromJson(response.body);
  //   setState(() {
  //     statistic = tempdata;
  //     loading = false;
  //   });
  //   print(tempdata);
  // }

  bool isIncome = true;
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    DataProvider dataProvider = Provider.of<DataProvider>(context);
    UserModel user = authProvider.user;
    List<TransactionModel> datas = dataProvider.datas;
    TransactionProvider? transactionProvider =
        Provider.of<TransactionProvider>(context);
    changeIncome() async {
      await Provider.of<DataProvider>(context, listen: false)
          .getIncome(userid: user.id);
      setState(() {
        isIncome = true;
        print(isIncome);
      });
    }

    changeExpenses() async {
      await Provider.of<DataProvider>(context, listen: false)
          .getExpense(userid: user.id);
      setState(() {
        isIncome = false;
        print(isIncome);
      });
    }

    Widget Category() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Row(
          children: [
            SizedBox(
              width: defaultMargin,
            ),
            Container(
              width: 100,
              height: 40,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryColor,
              ),
              child: TextButton(
                onPressed: changeIncome,
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Income',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium, color: bglight),
                ),
              ),
            ),
            Container(
              width: 100,
              height: 40,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryColor,
              ),
              child: TextButton(
                onPressed: changeExpenses,
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Expenses',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium, color: bglight),
                ),
              ),
            ),
          ],
        ),
      );
    }

    AspectRatio weekly() {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: DChartBar(
          data: [
            {
              'id': 'Bar',
              'data': [
                {"domain": "1", "measure": 555555},
                {"domain": "2", "measure": 50000},
                {"domain": "3", "measure": 200000},
                {"domain": "4", "measure": 30000},
                {"domain": "5", "measure": 30000},
              ],

              // 'data': List.generate(7, (index) {
              //   return {
              //     'domain': cHome.weekText()[index],
              //     'measure': cHome.week[index]
              //   };
            },
          ],
          domainLabelPaddingToAxisLine: 8,
          axisLineTick: 2,
          axisLinePointWidth: 10,
          axisLineColor: primaryColor,
          measureLabelPaddingToAxisLine: 16,
          barColor: (barData, index, id) => primaryColor,
          showBarValue: true,
        ),
      );
    }

    return Scaffold(
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Category(),
                  SizedBox(
                    height: 24,
                  ),
                  Text('Statistic Page'),
                  SizedBox(
                    height: 12,
                  ),
                  // Center(
                  //   child: Container(
                  //     child: SfCartesianChart(
                  //       primaryXAxis: NumericAxis(),
                  //       primaryYAxis: NumericAxis(),
                  //       series: <ColumnSeries<TransactionModel, num>>[
                  //         ColumnSeries<TransactionModel, num>(
                  //             dataSource: datas,
                  //             xValueMapper: (TransactionModel datas, _) =>
                  //                 datas.userid,
                  //             yValueMapper: (TransactionModel datas, _) =>
                  //                 datas.amount,
                  //             dataLabelSettings:
                  //                 DataLabelSettings(isVisible: true)),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 12,
                  ),
                  weekly(),
                ],
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            changeIncome();
          },
          child: const Icon(Icons.refresh, color: Colors.white),
        ));
  }
}
