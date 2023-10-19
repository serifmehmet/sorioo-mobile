// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$advertServiceHash() => r'438fb29e35c649794ec8e05ce788c4bac8227c6a';

/// See also [advertService].
@ProviderFor(advertService)
final advertServiceProvider = AutoDisposeProvider<AdvertService>.internal(
  advertService,
  name: r'advertServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$advertServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AdvertServiceRef = AutoDisposeProviderRef<AdvertService>;
String _$getCategoriesHash() => r'e7e19af4a73c80941203534401298f7ca49a208a';

/// See also [getCategories].
@ProviderFor(getCategories)
final getCategoriesProvider =
    AutoDisposeFutureProvider<List<Category>?>.internal(
  getCategories,
  name: r'getCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCategoriesRef = AutoDisposeFutureProviderRef<List<Category>?>;
String _$getSubCategoriesHash() => r'3dbaf36f5a9fd529e101b97b29ad0bafd16065ae';

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

typedef GetSubCategoriesRef = AutoDisposeFutureProviderRef<List<Category>?>;

/// See also [getSubCategories].
@ProviderFor(getSubCategories)
const getSubCategoriesProvider = GetSubCategoriesFamily();

/// See also [getSubCategories].
class GetSubCategoriesFamily extends Family<AsyncValue<List<Category>?>> {
  /// See also [getSubCategories].
  const GetSubCategoriesFamily();

  /// See also [getSubCategories].
  GetSubCategoriesProvider call({
    String mainCategoryId = '',
  }) {
    return GetSubCategoriesProvider(
      mainCategoryId: mainCategoryId,
    );
  }

  @override
  GetSubCategoriesProvider getProviderOverride(
    covariant GetSubCategoriesProvider provider,
  ) {
    return call(
      mainCategoryId: provider.mainCategoryId,
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
  String? get name => r'getSubCategoriesProvider';
}

/// See also [getSubCategories].
class GetSubCategoriesProvider
    extends AutoDisposeFutureProvider<List<Category>?> {
  /// See also [getSubCategories].
  GetSubCategoriesProvider({
    this.mainCategoryId = '',
  }) : super.internal(
          (ref) => getSubCategories(
            ref,
            mainCategoryId: mainCategoryId,
          ),
          from: getSubCategoriesProvider,
          name: r'getSubCategoriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSubCategoriesHash,
          dependencies: GetSubCategoriesFamily._dependencies,
          allTransitiveDependencies:
              GetSubCategoriesFamily._allTransitiveDependencies,
        );

  final String mainCategoryId;

  @override
  bool operator ==(Object other) {
    return other is GetSubCategoriesProvider &&
        other.mainCategoryId == mainCategoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mainCategoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
