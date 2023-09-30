import 'package:flutter/material.dart';
import 'package:flutter_dev/model/account.dart';
import 'package:flutter_dev/model/user.dart';
import 'package:flutter_dev/screens/deposit_screen.dart';
import 'package:flutter_dev/screens/home_screen.dart';
import 'package:flutter_dev/screens/statement_screen.dart';
import 'package:flutter_dev/screens/withdraw_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

const String kRouteHome = "/";
const String kRouteDeposit = "/deposit";
const String kRouteWhithdrawn = "/whitdrawn";
const String kRouteStatement = "/statement";

void main() {
  initializeDateFormatting('pt-BR', null).then((_) {
    runApp(const MyApp());
  });
}

final user = User(
  firstname: "Naruto",
  lastname: "Uzumaki",
  document: "123.456.789-11",
  address: "Rua da rua",
  photo: "https://s2.glbimg.com/88a4QNHTzEa2Pwm0NmiFtvja-5I=/0x0:1200x768/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2022/6/Z/BtyF8UT5aeLFwmccA9CQ/fotonaruto2.jpg",
);

final account = Account(
  branch: "0001",
  account: "12356-7",
  user: user,
  transfers: [],
  balance: 1000,
  limit: 60000,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        final args = settings.arguments;
        switch (settings.name) {
          case kRouteHome:
            return MaterialPageRoute(
              builder: (context) => HomeScreen(account: account),
            );
          case kRouteDeposit:
            return MaterialPageRoute(
              builder: (context) => DepositScreen(),
            );
          case kRouteWhithdrawn:
            return MaterialPageRoute(
              builder: (context) => WithDrawScreen(account: args as Account),
            );
          case kRouteStatement:
            return MaterialPageRoute(
              builder: (context) => StatementScreen(transactions: account.transfers),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const Center(
                child: Text("Caminho inválido"),
              ),
            );
        }
      },
      initialRoute: kRouteHome,
    );
  }
}
