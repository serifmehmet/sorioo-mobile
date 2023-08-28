// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localUserHash() => r'9fc4f71cbec9f84b2f0030d8ddb4a9ea8cac35e6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef LocalUserRef = AutoDisposeProviderRef<LocalUser>;

/// See also [localUser].
@ProviderFor(localUser)
const localUserProvider = LocalUserFamily();

/// See also [localUser].
class LocalUserFamily extends Family<LocalUser> {
  /// See also [localUser].
  const LocalUserFamily();

  /// See also [localUser].
  LocalUserProvider call({
    required String userId,
  }) {
    return LocalUserProvider(
      userId: userId,
    );
  }

  @override
  LocalUserProvider getProviderOverride(
    covariant LocalUserProvider provider,
  ) {
    return call(
      userId: provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'localUserProvider';
}

/// See also [localUser].
class LocalUserProvider extends AutoDisposeProvider<LocalUser> {
  /// See also [localUser].
  LocalUserProvider({
    required this.userId,
  }) : super.internal(
          (ref) => localUser(
            ref,
            userId: userId,
          ),
          from: localUserProvider,
          name: r'localUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$localUserHash,
          dependencies: LocalUserFamily._dependencies,
          allTransitiveDependencies: LocalUserFamily._allTransitiveDependencies,
        );

  final String userId;

  @override
  bool operator ==(Object other) {
    return other is LocalUserProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
