import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infraestructure/yes_no_model.dart';

class GetYesNoAnswer {
  //Instancia de la clase Dio para manejar peticiones HTTP
  final _dio = Dio();

  Future<Message> getAswer() async {
    //Almacenar el resultado de la petición
    final response = await _dio.get('https://yesno.wtf/api');

    //Almacenar a data de la respuesta
    final yesNoModel = YesNoModel.fromJson(response.data);

    //Retornar la instancia de Mensage
    return yesNoModel.toMessageEntity();
  }
}
