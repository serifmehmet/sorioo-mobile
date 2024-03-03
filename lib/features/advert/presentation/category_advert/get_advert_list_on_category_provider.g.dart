// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_advert_list_on_category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAdvertListOnCategoryHash() =>
    r'd0ecd47c2509544e019554360d249706cbd1fb2d';

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

abstract class _$GetAdvertListOnCategory
    extends BuildlessAutoDisposeAsyncNotifier<List<BasicAdvertItemDto>> {
  late final String categoryId;

  FutureOr<List<BasicAdvertItemDto>> build(
    String categoryId,
  );
}

/// See also [GetAdvertListOnCategory].
@ProviderFor(GetAdvertListOnCategory)
const getAdvertListOnCategoryProvider = GetAdvertListOnCategoryFamily();

/// See also [GetAdvertListOnCategory].
class GetAdvertListOnCategoryFamily
    extends Family<AsyncValue<List<BasicAdvertItemDto>>> {
  /// See also [GetAdvertListOnCategory].
  const GetAdvertListOnCategoryFamily();

  /// See also [GetAdvertListOnCategory].
  GetAdvertListOnCategoryProvider call(
    String categoryId,
  ) {
    return GetAdvertListOnCategoryProvider(
      categoryId,
    );
  }

  @override
  GetAdvertListOnCategoryProvider getProviderOverride(
    covariant GetAdvertListOnCategoryProvider provider,
  ) {
    return call(
      provider.categoryId,
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
  String? get name => r'getAdvertListOnCategoryProvider';
}

/// See also [GetAdvertListOnCategory].
class GetAdvertListOnCategoryProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GetAdvertListOnCategory,
        List<BasicAdvertItemDto>> {
  /// See also [GetAdvertListOnCategory].
  GetAdvertListOnCategoryProvider(
    this.categoryId,
  ) : super.internal(
          () => GetAdvertListOnCategory()..categoryId = categoryId,
          from: getAdvertListOnCategoryProvider,
          name: r'getAdvertListOnCategoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAdvertListOnCategoryHash,
          dependencies: GetAdvertListOnCategoryFamily._dependencies,
          allTransitiveDependencies:
              GetAdvertListOnCategoryFamily._allTransitiveDependencies,
        );

  final String categoryId;

  @override
  bool operator ==(Object other) {
    return other is GetAdvertListOnCategoryProvider &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<BasicAdvertItemDto>> runNotifierBuild(
    covariant GetAdvertListOnCategory notifier,
  ) {
    return notifier.build(
      categoryId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
