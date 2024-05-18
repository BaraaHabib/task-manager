

import 'package:flutter/material.dart';

/// {@template empty_widget}
/// Generic empty widget to be displayed
/// {@endtemplate}
class AppEmptyWidget extends StatelessWidget {

  /// {@macro empty_widget}
  const AppEmptyWidget({
    this.message = '',
    this.width = 250,
    this.buttonLabel,
    this.height = 300,
    super.key,
  });

  ///
  final double width;

  ///
  final double height;

  ///
  final String message;

  ///
  final String? buttonLabel;

  @override
  Widget build(BuildContext context) =>
      Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 70),
          padding: const EdgeInsets.symmetric(horizontal: 130),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 30),
              Text(
                message,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      );
}
