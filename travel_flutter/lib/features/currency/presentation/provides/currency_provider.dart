import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_flutter/features/currency/domain/provides/currency_providers.dart';
import 'package:travel_flutter/shared/domain/models/currency_response.dart';

part 'currency_provider.g.dart';

@Riverpod(keepAlive: false)
class CurrencyScheduleNotifier extends _$CurrencyScheduleNotifier {
  @override
  Future<CurrencyResponse> build({
    String? baseCurrency,
    String? currencies,
  }) async {
    final repository = ref.watch(currencyRepositoryProvider);
    final result = await repository.getLatestCurrencies(
      baseCurrency: baseCurrency,
      currencies: currencies,
    );
    return result.fold((l) => throw l, (r) => r);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
