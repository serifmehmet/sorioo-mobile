import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppText("Message"),
      ),
    );
  }
}
