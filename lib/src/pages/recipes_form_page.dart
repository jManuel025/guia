import 'package:flutter/material.dart';

class RecipesFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario agregar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              children: <Widget>[
                _nombreReceta(),
                // _ingredientes(),
                // _cantidad(),
                // _tiempoPreparacion(),
                // _fotografia(),
                // _costo(),
                _porciones(),
                // _procedimiento(),
                // _categoria()
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget _nombreReceta(){
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre del platillo'
      ),
    );
  }
  // Widget _ingredientes(){
    
  // }
  // Widget _cantidad(){
    
  // }
  // Widget _tiempoPreparacion(){
    
  // }
  // Widget _fotografia(){
    
  // }
  // Widget _costo(){
    
  // }
  Widget _porciones(){
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Porciones'
      ),
    );
  }
  // Widget _procedimiento(){
    
  // }
  // Widget _categoria(){
    
  // }

}