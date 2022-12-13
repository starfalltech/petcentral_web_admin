import 'package:chopper/chopper.dart';

import '../../common/base_url.dart';

part 'rest_client_service.chopper.dart';

@ChopperApi()
abstract class RestClientService extends ChopperService {
  @Post(path: 'auth/admin/signin')
  Future<Response> login(@Body() Map<String, dynamic> fields);

  @Post(path: 'admin/reservations/grooming')
  Future<Response> getReservationGrooming(@Body() Map<String, dynamic> fields);

  @Put(path: 'admin/reservation/grooming/update-status')
  Future<Response> updateReservationStatus(@Body() Map<String, dynamic> fields);

  @Post(path: 'admin/reservations/hotel')
  Future<Response> getReservationHotel(@Body() Map<String, dynamic> fields);

  @Put(path: 'admin/reservation/hotel/update-status')
  Future<Response> updateResHotelStatus(@Body() Map<String, dynamic> fields);

  static RestClientService create() {
    final client = ChopperClient(
      baseUrl: baseUrl,
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      services: [
        _$RestClientService(),
      ],
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$RestClientService(client);
  }
}
