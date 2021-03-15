import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipesListPage extends StatefulWidget {
  @override
  _RecipesListPageState createState() => _RecipesListPageState();
}

class _RecipesListPageState extends State<RecipesListPage> {
  @override
  Widget build(BuildContext context) {
    dynamic categoria = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(categoria),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context)),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('recetas')
                .where('categoria', isEqualTo: categoria)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) return Text('${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  return ListView(
                    children: snapshot.data.documents
                        .map<Widget>((DocumentSnapshot document) {
                      return Container(
                        child: _cardReceta(
                            document['foto_url'],
                            document['nombreReceta'],
                            document['autor'],
                            document.documentID,
                            document),
                      );
                    }).toList(),
                  );
              }
            }),
      ),
    );
  }

  Widget _cardReceta(String urlImage, String nombre, String autor,
      String heroID, dynamic document) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                  offset: Offset(1.0, 3.0))
            ]),
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Hero(
          tag: heroID, //receta.id
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: TextButton(
              // padding: EdgeInsets.all(0.0),
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
                            Text(nombre,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.5)),
                            Text(
                              autor,
                              style: TextStyle(color: Colors.blueGrey),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              onPressed: () => Navigator.pushNamed(context, 'recipe_detail',
                  arguments: document),
            ),
          ),
        ));
  }
}
