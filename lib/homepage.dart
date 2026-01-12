import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double size = 0;
  String inputvalue = "";
  String calculatedvalue = "";
  String operator = "";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          Container(
            height: height * 0.3,
            width: width,
            alignment: Alignment.bottomRight,
            color: const Color.fromARGB(255, 0, 0, 0),
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.1, right: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        calculatedvalue,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        operator,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                  Text(
                    inputvalue,
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Buttons("AC", Colors.grey),
                Buttons("%", Colors.grey),
                Buttons("DEL", Colors.grey),
                Buttons("÷", Colors.grey),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Buttons("7", const Color.fromARGB(255, 111, 110, 110)),
                Buttons("8", const Color.fromARGB(255, 111, 110, 110)),
                Buttons("9", const Color.fromARGB(255, 111, 110, 110)),
                Buttons("X", Colors.grey),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Buttons("4", const Color.fromARGB(255, 111, 110, 110)),
                Buttons("5", const Color.fromARGB(255, 111, 110, 110)),
                Buttons("6", const Color.fromARGB(255, 111, 110, 110)),
                Buttons("–", Colors.grey),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Buttons("1", const Color.fromARGB(255, 111, 110, 110)),
                Buttons("2", const Color.fromARGB(255, 111, 110, 110)),
                Buttons("3", const Color.fromARGB(255, 111, 110, 110)),
                Buttons("+", Colors.grey),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Buttons("00", const Color.fromARGB(255, 111, 110, 110)),
                Buttons("0", const Color.fromARGB(255, 111, 110, 110)),
                Buttons(".", const Color.fromARGB(255, 111, 110, 110)),
                Buttons("=", Colors.deepOrangeAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Buttons(String text, Color color) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.001),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        onTap: () {
          setState(() {
            if (text == "AC") {
              setState(() {
                inputvalue = "";
                calculatedvalue = "";
                operator = "";
              });
            } else if (text == "+" ||
                text == "–" ||
                text == "X" ||
                text == "÷") {
              setState(() {
                calculatedvalue = inputvalue;
                inputvalue = "";
                operator = text;
              });
            } else if (text == "DEL") {
              if (inputvalue.isNotEmpty) {
                inputvalue = inputvalue.substring(0, inputvalue.length - 1);
              }
            } else if (text == "=") {
              setState(() {
                double input = double.parse(inputvalue);
                double calc = double.parse(calculatedvalue);
                if (operator == "+") {
                  inputvalue = (calc + input).toString();
                  calculatedvalue = "";
                  operator = "";
                } else if (operator == "–") {
                  inputvalue = (calc - input).toString();
                  calculatedvalue = "";
                  operator = "";
                } else if (operator == "X") {
                  inputvalue = (calc * input).toString();
                  calculatedvalue = "";
                  operator = "";
                } else if (operator == "÷") {
                  inputvalue = (calc / input).toString();
                  calculatedvalue = "";
                  operator = "";
                }
              });
            } else {
              inputvalue = inputvalue + text;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: height * 0.1,
            width: width * 0.22,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
