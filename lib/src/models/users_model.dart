import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String id;
    String nombre;
    String correo;
    // String password;
    String fechaNacimiento;
    String correoAlt;
    String expediente;
    String universidad;
    String carrera;
    bool sexo;
    // Habilidades habilidades;
    // Intereses intereses;
    bool tipoUsuario;

    UserModel({
        this.id,
        this.nombre = '',
        this.correo = '',
        // this.password = '',
        this.fechaNacimiento = '',
        this.correoAlt = '',
        this.expediente = '',
        this.universidad = '',
        this.carrera = '',
        this.sexo = false,
        // this.habilidades = '',
        // this.intereses = '',
        this.tipoUsuario = false,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        nombre: json["nombre"],
        correo: json["correo"],
        // password: json["password"],
        fechaNacimiento: json["fechaNacimiento"],
        correoAlt: json["correoAlt"],
        expediente: json["expediente"],
        universidad: json["universidad"],
        carrera: json["carrera"],
        sexo: json["sexo"],
        // habilidades: Habilidades.fromJson(json["habilidades"]),
        // intereses: Intereses.fromJson(json["intereses"]),
        tipoUsuario: json["tipoUsuario"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "correo": correo,
        // "password": password,
        "fechaNacimiento": fechaNacimiento,
        "correoAlt": correoAlt,
        "expediente": expediente,
        "universidad": universidad,
        "carrera": carrera,
        "sexo": sexo,
        // "habilidades": habilidades.toJson(),
        // "intereses": intereses.toJson(),
        "tipoUsuario": tipoUsuario,
    };
}

// class Habilidades {
//     bool creatividad;
//     bool liderazgo;
//     bool empatia;
//     bool comunicacion;
//     bool iniciativa;
//     bool pensamientoCritico;

//     Habilidades({
//         this.creatividad,
//         this.liderazgo,
//         this.empatia,
//         this.comunicacion,
//         this.iniciativa,
//         this.pensamientoCritico,
//     });

//     factory Habilidades.fromJson(Map<String, dynamic> json) => Habilidades(
//         creatividad: json["creatividad"],
//         liderazgo: json["liderazgo"],
//         empatia: json["empatia"],
//         comunicacion: json["comunicacion"],
//         iniciativa: json["iniciativa"],
//         pensamientoCritico: json["pensamientoCritico"],
//     );

//     Map<String, dynamic> toJson() => {
//         "creatividad": creatividad,
//         "liderazgo": liderazgo,
//         "empatia": empatia,
//         "comunicacion": comunicacion,
//         "iniciativa": iniciativa,
//         "pensamientoCritico": pensamientoCritico,
//     };
// }

// class Intereses {
//     bool artes;
//     bool historia;
//     bool gastronomia;
//     bool tecnologia;
//     bool psicologia;
//     bool turismo;

//     Intereses({
//         this.artes,
//         this.historia,
//         this.gastronomia,
//         this.tecnologia,
//         this.psicologia,
//         this.turismo,
//     });

//     factory Intereses.fromJson(Map<String, dynamic> json) => Intereses(
//         artes: json["artes"],
//         historia: json["historia"],
//         gastronomia: json["gastronomia"],
//         tecnologia: json["tecnologia"],
//         psicologia: json["psicologia"],
//         turismo: json["turismo"],
//     );

//     Map<String, dynamic> toJson() => {
//         "artes": artes,
//         "historia": historia,
//         "gastronomia": gastronomia,
//         "tecnologia": tecnologia,
//         "psicologia": psicologia,
//         "turismo": turismo,
//     };
// }
