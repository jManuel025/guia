import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/providers/recipe_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipesListPage extends StatefulWidget {
  @override
  _RecipesListPageState createState() => _RecipesListPageState();
}

class _RecipesListPageState extends State<RecipesListPage> {
  // bool recipesFlag = false;
  // var recipes;

  // @override
  // void initState(){
  //   super.initState();
  //   RecipeService()
  //   .getRecipes('Desayuno')
  //   .then((QuerySnapshot docs){
  //     if(docs.documents.isNotEmpty){
  //       recipesFlag = true;
  //       recipes = docs.documents[0].data;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desayunos'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _cardReceta('https://image.freepik.com/foto-gratis/detalle-tortilla-huevo-desayuno_1232-4474.jpg', 'Huevo duro con pan de centeno', 'Manuel Castillo', '1'),
            _cardReceta('https://estaticos.miarevista.es/media/cache/1140x_thumb/uploads/images/gallery/59e727615bafe8398bddb88d/desayunossanos-int.jpg', 'Yogur natural con frutos rojos', 'Alberto Lemus', '2'),
            _cardReceta('http://www.cubahora.cu/uploads/imagen/2018/03/27/desayunar-huevo.jpg', 'Huevo revuelto', 'Cynthia Ramirez', '3'),
            _cardReceta('https://www.clara.es/medio/2018/02/06/desayunos-saludables11_4a84c0b5_600x900.jpg', 'Omelette de jamón y tocino', 'Pedro Pablo', '4'),
          ],
        ),
      )
    );
  }
    Widget _cardReceta(String urlImage, String nombre, String autor, String heroID){
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: Offset(1.0, 3.0)
            )
          ]
        ),
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Hero(
          tag: heroID, //receta.id
          child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image(
                    image: NetworkImage(urlImage),
                    width: double.infinity,
                    height: 175.0,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(nombre, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5)),
                        Text(autor, style: TextStyle(color: Colors.blueGrey),)
                      ],
                    )
                  ),
                ],
              ),
            ),
          ),
        )
      );
    }

  // Widget _listado(){
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: Firestore.instance.collection('recetas').getDocuments().then(QuerySnapshot snapshot).snapshots(),
  //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //       if (snapshot.hasError)
  //         return Text('Error: ${snapshot.error}');
  //       switch (snapshot.connectionState) {
  //         case ConnectionState.waiting: return Text('Loading...');
  //         default:
  //           return ListView(
  //             children: snapshot.data.documents.map((DocumentSnapshot document) {
  //               return ListTile(
  //                 title: Text(document['nombre']),
  //                 subtitle: Text(document['categoria']),
  //               );
  //             }).toList(),
  //           );
  //       }
  //     },
  //   );
  // }
}

