import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //initial values
  String result = "0";
  String value = "0";
  double number1 = 0.0;
  double number2 = 0.0;
  String operand = "";

  //function for calculation
  buttonPressed(dynamic buttonText) {

    //for Clear
    if (buttonText == "C") {
      value = "0";
      number1 = 0.0;
      number2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      number1 = double.parse(result);
      operand = buttonText;
      value = "0";
    } else if (buttonText == "=") {
      number2 = double.parse(result);
      if (operand == "+") {
        value = (number1 + number2).toString();
      }

      if (operand == "-") {
        value = (number1 - number2).toString();
      }

      if (operand == "X") {
        value = (number1 * number2).toString();
      }

      if (operand == "/") {
        value = (number1 / number2).toString();
      }

      number1 = 0.0;
      number2 = 0.0;
      operand = "";
    } else {
      value = value + buttonText;
    }

    print(value);

    setState(() {
      result = double.parse(value).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Calculator",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
                //color: Colors.blueGrey,
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    result,
                    style: const TextStyle(
                        fontSize: 48.0, fontWeight: FontWeight.bold),
                  ),
                )),
            const Expanded(child: Divider()),
            //expanded take available space if column vertical and if row horizontal spaces

            //  Divider(),
            Column(
              children: [
                Row(children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("+"),
                ]),
                Row(children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("-"),
                ]),
                Row(children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("X"),
                ]),
                Row(children: [
                  buildButton("0"),
                  buildButton("C"),
                  buildButton("="),
                  buildButton("/"),
                ]),
              ],
            ),
          ],
        ));
  }

//build button- reusable widgets
  Widget buildButton(String buttonText) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              buttonText,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }
}
