
import 'package:flutter/material.dart';

/// app loading widget
class LoadingWidget extends StatelessWidget {
  /// app loading widget
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(8),
        margin:  const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Text('Fetching data'),
      ),
    );
  }
}
