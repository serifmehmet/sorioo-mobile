import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/chat/data/chat_repository.dart';
import 'package:sorioo/features/chat/domain/dto/response/single_chat_response_dto.dart';

part 'chat_list_controller.g.dart';

@riverpod
class ChatListController extends _$ChatListController {
  @override
  FutureOr<List<SingleChatResponseDto>?> build() async {
    final chatRepository = ref.watch(chatRepositoryProvider);
    final userId = CacheManager.instance.getStringValue(PreferencesKeys.userId);
    final chatListEither = await chatRepository.getChatList(userId).run();

    chatListEither
      ..mapLeft((error) {
        if (error.code == 201) {
          throw ApiException(message: 'Henüz bir sohbet başlatmadınız.');
        }
      })
      ..map((chatList) {
        return chatList.data;
      });

    return null;
  }
}
