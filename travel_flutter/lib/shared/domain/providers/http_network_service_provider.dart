import 'package:http/http.dart' as http;
import 'package:travel_flutter/shared/data/remote/http_network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final httpClientProvider = Provider<http.Client>((ref) => http.Client());

final networkServiceProvider = Provider<HttpNetworkService>((ref) {
  final client = ref.watch(httpClientProvider);
  return HttpNetworkService(client, baseUrl: 'https://www.kia.gov.tw/API');
});
