import 'dart:convert';

ProjectModel projectModelFromJson(String str) => ProjectModel.fromJson(json.decode(str));

String projectModelToJson(ProjectModel data) => json.encode(data.toJson());

class ProjectModel {
    String id;
    String autor;
    String titulo;
    String descripcion;
    String contacto;
    bool tipoRemuneracion;
    int duracion;
    // PuestosSolicitados puestosSolicitados;
    String fechaCreacion;

    ProjectModel({
        this.id,
        this.autor = '',
        this.titulo = '',
        this.descripcion = '',
        this.contacto = '',
        this.tipoRemuneracion = true,
        this.duracion = 0,
        // this.puestosSolicitados,
        this.fechaCreacion = '',
    });

    factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: json["id"],
        autor: json["autor"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        contacto: json["contacto"],
        tipoRemuneracion: json["tipo_remuneracion"],
        duracion: json["duracion"],
        // puestosSolicitados: PuestosSolicitados.fromJson(json["puestos_solicitados"]),
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
        // "puestos_solicitados": puestosSolicitados.toJson(),
        "fecha_creacion": fechaCreacion,
    };
}

// class PuestosSolicitados {
//     bool puesto1;
//     bool puesto2;

//     PuestosSolicitados({
//         this.puesto1 = false,
//         this.puesto2 = false,
//     });

//     factory PuestosSolicitados.fromJson(Map<String, dynamic> json) => PuestosSolicitados(
//         puesto1: json["puesto1"],
//         puesto2: json["puesto2"],
//     );

//     Map<String, dynamic> toJson() => {
//         "puesto1": puesto1,
//         "puesto2": puesto2,
//     };
// }
