import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_flutter/features/flight/domain/providers/flight_schedule_providers.dart';
import 'package:travel_flutter/shared/domain/models/flight_schedule_response.dart';

part 'flight_schedule_provider.g.dart';

@Riverpod(keepAlive: false)
class FlightScheduleNotifier extends _$FlightScheduleNotifier {
  @override
  Future<List<FlightScheduleResponse>> build(
    int airFlyLine,
    int airFlyIO,
  ) async {
    final repository = ref.watch(flightScheduleRepositoryProvider);
    final result = await repository.getFlightSchedules(
      airFlyLine: airFlyLine,
      airFlyIO: airFlyIO,
    );
    return result.fold((l) => throw l, (r) => r);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
