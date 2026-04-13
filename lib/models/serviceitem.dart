import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:wingbank/page/servicepage/bill_payment.dart';
import 'package:wingbank/page/servicepage/code_to_wing.dart';
import 'package:wingbank/page/servicepage/current_account.dart';
import 'package:wingbank/page/servicepage/free_cash.dart';
import 'package:wingbank/page/servicepage/loan.dart';
import 'package:wingbank/page/servicepage/loc_transfer.dart';
import 'package:wingbank/page/servicepage/new_account.dart';
import 'package:wingbank/page/servicepage/top_up.dart';
import 'package:wingbank/page/servicepage/world_tansfer.dart';

class ServiceItem {
  final String title;
  final String image;
  final Widget Function() page;

  ServiceItem(this.title, this.image, this.page);
}

final List<ServiceItem> serviceItems = [
  ServiceItem(
    'My Account',
    'lib/images/myaccount3.png',
    () => CurrentAccount(),
  ),
  ServiceItem(
    'Local Transfer',
    'lib/images/localtransfer.png',
    () => LocTransfer(),
  ),
  ServiceItem(
    'World Transfer',
    'lib/images/wroldtransfer.png',
    () => WorldTansfer(),
  ),
  ServiceItem('Bill Payment', 'lib/images/bilpayment.png', () => BillPayment()),
  ServiceItem('Phone Top up', 'lib/images/phone top up.png', () => TopUp()),
  ServiceItem('Code To Wing', 'lib/images/codetowing.png', () => CodeToWing()),
  ServiceItem('New Account', 'lib/images/newaccount.png', () => NewAccount()),
  ServiceItem('Loan', 'lib/images/loan.png', () => Loan()),
  ServiceItem('Free Cash Out', 'lib/images/freecashout.png', () => FreeCash()),
];
