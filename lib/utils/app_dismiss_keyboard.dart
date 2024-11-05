import 'package:flutter/cupertino.dart';

class AppDismissKeyboard extends StatelessWidget {
  final Widget child;

  const AppDismissKeyboard({required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
