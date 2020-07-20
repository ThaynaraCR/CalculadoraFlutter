import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CJS(),
  ));
}

class CJS extends StatefulWidget {
  @override
  CJSState createState() => CJSState();
}

class CJSState extends State<CJS> {
  TextEditingController capital = new TextEditingController();
  TextEditingController taxa = new TextEditingController();
  TextEditingController periodo = new TextEditingController();
  String resultado = "Resultado";

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void calcular() {
    double capitalN = double.parse(capital.text);
    double taxaN = double.parse(taxa.text) / 100;
    double periodoN = double.parse(periodo.text);

    double montante = capitalN + (capitalN * taxaN * periodoN);

    setState(() {
      resultado = "O montante final é $montante reais";
    });
  }

  String validacao(String value) {
    if (value.isEmpty) {
      return "Informe o valor";
    } else {
      if (double.parse(value) <= 0) {
        return "Informe um valor maior que zero";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de juros simples"),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: capital,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Insira o valor de capital :"),
              validator: (value) {
                return validacao(value);
              },
            ),
            TextFormField(
              controller: taxa,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Insira o valor da taxa (mês):"),
              validator: (value) {
                return validacao(value);
              },
            ),
            TextFormField(
              controller: periodo,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Insira o periodo(meses):"),
              validator: (value) {
                return validacao(value);
              },
            ),
            RaisedButton(
              onPressed: () {
                if (formkey.currentState.validate()) {
                  calcular();
                }
              },
              child: Text("Calcular"),
            ),
            Text(resultado)
          ],
        ),
      ),
    );
  }
}
