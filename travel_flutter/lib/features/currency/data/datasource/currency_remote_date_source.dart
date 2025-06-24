import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_flutter/shared/data/remote/remote.dart';
import 'package:travel_flutter/shared/domain/models/currency_response.dart';
import 'package:travel_flutter/shared/exceptions/http_exception.dart';
import 'package:travel_flutter/shared/domain/providers/http_network_service_provider.dart';

abstract class CurrencyRemoteDataSource {
  Future<Either<AppException, CurrencyResponse>> getLatestCurrencies({
    required String apiKey,
    String? baseCurrency,
    String? currencies,
  });
}

class CurrencyRemoteDataSourceImpl implements CurrencyRemoteDataSource {
  final NetworkService networkService;

  CurrencyRemoteDataSourceImpl({required this.networkService});

  @override
  Future<Either<AppException, CurrencyResponse>> getLatestCurrencies({
    required String apiKey,
    String? baseCurrency,
    String? currencies,
  }) async {
    try {
      final response = await networkService.get(
        '/v1/latest',
        queryParameters: {
          'apikey': apiKey,
          if (baseCurrency != null) 'base_currency': baseCurrency,
          if (currencies != null) 'currencies': currencies,
        },
      );

      return response.fold((error) => Left(error), (response) {
        if (response.statusCode == 200) {
          final dynamic data = response.data;
          final Map<String, dynamic> jsonResponse = data is String
              ? json.decode(data)
              : data as Map<String, dynamic>;
          return Right(CurrencyResponse.fromJson(jsonResponse));
        } else {
          return Left(
            ServerException(response.statusCode, 'fetchLatestCurrencies'),
          );
        }
      });
    } catch (e) {
      return Left(
        AppException(
          message: e.toString(),
          statusCode: 0,
          identifier: 'fetchLatestCurrencies',
        ),
      );
    }
  }
}

final currencyRemoteDataSourceProvider = Provider<CurrencyRemoteDataSource>(
  (ref) => CurrencyRemoteDataSourceImpl(
    networkService: ref.watch(currencyNetworkServiceProvider),
  ),
);
