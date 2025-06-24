// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_schedule_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flightScheduleNotifierHash() =>
    r'4e79ed1129536c502834b15a5afb9126a483bfda';

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

abstract class _$FlightScheduleNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<FlightScheduleResponse>> {
  late final int airFlyLine;
  late final int airFlyIO;

  FutureOr<List<FlightScheduleResponse>> build(int airFlyLine, int airFlyIO);
}

/// See also [FlightScheduleNotifier].
@ProviderFor(FlightScheduleNotifier)
const flightScheduleNotifierProvider = FlightScheduleNotifierFamily();

/// See also [FlightScheduleNotifier].
class FlightScheduleNotifierFamily
    extends Family<AsyncValue<List<FlightScheduleResponse>>> {
  /// See also [FlightScheduleNotifier].
  const FlightScheduleNotifierFamily();

  /// See also [FlightScheduleNotifier].
  FlightScheduleNotifierProvider call(int airFlyLine, int airFlyIO) {
    return FlightScheduleNotifierProvider(airFlyLine, airFlyIO);
  }

  @override
  FlightScheduleNotifierProvider getProviderOverride(
    covariant FlightScheduleNotifierProvider provider,
  ) {
    return call(provider.airFlyLine, provider.airFlyIO);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'flightScheduleNotifierProvider';
}

/// See also [FlightScheduleNotifier].
class FlightScheduleNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          FlightScheduleNotifier,
          List<FlightScheduleResponse>
        > {
  /// See also [FlightScheduleNotifier].
  FlightScheduleNotifierProvider(int airFlyLine, int airFlyIO)
    : this._internal(
        () => FlightScheduleNotifier()
          ..airFlyLine = airFlyLine
          ..airFlyIO = airFlyIO,
        from: flightScheduleNotifierProvider,
        name: r'flightScheduleNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$flightScheduleNotifierHash,
        dependencies: FlightScheduleNotifierFamily._dependencies,
        allTransitiveDependencies:
            FlightScheduleNotifierFamily._allTransitiveDependencies,
        airFlyLine: airFlyLine,
        airFlyIO: airFlyIO,
      );

  FlightScheduleNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.airFlyLine,
    required this.airFlyIO,
  }) : super.internal();

  final int airFlyLine;
  final int airFlyIO;

  @override
  FutureOr<List<FlightScheduleResponse>> runNotifierBuild(
    covariant FlightScheduleNotifier notifier,
  ) {
    return notifier.build(airFlyLine, airFlyIO);
  }

  @override
  Override overrideWith(FlightScheduleNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: FlightScheduleNotifierProvider._internal(
        () => create()
          ..airFlyLine = airFlyLine
          ..airFlyIO = airFlyIO,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        airFlyLine: airFlyLine,
        airFlyIO: airFlyIO,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    FlightScheduleNotifier,
    List<FlightScheduleResponse>
  >
  createElement() {
    return _FlightScheduleNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FlightScheduleNotifierProvider &&
        other.airFlyLine == airFlyLine &&
        other.airFlyIO == airFlyIO;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, airFlyLine.hashCode);
    hash = _SystemHash.combine(hash, airFlyIO.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FlightScheduleNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<FlightScheduleResponse>> {
  /// The parameter `airFlyLine` of this provider.
  int get airFlyLine;

  /// The parameter `airFlyIO` of this provider.
  int get airFlyIO;
}

class _FlightScheduleNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          FlightScheduleNotifier,
          List<FlightScheduleResponse>
        >
    with FlightScheduleNotifierRef {
  _FlightScheduleNotifierProviderElement(super.provider);

  @override
  int get airFlyLine => (origin as FlightScheduleNotifierProvider).airFlyLine;
  @override
  int get airFlyIO => (origin as FlightScheduleNotifierProvider).airFlyIO;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
