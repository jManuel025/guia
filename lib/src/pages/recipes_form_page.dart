import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/models/advices_model.dart';
import 'package:guiaestudiante/src/models/recipes_model.dart';
import 'package:guiaestudiante/src/providers/recipe_provider.dart';
import 'package:guiaestudiante/src/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class RecipesFormPage extends StatefulWidget {
  @override
  _RecipesFormPageState createState() => _RecipesFormPageState();
}

class _RecipesFormPageState extends State<RecipesFormPage> {
  final recipesProvider = new RecipesProvider();
  final formKey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  RecipeModel recipe = RecipeModel();
  File foto;

  bool saludable = false;
  bool facil = false;
  bool barato = false;
  bool rapido = false;
  bool inusual = false;

  

  List<String> _categorias = ['Desayuno', 'Comida', 'Cena', 'Bebidas', 'Ensaladas', 'Postres'];
  String _slctdOpt = 'Desayuno';

  @override
  Widget build(BuildContext context) {

    final RecipeModel recipeData = ModalRoute.of(context).settings.arguments;
    if(recipeData != null){
      recipe = recipeData;
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 30.0, bottom: 15.0),
                    width: double.infinity,
                    child: Text('Nueva Receta', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                  ),
                  _showPhoto(),
                  // FOTOGRAFÍA photo_size_select_actual
                  Container(
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: _fotografiaSlc(),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: _fotografiaCam(),
                            )
                          ]
                        ),
                      ],
                    ),
                  ),
                  // NOMBRE DE RECETA
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: _nombreReceta()
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
                        _ingrediente(),
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
                        _procedimiento(),
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
                  Divider(height: 0.0, thickness: 1.0),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10.0),
                          width: double.infinity,
                          child: Text('Selecciona una categoría', style: TextStyle(fontSize: 15)),
                        ),
                        _categoria(),
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
                                _porciones(),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                // Text('Tiempo', style: TextStyle(fontSize: 15.0)),
                                _tiempoPreparacion(),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                // Text('Costo', style: TextStyle(fontSize: 15.0)),
                                _costo(),
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
                              selected: saludable,
                              backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                              onSelected: (valor){
                                setState(() {
                                  saludable = valor;
                                });
                              },
                              selectedColor: Color.fromRGBO(24, 128, 192, .30),
                            ),
                            FilterChip(
                              label: Text('Fácil'),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                              selected: facil,
                              backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                              onSelected: (valor){
                                setState(() {
                                  facil = valor;
                                });
                              },
                              selectedColor: Color.fromRGBO(24, 128, 192, .30),
                            ),
                            FilterChip(
                              label: Text('Barato'),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                              selected: barato,
                              backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                              onSelected: (valor){
                                setState(() {
                                  barato = valor;
                                });
                              },
                              selectedColor: Color.fromRGBO(24, 128, 192, .30),
                            ),
                            FilterChip(
                              label: Text('Rápido'),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                              selected: rapido,
                              backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                              onSelected: (valor){
                                setState(() {
                                  rapido = valor;
                                });
                              },
                              selectedColor: Color.fromRGBO(24, 128, 192, .30),
                            ),
                            FilterChip(
                              label: Text('Inusual'),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                              selected: inusual,
                              backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                              onSelected: (valor){
                                setState(() {
                                  inusual = valor;
                                });
                              },
                              selectedColor: Color.fromRGBO(24, 128, 192, .30),
                            ),
                            // _chipEtiqueta('Saludable', saludable),
                            // _chipEtiqueta('Fácil', facil),
                            // _chipEtiqueta('Barato', barato),
                            // _chipEtiqueta('Rápido', rapido),
                            // _chipEtiqueta('Inusual', inusual),
                            // chipEtiquetas(chipName: 'Saludable'),
                            // chipEtiquetas(chipName: 'Fácil'),
                            // chipEtiquetas(chipName: 'Barato'),
                            // chipEtiquetas(chipName: 'Rápido'),
                            // chipEtiquetas(chipName: 'Inusual'),
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
                          _btnAccion(),
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


  // Widget _chipEtiqueta(String etiqueta, bool value){
  //   return FilterChip(
  //     label: Text(etiqueta),
  //     labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
  //     selected: value,
  //     backgroundColor: Color.fromRGBO(24, 128, 192, .30),
  //     onSelected: (valor){
  //       setState(() {
  //         value = valor;
  //       });
  //     },
  //     selectedColor: Color.fromRGBO(24, 128, 192, .30),
  //   );
  // }

  Widget _fotografiaSlc(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      textColor: Colors.white,
      color: Colors.blue,
      label: Text('Seleccionar'),
      icon: Icon(Icons.photo),
      onPressed: _selectPhoto,
    );
  }
  Widget _fotografiaCam(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      textColor: Colors.white,
      color: Colors.blue,
      label: Text('Tomar'),
      icon: Icon(Icons.camera_alt),
      onPressed: _takePhoto,
    );
  }
    Widget _showPhoto(){
      if(recipe.fotoUrl != null && recipe.fotoUrl != ''){
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
    _selectPhoto() async{
      foto = await ImagePicker.pickImage(
        source: ImageSource.gallery
      );
      if(foto != null){
        // hacer limpieza
      }
      setState(() {});
    }
    _takePhoto() async{
      foto = await ImagePicker.pickImage(
        source: ImageSource.camera
      );
      if(foto != null){
        // hacer limpieza
      }
      setState(() {});
    }
  Widget _nombreReceta(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        initialValue: recipe.nombreReceta,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          icon: Icon(Icons.fastfood),
          labelText: 'Nombre del platillo',
        ),
      onSaved: (value) => recipe.nombreReceta = value,
      validator: (value){
        if(value.length < 5){
          return 'Ingresa el nombre de la receta';
        }
        else{
          return null;
        }
      },
      ),
    );
  }
  Widget _ingrediente(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          icon: Icon(Icons.list),
          labelText: 'Ingresa los ingredientes separados por comas',
        ),
      onSaved: (value) => recipe.ingredientes = value,
      validator: (value){
        if(value.length < 5){
          return 'Ingresa al menos un ingrediente';
        }
        else{
          return null;
        }
      },
      ),
    );
  }
  Widget _procedimiento(){
    return Container(
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          icon: Icon(Icons.description),
          labelText: 'Explica detalladamente el procedimiento',
        ),
        onSaved: (value) => recipe.procedimiento = value,
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
  Widget _categoria(){
    return DropdownButton(
      isExpanded: true,
      value: _slctdOpt,
      items: getOpts(),
      onChanged: (opt){
        setState(() {
          _slctdOpt = opt;
          recipe.categoria = _slctdOpt;
        });
      },
    );
  }

  Widget _costo(){
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: recipe.costo.toString(),
      decoration: InputDecoration(
        icon: Icon(Icons.attach_money),
        labelText: 'Costo',
      ),
      onSaved: (value) => recipe.costo = double.parse(value),
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
  Widget _porciones(){
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: recipe.porciones.toString(),
      decoration: InputDecoration(
        icon: Icon(Icons.local_dining),
        labelText: 'Porciones',
      ),
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
  Widget _tiempoPreparacion(){
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: recipe.tiempo.toString(),
      decoration: InputDecoration(
        icon: Icon(Icons.timer),
        labelText: 'Minutos',
      ),
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
  Widget _btnAccion(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textColor: Colors.white,
        color: Colors.blueAccent,
        child: Text('Aceptar'),
        onPressed: _submit,
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

  void _submit() async{
    
    if(formKey.currentState.validate()){
      // Dispara los onsave
      formKey.currentState.save();
      if(foto != null){
        recipe.fotoUrl = await recipesProvider.uploadImage(foto);
      }
      recipesProvider.createRecipe(recipe);

      Map<String, bool> etiquetas = {
        'Saludable': saludable,
        'Fácil': facil,
        'Barato': barato,
        'Rápido': rapido,
        'Inusual': inusual,
      };

      Map<String, dynamic> datos = {
        "autor": prefs.name,
        "nombreReceta": recipe.nombreReceta,
        "ingredientes": recipe.ingredientes,
        "procedimiento": recipe.procedimiento,
        "categoria": recipe.categoria,
        "tiempo_preparacion": recipe.tiempo,
        "foto_url": recipe.fotoUrl,
        "costo": recipe.costo,
        "porciones": recipe.porciones,
        "etiquetas": etiquetas,
        "calificacion": recipe.calificacion,
      };
      Firestore.instance.collection('recetas').add(datos);
      // final recetas = await Firestore.instance.collection('recetas').getDocuments();
      // print(recetas);
      Navigator.pop(context);
    }
  }
}

class chipEtiquetas extends StatefulWidget {
  final String chipName;
  chipEtiquetas({Key key, this.chipName}) : super(key:key);
  @override
  _chipEtiquetasState createState() => _chipEtiquetasState();
}

class _chipEtiquetasState extends State<chipEtiquetas> {
  var _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
      selected: _isSelected,
      backgroundColor: Color.fromRGBO(24, 128, 192, .30),
      onSelected: (valor){
        setState(() {
          _isSelected = valor;
        });
      },
      selectedColor: Color.fromRGBO(24, 128, 192, .30),
    );
  }
}