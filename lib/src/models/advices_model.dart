import 'dart:convert';

import 'package:guiaestudiante/src/preferencias_usuario/preferencias_usuario.dart';

AdviceModel adviceModelFromJson(String str) => AdviceModel.fromJson(json.decode(str));
String adviceModelToJson(AdviceModel data) => json.encode(data.toJson());

final prefs = new PreferenciasUsuario();

class AdviceModel {
    String id;
    String usuario;
    String detalle;
    bool aprobado;

    AdviceModel({
        this.id,
        this.usuario = '',
        this.detalle = '',
        this.aprobado = false,
    });

    factory AdviceModel.fromJson(Map<String, dynamic> json) => AdviceModel(
        id: json["id"],
        usuario: json["usuario"],
        detalle: json["detalle"],
        aprobado: json["aprobado"],
    );

    Map<String, dynamic> toJson() => {
        // "id": id, se omite para que no se duplique al actualizar
        "usuario": usuario,
        "detalle": detalle,
        "aprobado": aprobado,
    };
}
