import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:guiaestudiante/src/utils/utils.dart' as utils;
import 'package:toast/toast.dart';

class RecipesUpdtForm extends StatefulWidget {
  @override
  _RecipesUpdtFormState createState() => _RecipesUpdtFormState();
}

class _RecipesUpdtFormState extends State<RecipesUpdtForm> {
  // final recipesProvider = new RecipesProvider();
  final formKey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  // RecipeModel recipe = RecipeModel();
  File foto;

  // bool saludable = false;
  // bool facil = false;
  // bool barato = false;
  // bool rapido = false;
  // bool inusual = false;

  

  List<String> _categorias = ['Categorías', 'Desayuno', 'Comida', 'Cena', 'Bebidas', 'Ensaladas', 'Postres'];
  String _slctdOpt = 'Categorías';

  @override
  Widget build(BuildContext context) {

    DocumentSnapshot recipeData = ModalRoute.of(context).settings.arguments;
    Map etiquetas = recipeData['etiquetas'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar receta'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  _showPhoto(recipeData),
                  // FOTOGRAFÍA photo_size_select_actual
                  // Container(
                  //   child: Table(
                  //     children: [
                  //       TableRow(
                  //         children: [
                  //           Container(
                  //             padding: EdgeInsets.symmetric(horizontal: 5.0),
                  //             child: _fotografiaSlc(),
                  //           ),
                  //           Container(
                  //             padding: EdgeInsets.symmetric(horizontal: 5.0),
                  //             child: _fotografiaCam(),
                  //           )
                  //         ]
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // NOMBRE DE RECETA
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: _nombreReceta(recipeData)
                  ),
                  // INGREDIENTES
                  Divider(height: 0.0, thickness: 1.0),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10.0),
                          width: double.infinity,
                          child: Text('Ingredientes', style: TextStyle(fontSize: 15)),
                        ),
                        _ingrediente(recipeData),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // _elemento('Ingrediente','remove'),
                              // _elemento('Ingrediente', 'add'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // PASOS
                  Divider(height: 0.0, thickness: 1.0),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10.0),
                          width: double.infinity,
                          child: Text('Procedimiento', style: TextStyle(fontSize: 15)),
                        ),
                        _procedimiento(recipeData),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // _elemento('Paso','remove'),
                              // _elemento('Paso', 'add'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // Divider(height: 0.0, thickness: 1.0),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        // Container(
                        //   padding: EdgeInsets.only(top: 10.0),
                        //   width: double.infinity,
                        //   child: Text('Selecciona una categoría', style: TextStyle(fontSize: 15)),
                        // ),
                        // _categoria(recipeData),
                        // Container(
                        //   padding: EdgeInsets.symmetric(vertical: 10.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: <Widget>[
                        //       // _elemento('Paso','remove'),
                        //       // _elemento('Paso', 'add'),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  // TIEMPO DE PREPARACION COSTO PORCIONES
                  Divider(height: 0.0, thickness: 1.0),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    width: double.infinity,
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            Column(
                              children: <Widget>[
                                // Text('Porciones', style: TextStyle(fontSize: 15.0)),
                                _porciones(recipeData),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                // Text('Tiempo', style: TextStyle(fontSize: 15.0)),
                                _tiempoPreparacion(recipeData),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                // Text('Costo', style: TextStyle(fontSize: 15.0)),
                                _costo(recipeData),
                              ],
                            ),
                          ]
                        )
                      ],
                    )
                  ),
                  // CATEGORIAS
                  Divider(thickness: 1.0),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          width: double.infinity,
                          child: Text('Marca las etiquetas que consideres adecuadas', style: TextStyle(fontSize: 15.0)),
                        ),
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 2.0,
                          children: <Widget>[
                            FilterChip(
                              label: Text('Saludable'),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                              selected: etiquetas['Saludable'],
                              backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                              onSelected: (valor){
                                setState(() {
                                  etiquetas['Saludable'] = valor;
                                });
                              },
                              selectedColor: Color.fromRGBO(24, 128, 192, .30),
                            ),
                            FilterChip(
                              label: Text('Fácil'),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                              selected: etiquetas['Fácil'],
                              backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                              onSelected: (valor){
                                setState(() {
                                  etiquetas['Fácil'] = valor;
                                });
                              },
                              selectedColor: Color.fromRGBO(24, 128, 192, .30),
                            ),
                            FilterChip(
                              label: Text('Barato'),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                              selected: etiquetas['Barato'],
                              backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                              onSelected: (valor){
                                setState(() {
                                  etiquetas['Barato'] = valor;
                                });
                              },
                              selectedColor: Color.fromRGBO(24, 128, 192, .30),
                            ),
                            FilterChip(
                              label: Text('Rápido'),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                              selected: etiquetas['Rápido'],
                              backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                              onSelected: (valor){
                                setState(() {
                                  etiquetas['Rápido'] = valor;
                                });
                              },
                              selectedColor: Color.fromRGBO(24, 128, 192, .30),
                            ),
                            FilterChip(
                              label: Text('Inusual'),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                              selected: etiquetas['Inusual'],
                              backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                              onSelected: (valor){
                                setState(() {
                                  etiquetas['Inusual'] = valor;
                                });
                              },
                              selectedColor: Color.fromRGBO(24, 128, 192, .30),
                            ),
                          ],
                        )
                      ],
                    )
                  ),
                  // BOTONES ACEPTAR - CANCELAR
                   Divider(height: 0.0, thickness: 1.0),
                  Table(
                    children: [
                      TableRow(
                        children: [
                          _btnCancel(),
                          _btnAccion(recipeData),
                        ]
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }

  // Widget _fotografiaSlc(){
  //   return RaisedButton.icon(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     textColor: Colors.white,
  //     color: Colors.blue,
  //     label: Text('Seleccionar'),
  //     icon: Icon(Icons.photo),
  //     onPressed: _selectPhoto,
  //   );
  // }
  // Widget _fotografiaCam(){
  //   return RaisedButton.icon(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     textColor: Colors.white,
  //     color: Colors.blue,
  //     label: Text('Tomar'),
  //     icon: Icon(Icons.camera_alt),
  //     onPressed: _takePhoto,
  //   );
  // }
    Widget _showPhoto(dynamic recipeData){
      if(recipeData['foto_url'] != null && recipeData['foto_url'] != ''){
        return Container();
      }
      else{
        return Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Image(
            image: AssetImage(foto?.path??'assets/no-image.png'),
            height: 250.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        );
      }
    }
    // _selectPhoto() async{
    //   foto = await ImagePicker.pickImage(
    //     source: ImageSource.gallery
    //   );
    //   if(foto != null){
    //     // hacer limpieza
    //   }
    //   setState(() {});
    // }
    // _takePhoto() async{
    //   foto = await ImagePicker.pickImage(
    //     source: ImageSource.camera
    //   );
    //   if(foto != null){
    //     // hacer limpieza
    //   }
    //   setState(() {});
    // }
  String nNombre;
  Widget _nombreReceta(DocumentSnapshot receta){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        initialValue: receta['nombreReceta'],
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          icon: Icon(Icons.fastfood),
          labelText: 'Nombre del platillo',
        ),
      onSaved: (value) => nNombre = value,
      validator: (value){
        if(value.length < 4){
          return 'Ingresa el nombre de la receta';
        }
        else{
          return null;
        }
      },
      ),
    );
  }
  String nIngrediente;
  Widget _ingrediente(DocumentSnapshot receta){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        initialValue: receta['ingredientes'],
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          icon: Icon(Icons.list),
          labelText: 'Ingresa los ingredientes separados por comas',
        ),
      onSaved: (value) => nIngrediente = value,
      validator: (value){
        if(value.length < 3){
          return 'Ingresa al menos un ingrediente';
        }
        else{
          return null;
        }
      },
      ),
    );
  }
  String nProcedimiento;
  Widget _procedimiento(DocumentSnapshot receta){
    return Container(
      child: TextFormField(
        initialValue: receta['procedimiento'],
        maxLines: 3,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          icon: Icon(Icons.description),
          labelText: 'Explica detalladamente el procedimiento',
          // border: OutlineInputBorder()
        ),
        onSaved: (value) => nProcedimiento = value,
        validator: (value){
        if(value.length < 10){
          return 'es ncesaria una descripción';
        }
        else{
          return null;
        }
      },
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpts(){
    List<DropdownMenuItem<String>> lista = new List();
    _categorias.forEach((categoria){
      lista.add(DropdownMenuItem(
        child: Text(categoria),
        value: categoria,
      ));
    });
    return lista;
  }
  // String nCat;
  // Widget _categoria(DocumentSnapshot receta){
  //   return DropdownButton(
  //     isExpanded: true,
  //     value: _slctdOpt,
  //     items: getOpts(),
  //     onChanged: (opt){
  //       setState(() {
  //         _slctdOpt = opt;
  //         nCat = _slctdOpt;
  //       });
  //     },
  //   );
  // }
  double nCosto;
  Widget _costo(DocumentSnapshot receta){
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: receta['costo'].toString(),
      decoration: InputDecoration(
        icon: Icon(Icons.attach_money),
        labelText: 'Costo',
      ),
      onSaved: (value) => nCosto = double.parse(value),
      validator: (value){
        if(utils.isNumber(value)){
          return null;
        }
        else{
          return 'Solo numeros';
        }
      },
    );
  }
  int nPorciones;
  Widget _porciones(DocumentSnapshot receta){
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: receta['porciones'].toString(),
      decoration: InputDecoration(
        icon: Icon(Icons.local_dining),
        labelText: 'Porciones',
      ),
      onSaved: (value) => nPorciones = int.parse(value),
      validator: (value){
        if(utils.isNumber(value)){
          return null;
        }
        else{
          return 'Solo numeros';
        }
      },
    );
  }
  int nTiempo;
  Widget _tiempoPreparacion(DocumentSnapshot receta){
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: receta['tiempo_preparacion'].toString(),
      decoration: InputDecoration(
        icon: Icon(Icons.timer),
        labelText: 'Minutos',
      ),
      onSaved: (value) => nTiempo = int.parse(value),
      validator: (value){
        if(utils.isNumber(value)){
          return null;
        }
        else{
          return 'Solo numeros';
        }
      },
    );
  }
  Widget _btnAccion(DocumentSnapshot receta){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textColor: Colors.white,
        color: Colors.blueAccent,
        child: Text('Aceptar'),
        onPressed: () => _submit(receta),
      ),
    );
  }
  Widget _btnCancel(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textColor: Colors.white,
        color: Colors.blueAccent,
        child: Text('Cancelar'),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  void _submit(DocumentSnapshot receta) async{
    Map etiquetas = receta['etiquetas'];
    // String nFoto;
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      // if(nFoto != null){
      //   nFoto = await uploadImage(foto);
      // }
      // recipesProvider.createRecipe(recipe);

      Map<String, bool> tags = {
        'Saludable': etiquetas['Saludable'],
        'Fácil': etiquetas['Fácil'],
        'Barato': etiquetas['Barato'],
        'Rápido': etiquetas['Rápido'],
        'Inusual': etiquetas['Inusual'],
      };
      Map<String, dynamic> datos = {
        "nombreReceta": nNombre,
        "ingredientes": nIngrediente,
        "procedimiento": nProcedimiento,
        "categoria": nPorciones,
        "tiempo_preparacion": nTiempo,
        // "foto_url": recipe.fotoUrl,
        "costo": nCosto,
        "porciones": nPorciones,
        "etiquetas": tags,
      };
      Firestore.instance.collection('recetas').document(receta.documentID).updateData(datos);
      Toast.show("Actualización exitosa", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.blue);
      Navigator.pop(context);
    }
  }
}