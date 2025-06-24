import 'package:dartz/dartz.dart';
import 'package:travel_flutter/shared/domain/models/flight_schedule_response.dart';
import 'package:travel_flutter/shared/exceptions/http_exception.dart';

abstract class FlightScheduleRepository {
  Future<Either<AppException, List<FlightScheduleResponse>>>
  getFlightSchedules({required int airFlyLine, required int airFlyIO});
}
