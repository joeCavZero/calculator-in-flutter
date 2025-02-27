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
      padding: const EdgeInsets.all(
        4.0,
      ), // Increased padding for larger buttons
      child: AspectRatio(
        aspectRatio: 1,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            backgroundColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.primary,
            ),
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
      padding: const EdgeInsets.all(
        4.0,
      ), // Increased padding for larger buttons
      child: AspectRatio(
        aspectRatio: 1,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            backgroundColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.primary,
            ),
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppAppBar(text: "home"),
      drawer: AppDrawer(),
      body: Expanded(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Icon(
                Icons.calculate_outlined,
                size: 300.0,
                color: Theme.of(context).colorScheme.primary,
              ),
              Text(
                'Calculator',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: 40.0,),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/calculator');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.primary,
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: Text(
                  'Open Calculator',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
