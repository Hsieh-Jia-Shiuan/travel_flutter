import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_flutter/features/currency/data/datasource/currency_remote_date_source.dart';
import 'package:travel_flutter/features/currency/data/repositories/currency_repository_impl.dart';
import 'package:travel_flutter/features/currency/domain/repositories/currency_repository.dart';
import 'package:travel_flutter/core/network/network_info.dart';
import 'package:travel_flutter/shared/data/remote/remote.dart';
import 'package:travel_flutter/shared/domain/providers/http_network_service_provider.dart';

// get Currency from api
final currencyRemoteDataSourceProvider =
    Provider.family<CurrencyRemoteDataSource, NetworkService>(
      (_, networkService) =>
          CurrencyRemoteDataSourceImpl(networkService: networkService),
    );

// check connection
final connectivityProvider = Provider<Connectivity>((ref) => Connectivity());

// network
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  final connectivity = ref.watch(connectivityProvider);
  return NetworkInfoImpl(connectivity);
});

// return api response
final currencyRepositoryProvider = Provider<CurrencyRepository>((ref) {
  final networkService = ref.watch(currencyNetworkServiceProvider);

  final remoteDataSource = ref.watch(
    currencyRemoteDataSourceProvider(networkService),
  );

  final networkInfo = ref.watch(networkInfoProvider);
  return CurrencyRepositoryImpl(
    currencyApiKey: currencyApiKey,
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
});
