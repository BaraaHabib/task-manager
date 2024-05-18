

import 'package:flutter/material.dart';

/// {@template error_widget}
/// Generic error widget to be displayed
/// {@endtemplate}
class AppErrorWidget extends StatelessWidget {

  /// {@macro error_widget}
  const AppErrorWidget({
    this.message = '',
    required this.retryCallback,
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

  ///
  final VoidCallback retryCallback;

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
              FractionallySizedBox(
                widthFactor: .6,
                child: FilledButton(
                  onPressed: retryCallback,
                  style: FilledButton.styleFrom(
                    backgroundColor: Theme
                        .of(context)
                        .primaryColor,),
                  child: Text(
                    buttonLabel ?? 'Retry',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.black),
                  ),),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      );
}
