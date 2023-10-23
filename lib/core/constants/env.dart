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
  @EnviedField(varName: 'GOOGLE_ANDROID_CLIENT_ID', obfuscate: true)
  static final googleAndroidClientId = _Env.googleAndroidClientId;
  @EnviedField(varName: 'GOOGLE_IOS_CLIENT_ID', obfuscate: true)
  static final googleIosClientId = _Env.googleIosClientId;
  @EnviedField(varName: 'GOOGLE_SERVER_CLIENT_ID', obfuscate: true)
  static final googleServerClientId = _Env.googleServerClientId;
}
