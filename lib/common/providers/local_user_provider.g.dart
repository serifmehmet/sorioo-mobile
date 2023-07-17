// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localUserProviderHash() => r'24865bcc3326087b9cbf9f3d1c1d2637c7df0aee';

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

typedef LocalUserProviderRef = AutoDisposeProviderRef<LocalUser>;

/// See also [localUserProvider].
@ProviderFor(localUserProvider)
const localUserProviderProvider = LocalUserProviderFamily();

/// See also [localUserProvider].
class LocalUserProviderFamily extends Family<LocalUser> {
  /// See also [localUserProvider].
  const LocalUserProviderFamily();

  /// See also [localUserProvider].
  LocalUserProviderProvider call({
    required String userId,
  }) {
    return LocalUserProviderProvider(
      userId: userId,
    );
  }

  @override
  LocalUserProviderProvider getProviderOverride(
    covariant LocalUserProviderProvider provider,
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
  String? get name => r'localUserProviderProvider';
}

/// See also [localUserProvider].
class LocalUserProviderProvider extends AutoDisposeProvider<LocalUser> {
  /// See also [localUserProvider].
  LocalUserProviderProvider({
    required this.userId,
  }) : super.internal(
          (ref) => localUserProvider(
            ref,
            userId: userId,
          ),
          from: localUserProviderProvider,
          name: r'localUserProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$localUserProviderHash,
          dependencies: LocalUserProviderFamily._dependencies,
          allTransitiveDependencies:
              LocalUserProviderFamily._allTransitiveDependencies,
        );

  final String userId;

  @override
  bool operator ==(Object other) {
    return other is LocalUserProviderProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
