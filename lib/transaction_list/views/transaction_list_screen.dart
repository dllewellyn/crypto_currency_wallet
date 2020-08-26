import 'package:crypto_currency_wallet/extensions/displayable_price.dart';

import 'package:crypto_currency_wallet/widgets/transaction_list_graph.dart';
import 'package:crypto_currency_wallet/widgets/widgets.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:crypto_repository/crypto_repository.dart';
import '../../styles.dart';

class TransactionListScreen extends StatefulWidget {
  final AccountData accountData;

  const TransactionListScreen({Key key, @required this.accountData})
      : super(key: key);

  @override
  _TransactionListScreenState createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList;

    var heroWidget = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Hero(
        tag: widget.accountData.currencyValue,
        child: SvgPicture.network(
          urlImageForCurrency(widget.accountData.currencyValue),
          placeholderBuilder: (context) => CircularProgressIndicator(),
          height: 60,
          width: 60,
        ),
      ),
    );

    if (widget.accountData.transactions.isEmpty) {
      widgetList = [
        heroWidget,
        Center(
            child: Text(
          "You don't have any transactions for this account",
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ))
      ];
    } else {
      widgetList = [
        heroWidget,
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SimpleTimeSeriesChart.withTransactionData(
              widget.accountData.transactions, dateChanged),
        )
      ]..addAll(widget.accountData.transactions
          .map((transaction) => TransactionListItem(
                transaction: transaction,
              ))
          .toList());
    }

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: ClearAppBar(),
        body: Container(
            child:
                ListView(controller: _scrollController, children: widgetList)));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void dateChanged(DateTime dateChanged) {
    var index = widget.accountData.transactions
            .indexWhere((t) => t.dateTime == dateChanged)
            .toDouble() +
        2;

    _scrollController.jumpTo(index);
  }
}

class TransactionListItem extends StatefulWidget {
  final Transaction transaction;

  const TransactionListItem({Key key, @required this.transaction})
      : super(key: key);

  @override
  _TransactionListItemState createState() => _TransactionListItemState();
}

class _TransactionListItemState extends State<TransactionListItem>
    with TickerProviderStateMixin {
  Animation<Color> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = ColorTween(
      begin: Colors.black,
      end: Decimal.parse(widget.transaction.amount).toDouble() > 0
          ? Colors.green
          : Colors.red,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    // Tell the animation to start
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: _animation.value),
          borderRadius: BorderRadius.all(Radius.circular(9))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                    DateFormat('yyyy-MM-dd – kk:mm')
                        .format(widget.transaction.dateTime),
                    style: Theme.of(context).textTheme.bodyText1),
                Spacer(),
                Text(
                  Utils.toDisplayablePrice(widget.transaction.amount),
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  "\$${widget.transaction.dollarValue}",
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
