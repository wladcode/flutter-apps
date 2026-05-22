import 'package:dio/dio.dart';
import 'package:hello_world_app/domain/entities/message.dart';
import 'package:hello_world_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://yes-no-wtf.vercel.app/api'));

  Future<Message> getAnswer() async {
    final response = await _dio.get('/');
    final yesNoModel = YesNoModel.fromJson(response.data);
    return yesNoModel.toMessageEntity();
  }
}