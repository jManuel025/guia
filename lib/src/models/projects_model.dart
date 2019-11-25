// To parse this JSON data, do
//
//     final projectModel = projectModelFromJson(jsonString);

import 'dart:convert';

ProjectModel projectModelFromJson(String str) => ProjectModel.fromJson(json.decode(str));

String projectModelToJson(ProjectModel data) => json.encode(data.toJson());

class ProjectModel {
    int id;
    String autor;
    String titulo;
    String descripcion;
    String contacto;
    bool tipoRemuneracion;
    int duracion;
    String fechaCreacion;

    ProjectModel({
        this.id,
        this.autor,
        this.titulo,
        this.descripcion,
        this.contacto,
        this.tipoRemuneracion = true,
        this.duracion,
        this.fechaCreacion,
    });

    factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: json["id"],
        autor: json["autor"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        contacto: json["contacto"],
        tipoRemuneracion: json["tipo_remuneracion"],
        duracion: json["duracion"],
        fechaCreacion: json["fecha_creacion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "autor": autor,
        "titulo": titulo,
        "descripcion": descripcion,
        "contacto": contacto,
        "tipo_remuneracion": tipoRemuneracion,
        "duracion": duracion,
        "fecha_creacion": fechaCreacion,
    };
}
