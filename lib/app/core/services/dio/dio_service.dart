import 'package:dio/dio.dart';
import 'i_dio_service.dart';

class DioService implements IDioService {
  final Dio dio;

  DioService(this.dio);
  @override
  Future<Map<String, dynamic>> getAdress(String cep) async {
    final response = await dio.get('https://viacep.com.br/ws/$cep/json/');
    return response.data;
  }
}
