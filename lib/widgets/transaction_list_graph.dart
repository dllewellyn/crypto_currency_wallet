import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:crypto_repository/crypto_repository.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final Function(DateTime) onItemClicked;

  SimpleTimeSeriesChart(this.seriesList, this.onItemClicked);

  factory SimpleTimeSeriesChart.withTransactionData(
      List<Transaction> transactions, Function(DateTime) onItemClicked) {
    var runningTotal = 0;

    List<TimeSeriesSimple> mapped = transactions.map((item) {
      runningTotal += double.parse(item.amount).toInt();
      return TimeSeriesSimple(
          time: DateTime.parse(item.date), sales: runningTotal);
    }).toList();

    List<charts.Series<TimeSeriesSimple, DateTime>> list = [
      charts.Series<TimeSeriesSimple, DateTime>(
          id: 'Balance',
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (TimeSeriesSimple sales, _) => sales.time,
          measureFn: (TimeSeriesSimple sales, _) => sales.sales,
          data: mapped
      )
    ];

    return SimpleTimeSeriesChart(list, onItemClicked);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.3,
          child: charts.TimeSeriesChart(
            seriesList,
//            primaryMeasureAxis: charts.NumericAxisSpec(
//                tickProviderSpec: new charts.BasicNumericTickProviderSpec(
//                  // Make sure we don't have values less than 1 as ticks
//                  // (ie: counts).
//                    dataIsInWholeNumbers: true,
//                    // Fixed tick count to highlight the integer only behavior
//                    // generating ticks [0, 1, 2, 3, 4].
//                    desiredTickCount: 5)),

            animationDuration: Duration(seconds: 2),
            dateTimeFactory: const charts.LocalDateTimeFactory(),
            animate: true,
            selectionModels: [
              charts.SelectionModelConfig(
                  type: charts.SelectionModelType.info,
                  changedListener: _onSelectionChanged)
            ],
          ),
        ),
      ],
    );
  }

  _onSelectionChanged(charts.SelectionModel<DateTime> model) {
    onItemClicked(model.selectedDatum.first.datum.time);
  }
}

class TimeSeriesSimple {
  final DateTime time;
  final int sales;

  TimeSeriesSimple({this.time, this.sales});
}
