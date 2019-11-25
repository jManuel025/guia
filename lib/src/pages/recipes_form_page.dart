import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/models/recipes_model.dart';
import 'package:guiaestudiante/src/providers/recipe_provider.dart';
import 'package:guiaestudiante/src/utils/icon_string_util.dart';
import 'package:guiaestudiante/src/utils/utils.dart' as utils;

class RecipesFormPage extends StatefulWidget {
  @override
  _RecipesFormPageState createState() => _RecipesFormPageState();
}

class _RecipesFormPageState extends State<RecipesFormPage> {
  final recipesProvider = new RecipesProvider();
  final formKey = GlobalKey<FormState>();
  RecipeModel recipe = RecipeModel();

  @override
  Widget build(BuildContext context) {
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
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    width: double.infinity,
                    child: Text('Nueva Receta', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                  ),
                  // FOTOGRAFÍA photo_size_select_actual
                  Container(
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: _fotografia('Seleccionar foto' ,'photo_size_select_actual'),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: _fotografia('Tomar foto' ,'photo_camera'),
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
                              _elemento('Ingrediente','remove'),
                              _elemento('Ingrediente', 'add'),
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
                              _elemento('Paso','remove'),
                              _elemento('Paso', 'add'),
                            ],
                          ),
                        )
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
                          child: Text('Selecciona las categorías a las que pertenece', style: TextStyle(fontSize: 15.0)),
                        ),
                        Table(
                          children: [
                            TableRow(
                              children: [
                                _categoria(),
                                _categoria(),
                                _categoria(),
                              ]
                            ),
                            TableRow(
                              children: [
                                _categoria(),
                                _categoria(),
                                _categoria(),
                              ]
                            ),
                            TableRow(
                              children: [
                                _categoria(),
                                _categoria(),
                                _categoria(),
                              ]
                            ),
                            TableRow(
                              children: [
                                _categoria(),
                                _categoria(),
                                _categoria(),
                              ]
                            ),
                          ],
                        ),
                      ],
                    )
                  ),
                  // BOTONES ACEPTAR - CANCELAR
                   Divider(height: 0.0, thickness: 1.0),
                  Table(
                    children: [
                      TableRow(
                        children: [
                          _btnAccion('Cancelar'),
                          _btnAccion('Publicar'),
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

  Widget _fotografia(String texto, String icono){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      textColor: Colors.white,
      color: Colors.blue,
      label: Text(texto),
      icon: getIcon(icono),
      onPressed:(){},
    );
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
          labelText: 'Cantidad y nombre del ingrediente',
        ),
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
          labelText: 'Describe aqui un paso',
        ),
        validator: (value){
        if(value.length < 10){
          return 'Describe brevemente el paso';
        }
        else{
          return null;
        }
      },
      ),
    );
  }

    Widget _elemento(String elemento, String icono){
      return RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        textColor: Colors.white,
        color: Colors.blue,
        label: Text(elemento),
        icon: getIcon(icono),
        onPressed:() => _ingrediente(),
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
        labelText: 'Tiempo (min)',
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

  Widget _categoria(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: Colors.blue,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        child: Text('Categoria 1'),
        onPressed: (){},
      ),
    );
  }

  Widget _btnAccion(String texto){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textColor: Colors.white,
        color: Colors.blueAccent,
        child: Text(texto),
        onPressed: _submit,
      ),
    );
  }

  void _submit(){
    if(formKey.currentState.validate()){
      // Dispara los onsave
      formKey.currentState.save();
      print(recipe.nombreReceta);
      print(recipe.costo);
      recipesProvider.createRecipe(recipe);
    }
  }
}