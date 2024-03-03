// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileServiceHash() => r'40d8b59eda539ba980758c63283b788828721245';

/// See also [profileService].
@ProviderFor(profileService)
final profileServiceProvider = AutoDisposeProvider<ProfileService>.internal(
  profileService,
  name: r'profileServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProfileServiceRef = AutoDisposeProviderRef<ProfileService>;
String _$getBuyerProfileHash() => r'2befb3058bd04e19f7d8f9b065ed6265fef09002';

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

typedef GetBuyerProfileRef = AutoDisposeFutureProviderRef<BuyerProfile>;

/// See also [getBuyerProfile].
@ProviderFor(getBuyerProfile)
const getBuyerProfileProvider = GetBuyerProfileFamily();

/// See also [getBuyerProfile].
class GetBuyerProfileFamily extends Family<AsyncValue<BuyerProfile>> {
  /// See also [getBuyerProfile].
  const GetBuyerProfileFamily();

  /// See also [getBuyerProfile].
  GetBuyerProfileProvider call({
    String buyerId = '',
  }) {
    return GetBuyerProfileProvider(
      buyerId: buyerId,
    );
  }

  @override
  GetBuyerProfileProvider getProviderOverride(
    covariant GetBuyerProfileProvider provider,
  ) {
    return call(
      buyerId: provider.buyerId,
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
  String? get name => r'getBuyerProfileProvider';
}

/// See also [getBuyerProfile].
class GetBuyerProfileProvider extends AutoDisposeFutureProvider<BuyerProfile> {
  /// See also [getBuyerProfile].
  GetBuyerProfileProvider({
    this.buyerId = '',
  }) : super.internal(
          (ref) => getBuyerProfile(
            ref,
            buyerId: buyerId,
          ),
          from: getBuyerProfileProvider,
          name: r'getBuyerProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getBuyerProfileHash,
          dependencies: GetBuyerProfileFamily._dependencies,
          allTransitiveDependencies:
              GetBuyerProfileFamily._allTransitiveDependencies,
        );

  final String buyerId;

  @override
  bool operator ==(Object other) {
    return other is GetBuyerProfileProvider && other.buyerId == buyerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, buyerId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
