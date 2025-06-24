class CurrencyResponse {
  final Map<String, double> data;

  CurrencyResponse({required this.data});

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'] as Map<String, dynamic>? ?? {};
    final data = rawData.map(
      (key, value) => MapEntry(key, (value as num).toDouble()),
    );
    return CurrencyResponse(data: data);
  }
}
