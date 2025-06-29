import 'package:dartz/dartz.dart';
import 'package:travel_flutter/core/network/network_info.dart';
import 'package:travel_flutter/features/currency/data/datasource/currency_remote_date_source.dart';
import 'package:travel_flutter/features/currency/domain/repositories/currency_repository.dart';
import 'package:travel_flutter/shared/domain/models/currency_response.dart';
import 'package:travel_flutter/shared/exceptions/http_exception.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final String currencyApiKey;

  CurrencyRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.currencyApiKey,
  });

  @override
  Future<Either<AppException, CurrencyResponse>> getLatestCurrencies({
    String? baseCurrency,
    String? currencies,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteSchedules = await remoteDataSource.getLatestCurrencies(
          apiKey: currencyApiKey,
          baseCurrency: baseCurrency,
          currencies: currencies,
        );
        return remoteSchedules;
      } on AppException catch (e) {
        return Left(e);
      }
    } else {
      return Left(NoConnectionException('fetchCurrencies'));
    }
  }
}
