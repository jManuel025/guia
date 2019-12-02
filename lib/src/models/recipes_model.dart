import 'dart:convert';

RecipeModel recipeModelFromJson(String str) => RecipeModel.fromJson(json.decode(str));

String recipeModelToJson(RecipeModel data) => json.encode(data.toJson());

class RecipeModel {
    String id;
    String autor;
    String nombreReceta;
    String ingredientes;
    String procedimiento;
    int tiempo;
    String fotoUrl;
    double costo;
    int porciones;
    // Etiquetas etiquetas;
    double calificacion;
    bool aprobado;

    RecipeModel({
        this.id,
        this.autor = '',
        this.nombreReceta = '',
        this.ingredientes = '',
        this.procedimiento = '',
        this.tiempo = 60,
        this.fotoUrl = '',
        this.costo = 0.0,
        this.porciones = 1,
        // this.etiquetas,
        this.calificacion = 0.0,
        this.aprobado = false,
    });

    factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        id: json["id"],
        autor: json["autor"],
        nombreReceta: json["nombreReceta"],
        ingredientes: json["ingredientes"],
        procedimiento: json["procedimiento"],
        tiempo: json["tiempo_preparacion"],
        fotoUrl: json["foto_url"],
        costo: json["costo"],
        porciones: json["porciones"],
        // etiquetas: Etiquetas.fromJson(json["etiquetas"]),
        calificacion: json["calificacion"],
        aprobado: json["aprobado"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "autor": autor,
        "nombreReceta": nombreReceta,
        "ingredientes": ingredientes,
        "procedimiento": procedimiento,
        "tiempo_preparacion": tiempo,
        "foto_url": fotoUrl,
        "costo": costo,
        "porciones": porciones,
        // "etiquetas": etiquetas.toJson(),
        "calificacion": calificacion,
        "aprobado": aprobado,
    };
}

// class Etiquetas {
//     bool e1;
//     bool e2;
//     bool e3;

//     Etiquetas({
//         this.e1,
//         this.e2,
//         this.e3,
//     });

//     factory Etiquetas.fromJson(Map<String, dynamic> json) => Etiquetas(
//         e1: json["e1"],
//         e2: json["e2"],
//         e3: json["e3"],
//     );

//     Map<String, dynamic> toJson() => {
//         "e1": e1,
//         "e2": e2,
//         "e3": e3,
//     };
// }
