// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_bank_info_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sellerBankInfoControllerHash() =>
    r'6b133e0770d969a3df6f50c87c6ac2429d75edd0';

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

abstract class _$SellerBankInfoController
    extends BuildlessAutoDisposeAsyncNotifier<List<SellerBankInfo>> {
  late final String sellerId;

  FutureOr<List<SellerBankInfo>> build(
    String sellerId,
  );
}

/// See also [SellerBankInfoController].
@ProviderFor(SellerBankInfoController)
const sellerBankInfoControllerProvider = SellerBankInfoControllerFamily();

/// See also [SellerBankInfoController].
class SellerBankInfoControllerFamily
    extends Family<AsyncValue<List<SellerBankInfo>>> {
  /// See also [SellerBankInfoController].
  const SellerBankInfoControllerFamily();

  /// See also [SellerBankInfoController].
  SellerBankInfoControllerProvider call(
    String sellerId,
  ) {
    return SellerBankInfoControllerProvider(
      sellerId,
    );
  }

  @override
  SellerBankInfoControllerProvider getProviderOverride(
    covariant SellerBankInfoControllerProvider provider,
  ) {
    return call(
      provider.sellerId,
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
  String? get name => r'sellerBankInfoControllerProvider';
}

/// See also [SellerBankInfoController].
class SellerBankInfoControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SellerBankInfoController,
        List<SellerBankInfo>> {
  /// See also [SellerBankInfoController].
  SellerBankInfoControllerProvider(
    this.sellerId,
  ) : super.internal(
          () => SellerBankInfoController()..sellerId = sellerId,
          from: sellerBankInfoControllerProvider,
          name: r'sellerBankInfoControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sellerBankInfoControllerHash,
          dependencies: SellerBankInfoControllerFamily._dependencies,
          allTransitiveDependencies:
              SellerBankInfoControllerFamily._allTransitiveDependencies,
        );

  final String sellerId;

  @override
  bool operator ==(Object other) {
    return other is SellerBankInfoControllerProvider &&
        other.sellerId == sellerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sellerId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<SellerBankInfo>> runNotifierBuild(
    covariant SellerBankInfoController notifier,
  ) {
    return notifier.build(
      sellerId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
