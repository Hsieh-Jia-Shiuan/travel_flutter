import 'package:dartz/dartz.dart';
import 'package:travel_flutter/core/network/network_info.dart';
import 'package:travel_flutter/features/flight/data/datasource/flight_remote_data_source.dart';
import 'package:travel_flutter/features/flight/domain/repositories/flight_schedule_repository.dart';
import 'package:travel_flutter/shared/domain/models/flight_schedule_response.dart';
import 'package:travel_flutter/shared/exceptions/http_exception.dart';

class FlightScheduleRepositoryImpl implements FlightScheduleRepository {
  final FlightRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  FlightScheduleRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<AppException, List<FlightScheduleResponse>>>
  getFlightSchedules({required int airFlyLine, required int airFlyIO}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteSchedules = await remoteDataSource.getFlightSchedules(
          airFlyLine: airFlyLine,
          airFlyIO: airFlyIO,
        );
        return remoteSchedules;
      } on AppException catch (e) {
        return Left(e);
      }
    } else {
      return Left(NoConnectionException('fetchFlightSchedules'));
    }
  }
}
