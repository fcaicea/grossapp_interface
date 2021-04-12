import 'dart:convert';

import 'package:app_api_george/src/models/mensaje_model.dart';
import 'package:http/http.dart' as http;

class MensajesProvider {
  final String _url = "https://us-central1-grossapp-eb91c.cloudfunctions.net";

  Future<bool> crearMensaje(MensajeModel mensaje) async {
    final url = "$_url/posts";
    final resp = await http.post(url, body: mensaje.toJson());
    final decodeData = json.decode(resp.body);
    print(decodeData);
    //await 1 + 1;
    return true;
  }
}
