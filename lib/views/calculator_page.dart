import 'package:calculator/widgets/app_app_bar.dart';
import 'package:calculator/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class NumberButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const NumberButton(this.text, {super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0), // Increased padding for larger buttons
      child: AspectRatio(
        aspectRatio: 1,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
            backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 40, // Increased font size for better readability
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  const IconButton(this.icon, {super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0), // Increased padding for larger buttons
      child: AspectRatio(
        aspectRatio: 1,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
            backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 40.0,
          ),
        ),
      ),
    );
  }
}


class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String input = '';
  String output = '';

  void processInput() {
    try {
      // Replace ',' with '.' for decimal point compatibility
      String sanitizedInput = input.replaceAll(',', '.');

      // Use the Dart 'dart:math' and 'dart:core' libraries to evaluate the expression
      double result = _evaluateExpression(sanitizedInput);

      setState(() {
        output = result.toString();
      });
    } catch (e) {
      setState(() {
        output = 'Error';
      });
    }
  }

  double _evaluateExpression(String expression) {
    // Using Dart's Expression evaluation

    GrammarParser p = GrammarParser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    return exp.evaluate(EvaluationType.REAL, cm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(text: "calculator",),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(20), // Increased padding for larger display area
                    margin: EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        input,
                        style: TextStyle(
                          fontSize: 32, // Increased font size for better readability
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(20), // Increased padding for larger display area
                    margin: EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        output,
                        style: TextStyle(
                          fontSize: 32, // Increased font size for better readability
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      NumberButton(
                        "7",
                        onPressed: () => setState(() => input += '7'),
                      ),
                      NumberButton(
                        "8",
                        onPressed: () => setState(() => input += '8'),
                      ),
                      NumberButton(
                        "9",
                        onPressed: () => setState(() => input += '9'),
                      ),
                      NumberButton(
                        "(",
                        onPressed: () => setState(() => input += '('),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      NumberButton(
                        "4",
                        onPressed: () => setState(() => input += '4'),
                      ),
                      NumberButton(
                        "5",
                        onPressed: () => setState(() => input += '5'),
                      ),
                      NumberButton(
                        "6",
                        onPressed: () => setState(() => input += '6'),
                      ),
                      NumberButton(
                        ")",
                        onPressed: () => setState(() => input += ')'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      NumberButton(
                        "1",
                        onPressed: () => setState(() => input += '1'),
                      ),
                      NumberButton(
                        "2",
                        onPressed: () => setState(() => input += '2'),
                      ),
                      NumberButton(
                        "3",
                        onPressed: () => setState(() => input += '3'),
                      ),
                      NumberButton(
                        "+",
                        onPressed: () => setState(() => input += '+'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      NumberButton(
                        "C",
                        onPressed: () => setState(() => input = ''),
                      ),
                      NumberButton(
                        "0",
                        onPressed: () => setState(() => input += '0'),
                      ),
                      NumberButton(
                        "=",
                        onPressed: () => setState(() => processInput()),
                      ),
                      NumberButton(
                        "-",
                        onPressed: () => setState(() => input += '-'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      NumberButton(
                        "*",
                        onPressed: () => setState(() => input += '*'),
                      ),
                      NumberButton(
                        "/",
                        onPressed: () => setState(() => input += '/'),
                      ),
                      NumberButton(
                        ".",
                        onPressed: () => setState(() => input += '.'),
                      ),
                      IconButton(
                        Icons.backspace,
                        onPressed: () {
                          setState(() {
                            if (input.isNotEmpty) {
                              input = input.substring(
                                0,
                                input.length - 1,
                              );
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}