import 'package:flutter/foundation.dart';
import 'package:sorioo/core/abstractions/chat/chat_method_names.dart';
import 'package:sorioo/core/abstractions/signal_r_hubs/i_chat_hubs.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:sorioo/core/constants/env.dart';
import 'package:sorioo/features/chat/domain/dto/new_push_chat_message_dto.dart';

class ChatHubService implements IChatHubsService {
  final hubConnection = HubConnectionBuilder().withUrl('${Env.apiLocalDevUrl}/hubs/chat').build();

  @override
  Future<bool> connectToHub() {
    return _connectServer();
  }

  @override
  String? getClientId() {
    return hubConnection.connectionId;
  }

  @override
  void onNewMessage(String methodName, Function(List<dynamic>?) onRecieved) {
    hubConnection.on(methodName, onRecieved);
  }

  @override
  Future<bool> pushMessageToServer(String message) async {
    try {
      if (hubConnection.state == HubConnectionState.disconnected) {
        if (!(await _connectServer())) {
          if (kDebugMode) {
            print('Unable to connect to hub');
          }
        }
      }

      final object = NewPushChatMessageDto(
        message: message,
        clientId: hubConnection.connectionId,
      );

      await hubConnection.invoke(
        ChatMethodNames.newMessageToServer,
        args: [object.toJson()],
      );

      return true;
    } catch (ex) {
      if (kDebugMode) {
        print('GetMessageFromClient failed to call $ex');
      }
    }

    return false;
  }

  Future<bool> _connectServer() async {
    try {
      await hubConnection.start();
      if (kDebugMode) {
        print('connection started...');
      }
      return true;
    } catch (ex) {
      if (kDebugMode) {
        print('Connection error =>>>> $ex');
      }
    }

    return false;
  }
}
