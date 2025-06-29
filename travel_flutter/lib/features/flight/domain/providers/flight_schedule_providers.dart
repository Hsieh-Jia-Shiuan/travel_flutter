import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_flutter/features/flight/data/repositories/flight_schedule_repository_impl.dart';
import 'package:travel_flutter/features/flight/domain/repositories/flight_schedule_repository.dart';
import 'package:travel_flutter/features/flight/data/datasource/flight_remote_data_source.dart';
import 'package:travel_flutter/core/network/network_info.dart';
import 'package:travel_flutter/shared/data/remote/remote.dart';
import 'package:travel_flutter/shared/domain/providers/http_network_service_provider.dart';

// get flight from api
final flightRemoteDataSourceProvider =
    Provider.family<FlightRemoteDataSource, NetworkService>(
      (_, networkService) =>
          FlightRemoteDataSourceImpl(networkService: networkService),
    );

// check connection
final connectivityProvider = Provider<Connectivity>((ref) => Connectivity());

// network
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  final connectivity = ref.watch(connectivityProvider);
  return NetworkInfoImpl(connectivity);
});

// return api response
final flightScheduleRepositoryProvider = Provider<FlightScheduleRepository>((
  ref,
) {
  final networkService = ref.watch(flightNetworkServiceProvider);

  final remoteDataSource = ref.watch(
    flightRemoteDataSourceProvider(networkService),
  );

  final networkInfo = ref.watch(networkInfoProvider);
  return FlightScheduleRepositoryImpl(
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
});
