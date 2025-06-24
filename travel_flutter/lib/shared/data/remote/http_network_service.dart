import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_flutter/shared/data/remote/network_service.dart';
import 'package:travel_flutter/shared/domain/models/either.dart';
import 'package:travel_flutter/shared/domain/models/response.dart' as response;
import 'package:travel_flutter/shared/exceptions/http_exception.dart';

class HttpNetworkService extends NetworkService {
  final http.Client client;
  final String _baseUrl;
  Map<String, Object> _headers = {'Content-Type': 'application/json'};

  HttpNetworkService(this.client, {required String baseUrl})
    : _baseUrl = baseUrl;

  @override
  String get baseUrl => _baseUrl;

  @override
  Map<String, Object> get headers => _headers;

  @override
  void updateHeader(Map<String, dynamic> data) {
    _headers = {..._headers, ...data};
  }

  @override
  Future<Either<AppException, response.Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final uri = Uri.parse(
        '$baseUrl$endpoint',
      ).replace(queryParameters: queryParameters);
      final res = await client.get(
        uri,
        headers: headers.map((k, v) => MapEntry(k, v.toString())),
      );
      return Right(
        response.Response(
          statusCode: res.statusCode,
          statusMessage: res.reasonPhrase,
          data: json.decode(res.body),
        ),
      );
    } catch (e) {
      return Left(
        AppException(
          message: e.toString(),
          statusCode: 0,
          identifier: endpoint,
        ),
      );
    }
  }

  @override
  Future<Either<AppException, response.Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final res = await client.post(
        uri,
        headers: headers.map((k, v) => MapEntry(k, v.toString())),
        body: json.encode(data),
      );
      return Right(
        response.Response(
          statusCode: res.statusCode,
          statusMessage: res.reasonPhrase,
          data: json.decode(res.body),
        ),
      );
    } catch (e) {
      return Left(
        AppException(
          message: e.toString(),
          statusCode: 0,
          identifier: endpoint,
        ),
      );
    }
  }
}
