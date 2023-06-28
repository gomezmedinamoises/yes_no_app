import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_v1/domain/entities/message.dart';
import 'package:yes_no_app_v1/presentation/widgets/chat/her_message_buble.dart';
import 'package:yes_no_app_v1/presentation/widgets/chat/my_message_buble.dart';
import 'package:yes_no_app_v1/presentation/widgets/shared/message_field_box.dart';

import '../../providers/chat_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'data:image/png;base64,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'),
          ),
        ),
        title: const Text('Friend!'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // El widget estará observando el ChatProvider el cual mantendrá el estado
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messageList[index];
                    return (message.fromWho == FromWho.hers)
                        ? HerMessageBubble(message: message)
                        : MyMessageBubble(message: message);
                  })),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
