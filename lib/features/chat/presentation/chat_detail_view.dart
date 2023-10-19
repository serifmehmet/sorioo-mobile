import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/core/theme/widgets/text/app_text_form_field_widget.dart';
import 'package:sorioo/features/chat/presentation/widgets/single_message_item.dart';

class ChatDetailView extends ConsumerStatefulWidget {
  const ChatDetailView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends ConsumerState<ChatDetailView> {
  final _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String get message => _messageController.text;

  @override
  void dispose() {
    _messageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const AppText('Mesaj Detayı'),
        ),
        body: Padding(
          padding: kSemiBigPadding,
          child: Column(
            children: [
              //Messages
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final differentNumber = (index % 2 == 0) ? 1 : 2;
                    return SingleMessageItem(
                      userId: differentNumber,
                    );
                  },
                  itemCount: 13,
                  separatorBuilder: (context, index) => const AppGap.regular(),
                ),
              ),

              //User input
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      enabled: true,
                      autofocus: false,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      hintText: 'Mesajınız',
                      controller: _messageController,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconlyBold.send,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
