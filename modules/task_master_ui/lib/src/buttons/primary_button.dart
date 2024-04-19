
part of '../task_master_ui.dart';

/// {@template task_master_button}
/// Primary button
/// [
/// {@endtemplate}
class PrimaryButton extends StatelessWidget {

  /// {@macro task_master_button}
  const PrimaryButton({
    required this.content,
    super.key,
    this.loading = false,
    this.onPressed,
    this.height = 55,
  });

  /// widget displayed on button
  final Widget content;

  /// show loader on button
  final bool loading;

  /// on pressed callback
  final VoidCallback? onPressed;

  /// button height
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 300,),
            crossFadeState: loading ? CrossFadeState.showSecond : CrossFadeState
                .showFirst,
            firstChild: content,
            secondChild: const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
