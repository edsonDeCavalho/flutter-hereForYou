import 'package:flutter/material.dart';
import 'package:here_for_u/screens/sos/sos_animation.dart';

class RedirectScreen extends StatelessWidget {
  const RedirectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 0),
        () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const SosAnimationScreen();
              },
            ),
            (route) => false,
          );
        },
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Column();
        }
        return Container();
      },
    );
  }
}
