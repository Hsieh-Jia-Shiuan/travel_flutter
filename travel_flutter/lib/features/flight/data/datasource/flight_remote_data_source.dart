import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:travel_flutter/shared/data/remote/remote.dart';
import 'package:travel_flutter/shared/domain/models/flight_schedule_response.dart';
import 'package:travel_flutter/shared/exceptions/http_exception.dart';

abstract class FlightRemoteDataSource {
  Future<Either<AppException, List<FlightScheduleResponse>>>
  getFlightSchedules({required int airFlyLine, required int airFlyIO});
}

class FlightRemoteDataSourceImpl implements FlightRemoteDataSource {
  final NetworkService networkService;

  FlightRemoteDataSourceImpl({required this.networkService});

  @override
  Future<Either<AppException, List<FlightScheduleResponse>>>
  getFlightSchedules({required int airFlyLine, required int airFlyIO}) async {
    await Future.delayed(Duration(seconds: 2));
    final response = await networkService.get(
      '/InstantSchedule.ashx',
      queryParameters: {
        'AirFlyLine': airFlyLine.toString(),
        'AirFlyIO': airFlyIO.toString(),
      },
    );

    return response.fold((error) => Left(error), (response) {
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        final Map<String, dynamic> jsonResponse = data is String
            ? json.decode(data)
            : data as Map<String, dynamic>;
        final List<dynamic> instantScheduleJson =
            jsonResponse['InstantSchedule'];
        return Right(
          instantScheduleJson
              .map((json) => FlightScheduleResponse.fromJson(json))
              .toList(),
        );
      } else {
        return Left(
          ServerException(response.statusCode, 'fetchFlightSchedules'),
        );
      }
    });
  }
}
