import 'package:dio/dio.dart';
import 'package:sorioo/core/abstractions/chat/i_chat_service.dart';
import 'package:sorioo/core/constants/env.dart';

class ChatService implements IChatService {
  ChatService({required Dio apiClient}) : _apiClient = apiClient;
  final Dio _apiClient;

  @override
  Future<bool> notifyAll(String message) async {
    return await sendMessageAsync('${Env.apiLocalDevUrl}/');
  }

  @override
  Future<bool> notifyOthers(String message, String? currentClientId) {
    // TODO: implement notifyOthers
    throw UnimplementedError();
  }

  Future<bool> sendMessageAsync(String absoluteUrl, {Object? body}) async {
    return false;
  }
}
