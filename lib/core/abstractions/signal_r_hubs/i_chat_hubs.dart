abstract class IChatHubsService {
  String? getClientId();
  Future<bool> connectToHub();
  onNewMessage(String methodName, Function(List<dynamic>?) onRecieved);
  Future<bool> pushMessageToServer(String message);
}
