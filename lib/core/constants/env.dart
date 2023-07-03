import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static final apiUrl = _Env.apiUrl;
  @EnviedField(varName: 'API_LOCAL_DEV_URL', obfuscate: true)
  static final apiLocalDevUrl = _Env.apiLocalDevUrl;
}
