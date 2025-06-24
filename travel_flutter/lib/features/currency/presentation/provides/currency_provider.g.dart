// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currencyScheduleNotifierHash() =>
    r'20c8e8d3488da2afffa3125777e73746e2e1ecd3';

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

abstract class _$CurrencyScheduleNotifier
    extends BuildlessAutoDisposeAsyncNotifier<CurrencyResponse> {
  late final String apiKey;
  late final String? baseCurrency;
  late final String? currencies;

  FutureOr<CurrencyResponse> build({
    required String apiKey,
    String? baseCurrency,
    String? currencies,
  });
}

/// See also [CurrencyScheduleNotifier].
@ProviderFor(CurrencyScheduleNotifier)
const currencyScheduleNotifierProvider = CurrencyScheduleNotifierFamily();

/// See also [CurrencyScheduleNotifier].
class CurrencyScheduleNotifierFamily
    extends Family<AsyncValue<CurrencyResponse>> {
  /// See also [CurrencyScheduleNotifier].
  const CurrencyScheduleNotifierFamily();

  /// See also [CurrencyScheduleNotifier].
  CurrencyScheduleNotifierProvider call({
    required String apiKey,
    String? baseCurrency,
    String? currencies,
  }) {
    return CurrencyScheduleNotifierProvider(
      apiKey: apiKey,
      baseCurrency: baseCurrency,
      currencies: currencies,
    );
  }

  @override
  CurrencyScheduleNotifierProvider getProviderOverride(
    covariant CurrencyScheduleNotifierProvider provider,
  ) {
    return call(
      apiKey: provider.apiKey,
      baseCurrency: provider.baseCurrency,
      currencies: provider.currencies,
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
  String? get name => r'currencyScheduleNotifierProvider';
}

/// See also [CurrencyScheduleNotifier].
class CurrencyScheduleNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          CurrencyScheduleNotifier,
          CurrencyResponse
        > {
  /// See also [CurrencyScheduleNotifier].
  CurrencyScheduleNotifierProvider({
    required String apiKey,
    String? baseCurrency,
    String? currencies,
  }) : this._internal(
         () => CurrencyScheduleNotifier()
           ..apiKey = apiKey
           ..baseCurrency = baseCurrency
           ..currencies = currencies,
         from: currencyScheduleNotifierProvider,
         name: r'currencyScheduleNotifierProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$currencyScheduleNotifierHash,
         dependencies: CurrencyScheduleNotifierFamily._dependencies,
         allTransitiveDependencies:
             CurrencyScheduleNotifierFamily._allTransitiveDependencies,
         apiKey: apiKey,
         baseCurrency: baseCurrency,
         currencies: currencies,
       );

  CurrencyScheduleNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.apiKey,
    required this.baseCurrency,
    required this.currencies,
  }) : super.internal();

  final String apiKey;
  final String? baseCurrency;
  final String? currencies;

  @override
  FutureOr<CurrencyResponse> runNotifierBuild(
    covariant CurrencyScheduleNotifier notifier,
  ) {
    return notifier.build(
      apiKey: apiKey,
      baseCurrency: baseCurrency,
      currencies: currencies,
    );
  }

  @override
  Override overrideWith(CurrencyScheduleNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrencyScheduleNotifierProvider._internal(
        () => create()
          ..apiKey = apiKey
          ..baseCurrency = baseCurrency
          ..currencies = currencies,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        apiKey: apiKey,
        baseCurrency: baseCurrency,
        currencies: currencies,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    CurrencyScheduleNotifier,
    CurrencyResponse
  >
  createElement() {
    return _CurrencyScheduleNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrencyScheduleNotifierProvider &&
        other.apiKey == apiKey &&
        other.baseCurrency == baseCurrency &&
        other.currencies == currencies;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, apiKey.hashCode);
    hash = _SystemHash.combine(hash, baseCurrency.hashCode);
    hash = _SystemHash.combine(hash, currencies.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CurrencyScheduleNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<CurrencyResponse> {
  /// The parameter `apiKey` of this provider.
  String get apiKey;

  /// The parameter `baseCurrency` of this provider.
  String? get baseCurrency;

  /// The parameter `currencies` of this provider.
  String? get currencies;
}

class _CurrencyScheduleNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          CurrencyScheduleNotifier,
          CurrencyResponse
        >
    with CurrencyScheduleNotifierRef {
  _CurrencyScheduleNotifierProviderElement(super.provider);

  @override
  String get apiKey => (origin as CurrencyScheduleNotifierProvider).apiKey;
  @override
  String? get baseCurrency =>
      (origin as CurrencyScheduleNotifierProvider).baseCurrency;
  @override
  String? get currencies =>
      (origin as CurrencyScheduleNotifierProvider).currencies;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
