import 'dart:convert';

RecipeModel recipeModelFromJson(String str) => RecipeModel.fromJson(json.decode(str));

String recipeModelToJson(RecipeModel data) => json.encode(data.toJson());

class RecipeModel {
    String id;
    String nombreReceta;
    List<String> ingredientes;
    List<String> procedimiento;
    String foto;
    int porciones;
    int tiempo;
    double costo;
    double calificacion;
    List<String> categorias;
    String creador;

    RecipeModel({
        this.id,
        this.nombreReceta = '',
        this.ingredientes,
        this.procedimiento,
        this.foto,
        this.porciones = 0,
        this.tiempo = 0,
        this.costo = 0.0,
        this.calificacion,
        this.categorias,
        this.creador,
    });

    factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        id: json["id"],
        nombreReceta: json["nombre_receta"],
        ingredientes: List<String>.from(json["ingredientes"].map((x) => x)),
        procedimiento: List<String>.from(json["procedimiento"].map((x) => x)),
        foto: json["foto"],
        porciones: json["porciones"],
        tiempo: json["tiempo"],
        costo: json["costo"],
        calificacion: json["calificacion"].toDouble(),
        categorias: List<String>.from(json["categorias"].map((x) => x)),
        creador: json["creador"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre_receta": nombreReceta,
        "ingredientes": List<dynamic>.from(ingredientes.map((x) => x)),
        "procedimiento": List<dynamic>.from(procedimiento.map((x) => x)),
        "foto": foto,
        "porciones": porciones,
        "tiempo": tiempo,
        "costo": costo,
        "calificacion": calificacion,
        "categorias": List<dynamic>.from(categorias.map((x) => x)),
        "creador": creador,
    };
}