import 'package:app_api_george/src/models/mensaje_model.dart';
import 'package:app_api_george/src/providers/mensaje_providers.dart';
import 'package:app_api_george/src/utils/utils.dart' as utils;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
final formKey = GlobalKey<FormState>();
final mensajesProvider = new MensajesProvider();
MensajeModel miMensaje = new MensajeModel();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API_GEORGE THOPMSON',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text('API George Thompson'),
          ),
          body: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        _creaTexto(),
                        _creaFecha(),
                        _creaBoton(),
                      ],
                    ),
                  )))),
    );
  }

  Widget _creaTexto() {
    miMensaje.imagenUrl = "mi imagen";
    miMensaje.userId = "usuario general";
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      initialValue: miMensaje.mensaje,
      decoration: InputDecoration(
        labelText: "Mensaje",
      ),
      onSaved: (value) => miMensaje.mensaje = value,
      validator: (value) {
        if (value == '') {
          return 'debe ingresar un mensaje';
        } else {
          return null;
        }
      },
    );
  }

  Widget _creaFecha() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      initialValue: miMensaje.fechaCreacion,
      decoration: InputDecoration(
        labelText: "Fecha",
      ),
      onSaved: (value) => miMensaje.fechaCreacion = value,
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Debe ingresar una fecha valida';
        }
      },
    );
  }

  Widget _creaBoton() {
    return RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.green,
        textColor: Colors.white,
        onPressed: _submit,
        icon: Icon(Icons.send),
        label: Text('Enviar'));
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    print(miMensaje.mensaje);
    print(miMensaje.fechaCreacion);
    print(miMensaje.userId);
    print(miMensaje.imagenUrl);

    mensajesProvider.crearMensaje(miMensaje);
  }
}
