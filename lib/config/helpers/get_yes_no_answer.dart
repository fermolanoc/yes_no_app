import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    if (response.statusCode != 200) {
      throw Exception('Failed to get answer');
    }
    final data = YesNoModel.fromJsonMap(response.data);
    return Message(
        text: data.answer, imageUrl: data.image, sender: Sender.them);
  }
}
