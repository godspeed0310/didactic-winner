// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$StoreService extends StoreService {
  _$StoreService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = StoreService;

  @override
  Future<Response<List<Product>>> getProducts({int limit = 20}) {
    final Uri $url = Uri.parse('products');
    final Map<String, dynamic> $params = <String, dynamic>{'limit': limit};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<Product>, Product>($request);
  }
}
