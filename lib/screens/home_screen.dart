import 'package:flutter/material.dart';
import 'package:flutter_dev/main.dart';
import 'package:flutter_dev/model/account.dart';
import 'package:flutter_dev/widgets/account_balance_card.dart';
import 'package:flutter_dev/widgets/account_home_button.dart';
import 'package:flutter_dev/widgets/account_home_statement.dart';
import 'package:flutter_dev/widgets/account_info.dart';

class HomeScreen extends StatefulWidget {
  final Account account;

  const HomeScreen({Key? key, required this.account}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showBalance = true;
  final String image =
      "https://s2.glbimg.com/88a4QNHTzEa2Pwm0NmiFtvja-5I=/0x0:1200x768/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2022/6/Z/BtyF8UT5aeLFwmccA9CQ/fotonaruto2.jpg";

  final String url =
      "https://p2.trrsf.com/image/fget/cf/1200/630/middle/images.terra.com/2022/09/06/istock-1313079918-sokmkksb767p.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    AccountInfo(
                      image: widget.account.user.photo,
                      name: widget.account.user.firstname,
                      branch: widget.account.branch,
                      account: widget.account.account,
                    ),
                    AccountBalanceCard(
                      balance: widget.account.balance,
                      showBalance: showBalance,
                      totalLimit: widget.account.limit,
                      onVisibilityChanged: (showBalance) {
                        this.showBalance = !showBalance;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AccountHomeStatement(
                      account: account,
                      onSeeTransactionsClicked: () => navigateToStatement(
                        context,
                        account,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: AccountHomeButton(
                      title: "Depositar",
                      icon: Icons.currency_exchange,
                      onClick: () => navigateToDeposit(context),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: AccountHomeButton(
                      title: "Sacar",
                      icon: Icons.money,
                      onClick: () => navigateToWhitdrawn(
                        context,
                        widget.account,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void navigateToWhitdrawn(BuildContext context, Account account) async {
    Object? amount = await Navigator.of(context).pushNamed(
      kRouteWhithdrawn,
      arguments: account,
    );
    if (amount != null && amount is double) {
      widget.account.withdrawn(amount);
      setState(() {});
    }
  }

  void navigateToDeposit(BuildContext context) async {
    Object? amount = await Navigator.of(context).pushNamed(kRouteDeposit);
    if (amount != null && amount is double) {
      widget.account.deposit(amount);
      setState(() {});
    }
  }

  void navigateToStatement(BuildContext context, Account account) {
    Navigator.of(context).pushNamed(kRouteStatement, arguments: account);
  }
}
