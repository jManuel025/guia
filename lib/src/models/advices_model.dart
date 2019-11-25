// To parse this JSON data, do
//
//     final adviceModel = adviceModelFromJson(jsonString);

import 'dart:convert';

AdviceModel adviceModelFromJson(String str) => AdviceModel.fromJson(json.decode(str));

String adviceModelToJson(AdviceModel data) => json.encode(data.toJson());

class AdviceModel {
    String id;
    String usuario;
    String detalle;

    AdviceModel({
        this.id,
        this.usuario = 'default',
        this.detalle,
    });

    factory AdviceModel.fromJson(Map<String, dynamic> json) => AdviceModel(
        id: json["id"],
        usuario: json["usuario"],
        detalle: json["detalle"],
    );

    Map<String, dynamic> toJson() => {
        // comentar el id para que no se duplique en el registro
        // "id": id,
        "usuario": usuario,
        "detalle": detalle,
    };
}
