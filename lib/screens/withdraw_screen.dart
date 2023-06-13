import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/model/account.dart';
import 'package:flutter_dev/widgets/base_button.dart';
import 'package:flutter_dev/widgets/base_form_field.dart';
import 'package:simple_currency_format/simple_currency_format.dart';

class WithDrawScreen extends StatelessWidget {
  final Account account;
  final formKey = GlobalKey<FormState>();
  final formatter = CurrencyTextInputFormatter(
    locale: "pt-BR",
    symbol: "R\$",
  );

  final textController = TextEditingController(text: "R\$ 0,00");

  WithDrawScreen({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sacar"),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseFormField(
                        controller: textController,
                        inputType: TextInputType.number,
                        hint: "Informe o valor de saque",
                        validator: (value) => validateValue(
                          value,
                          account.balance,
                        ),
                        formatters: [formatter],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                              text: "Saldo atual: ",
                            ),
                            TextSpan(
                              text: currencyFormat(account.balance),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: BaseButton(
              child: const Text("Confirmar"),
              onClick: () => validateForm(context),
            ),
          )
        ],
      ),
    );
  }

  String? validateValue(String? value, double balance) {
    try {
      double amount = formatter.getUnformattedValue().toDouble();
      if (amount <= 0) return "Insira valor maior que zero";
      if (amount > balance) return "Valor inserido maior que o saldo";
      return null;
    } catch (ex) {
      return "Valor inválido";
    }
  }

  void validateForm(BuildContext context) {
    if (formKey.currentState?.validate() == false) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pop(formatter.getUnformattedValue().toDouble());
    });
  }
}
