import 'package:http/http.dart' as http;
import 'package:travel_flutter/shared/data/remote/http_network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const currencyApiKey = String.fromEnvironment('FREE_CURRENCY_API_KEY');
final httpClientProvider = Provider<http.Client>((ref) => http.Client());

final flightNetworkServiceProvider = Provider<HttpNetworkService>((ref) {
  final client = ref.watch(httpClientProvider);
  return HttpNetworkService(client, baseUrl: 'https://www.kia.gov.tw/API');
});

final currencyNetworkServiceProvider = Provider<HttpNetworkService>((ref) {
  final client = ref.watch(httpClientProvider);
  return HttpNetworkService(client, baseUrl: 'https://api.freecurrencyapi.com');
});
