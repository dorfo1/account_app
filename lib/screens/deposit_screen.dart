import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/widgets/base_button.dart';
import 'package:flutter_dev/widgets/base_form_field.dart';

class DepositScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final formatter = CurrencyTextInputFormatter(
    locale: "pt-BR",
    symbol: "R\$",
  );

  final textController = TextEditingController(text: "R\$ 0,00");

  DepositScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Depositar"),
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
                    children: [
                      BaseFormField(
                        controller: textController,
                        inputType: TextInputType.number,
                        hint: "Informe o valor do depósito",
                        validator: (value) => validateValue(value),
                        formatters: [formatter],
                      )
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

  String? validateValue(String? value) {
    try {
      double amount = formatter.getUnformattedValue().toDouble();
      if (amount <= 0) return "Insira valor maior que zero";
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
