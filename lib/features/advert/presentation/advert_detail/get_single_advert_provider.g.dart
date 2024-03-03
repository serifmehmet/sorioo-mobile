// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_single_advert_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSingleAdvertHash() => r'3b57ba06f18655583e6e4a0f2c7f3d4b270f6a67';

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

abstract class _$GetSingleAdvert
    extends BuildlessAutoDisposeAsyncNotifier<AdvertDetailDto> {
  late final String advertId;

  FutureOr<AdvertDetailDto> build({
    required String advertId,
  });
}

/// See also [GetSingleAdvert].
@ProviderFor(GetSingleAdvert)
const getSingleAdvertProvider = GetSingleAdvertFamily();

/// See also [GetSingleAdvert].
class GetSingleAdvertFamily extends Family<AsyncValue<AdvertDetailDto>> {
  /// See also [GetSingleAdvert].
  const GetSingleAdvertFamily();

  /// See also [GetSingleAdvert].
  GetSingleAdvertProvider call({
    required String advertId,
  }) {
    return GetSingleAdvertProvider(
      advertId: advertId,
    );
  }

  @override
  GetSingleAdvertProvider getProviderOverride(
    covariant GetSingleAdvertProvider provider,
  ) {
    return call(
      advertId: provider.advertId,
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
  String? get name => r'getSingleAdvertProvider';
}

/// See also [GetSingleAdvert].
class GetSingleAdvertProvider extends AutoDisposeAsyncNotifierProviderImpl<
    GetSingleAdvert, AdvertDetailDto> {
  /// See also [GetSingleAdvert].
  GetSingleAdvertProvider({
    required this.advertId,
  }) : super.internal(
          () => GetSingleAdvert()..advertId = advertId,
          from: getSingleAdvertProvider,
          name: r'getSingleAdvertProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSingleAdvertHash,
          dependencies: GetSingleAdvertFamily._dependencies,
          allTransitiveDependencies:
              GetSingleAdvertFamily._allTransitiveDependencies,
        );

  final String advertId;

  @override
  bool operator ==(Object other) {
    return other is GetSingleAdvertProvider && other.advertId == advertId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, advertId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<AdvertDetailDto> runNotifierBuild(
    covariant GetSingleAdvert notifier,
  ) {
    return notifier.build(
      advertId: advertId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
