import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/core/http/api_provider.dart';
import 'package:sorioo/core/http/generic_response.dart';
import 'package:sorioo/features/chat/domain/dto/response/single_chat_response_dto.dart';
import 'package:sorioo/features/seller/domain/seller_bank_info.dart';

part 'chat_repository.g.dart';

class ChatRepository {
  ChatRepository({required Dio client}) : _client = client;
  final Dio _client;

  TaskEither<ApiException, GenericResponse<List<SingleChatResponseDto>>> getChatList(String userId) =>
      TaskEither<ApiException, Response<dynamic>>.tryCatch(
        () => _client.get('/chat/getchats', queryParameters: {'userId': userId}),
        (o, s) => ApiErrorHandler.handleError(o),
      )
          .chainEither(
            (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
              response,
              (r) => r.statusCode == 200 || r.statusCode! < 300,
              (response) => ApiErrorHandler.handleError(response.statusMessage),
            ).map((a) => a.data),
          )
          .chainEither(
            (data) => Either<ApiException, Map<String, dynamic>>.safeCast(
              data,
              (error) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          )
          .chainEither(
            (castedObject) => Either<ApiException, Map<String, dynamic>>.fromPredicate(
              castedObject,
              (r) => r.containsKey('error') && r['error'] == null,
              (error) => NotFoundException(
                message: error['error']['message'].toString(),
                code: int.parse(
                  error['error']['code'].toString(),
                ),
              ),
            ),
          )
          .chainEither(
            (dataObject) => Either<ApiException, GenericResponse<List<SingleChatResponseDto>>>.tryCatch(
              () => GenericResponse<List<SingleChatResponseDto>>.fromJson(
                dataObject,
                (Object? sellerList) => singleChatResponseListFromJson(
                  sellerList! as List<dynamic>,
                ),
              ),
              (error, stackTrace) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          );
}

@riverpod
ChatRepository chatRepository(ChatRepositoryRef ref) {
  return ChatRepository(client: ref.watch(dioProvider));
}
