import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/ui/common/api_endpoints.dart';
import 'package:echelon/ui/common/app_extensions.dart';

part 'store_service.chopper.dart';

@ChopperApi()
abstract class StoreService extends ChopperService {
  static StoreService create() {
    return _$StoreService(
      ChopperClient(
        baseUrl: APIEndpoints.baseUrl.toUri,
        converter: ProductConverter({
          Product: (json) => Product.fromJson(json),
        }),
        errorConverter: const JsonConverter(),
        interceptors: [
          HttpLoggingInterceptor(),
        ],
        services: [
          _$StoreService(),
        ],
      ),
    );
  }

  @Get(path: APIEndpoints.products)
  Future<Response<List<Product>>> getProducts({@Query('limit') int limit = 20});
}

class ProductConverter extends JsonConverter {
  final Map<Type, Function> typeToJsonFactoryMap;

  const ProductConverter(this.typeToJsonFactoryMap);

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return response.copyWith(
      body: fromJsonData<BodyType, InnerType>(
        response.body,
        typeToJsonFactoryMap[InnerType]!,
      ),
    );
  }

  T fromJsonData<T, InnerType>(String jsonData, Function jsonParser) {
    var jsonMap = json.decode(jsonData);
    if (jsonMap is List) {
      return jsonMap
          .map((product) =>
              jsonParser(product as Map<String, dynamic>) as InnerType)
          .toList() as T;
    }
    return jsonParser(jsonMap);
  }
}
