import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static final apiUrl = _Env.apiUrl;
  @EnviedField(varName: 'API_LOCAL_DEV_URL', obfuscate: true)
  static final apiLocalDevUrl = _Env.apiLocalDevUrl;
  @EnviedField(varName: 'API_LOCAL_DEV_VSCODE_URL', obfuscate: true)
  static final apiLocalDevVsCodeUrl = _Env.apiLocalDevVsCodeUrl;
  @EnviedField(varName: 'API_REMOTE_URL', obfuscate: true)
  static final apiRemoteUrl = _Env.apiRemoteUrl;
  @EnviedField(varName: 'GOOGLE_CLIENT_ID', obfuscate: true)
  static final googleClientId = _Env.googleClientId;
  @EnviedField(varName: 'GOOGLE_SERVER_CLIENT_ID', obfuscate: true)
  static final googleServerClientId = _Env.googleServerClientId;
}
