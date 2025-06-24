import 'package:dartz/dartz.dart';
import 'package:travel_flutter/shared/domain/models/currency_response.dart';
import 'package:travel_flutter/shared/exceptions/http_exception.dart';

abstract class CurrencyRepository {
  Future<Either<AppException, CurrencyResponse>> getLatestCurrencies({
    required String apiKey,
    String? baseCurrency,
    String? currencies,
  });
}
