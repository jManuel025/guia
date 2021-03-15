import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:guiaestudiante/src/models/advices_model.dart';

class CreationPage extends StatefulWidget {
  @override
  _CreationPageState createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    dynamic coleccion = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(coleccion),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection(coleccion)
              .where('usuario_id', isEqualTo: prefs.uid)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) return Text('${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.data.documents.length == 0) {
                  return Center(
                      child: Text('No tienes ninguna creación',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)));
                } else {
                  return ListView(
                    children: snapshot.data.documents
                        .map<Widget>((DocumentSnapshot document) {
                      switch (coleccion) {
                        case 'consejos':
                          return Container(
                            child: _consejo(document, context),
                          );
                        case 'recetas':
                          return Container(
                              child: _receta(
                                  document['foto_url'],
                                  document['nombreReceta'],
                                  document['autor'],
                                  "$document",
                                  document));
                        case 'proyectos':
                          return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 3.5),
                              child: _proyecto(document, context));
                        default:
                          return Text('ERROR');
                      }
                    }).toList(),
                  );
                }
            }
          },
        ),
      ),
    );
  }

  Widget _consejo(DocumentSnapshot document, BuildContext context) {
    final dbRef = Firestore.instance.collection('consejos');
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
      child: Container(
        padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '"' + document['detalle'] + '"',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500),
            ),
            Divider(
              indent: 50.0,
              endIndent: 50.0,
              color: Colors.blueGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton.icon(
                  icon: Icon(Icons.delete),
                  label: Text('Borrar'),
                  onPressed: () => _delete(dbRef, document, context),
                ),
                TextButton.icon(
                  icon: Icon(Icons.edit),
                  label: Text('Editar'),
                  onPressed: () => _update(dbRef, document, context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _receta(String urlImage, String nombre, String autor, String heroID,
      dynamic document) {
    final dbRef = Firestore.instance.collection('recetas');
    return Dismissible(
      key: UniqueKey(),
      child: Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          TextButton.icon(
                            icon: Icon(Icons.delete),
                            label: Text('Borrar'),
                            onPressed: () => _delete(dbRef, document, context),
                          ),
                          TextButton.icon(
                            icon: Icon(Icons.edit),
                            label: Text('Editar'),
                            onPressed: () => Navigator.pushNamed(
                                context, 'recipe_update_form',
                                arguments: document),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // onPressed: () => Navigator.pushNamed(context, 'recipe_detail', arguments: document),
                onPressed: () {},
              ),
            ),
          )),
    );
  }

  Widget _proyecto(DocumentSnapshot document, BuildContext context) {
    final dbRef = Firestore.instance.collection('proyectos');
    return Card(
        child: TextButton(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(document['titulo'],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                (document['tipoRemuneracion'])
                    ? Icon(Icons.attach_money)
                    : Icon(Icons.money_off)
              ],
            ),
            Text(document['autor'],
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.blueGrey)),
            Row(
              children: <Widget>[
                Icon(Icons.access_time),
                SizedBox(
                  width: 5.0,
                ),
                Text("${document['duracion']} días")
              ],
            ),
            Divider(
              indent: 50.0,
              endIndent: 50.0,
              color: Colors.blueGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton.icon(
                  icon: Icon(Icons.delete),
                  label: Text('Borrar'),
                  onPressed: () => _delete(dbRef, document, context),
                ),
                TextButton.icon(
                  icon: Icon(Icons.edit),
                  label: Text('Editar'),
                  onPressed: () => _updateProject(document, context),
                ),
              ],
            ),
          ],
        ),
      ),
      onPressed: () =>
          Navigator.pushNamed(context, 'project_detail', arguments: document),
    ));
  }

  _delete(
      CollectionReference db, DocumentSnapshot document, BuildContext context) {
    String idElemento = document.documentID;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Eliminar',
              textAlign: TextAlign.center,
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('¿Estás seguro?'),
                Text('Esta acción no se puede deshacer.')
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                  child: Text('Aceptar'),
                  onPressed: () => {
                        db.document(idElemento).delete(),
                        Navigator.pop(context),
                        Toast.show("Eliminación exitosa", context,
                            duration: Toast.LENGTH_LONG,
                            gravity: Toast.BOTTOM,
                            backgroundColor: Colors.blue)
                      }),
            ],
          );
        });
  }

  _update(
      CollectionReference db, DocumentSnapshot document, BuildContext context) {
    String idElemento = document.documentID;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Editar consejo',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey)),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _detalle(document['detalle']),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _boton(
                          false, context, document['detalle'], db, idElemento),
                      _boton(
                          true, context, document['detalle'], db, idElemento),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  _updateProject(DocumentSnapshot document, BuildContext context) {
    Navigator.pushNamed(context, 'project_update_form', arguments: document);
  }

  String consejoDetalle = '';
  Widget _detalle(String detalle) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
      child: TextFormField(
        initialValue: detalle,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            labelText: 'Describe aqui tu consejo',
            border: OutlineInputBorder()),
        maxLines: 2,
        onSaved: (value) => consejoDetalle = value,
        validator: (value) {
          if (value.length < 15) {
            return 'Es necesaria una descripción mas larga';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _boton(bool crear, BuildContext context, String detalle,
      CollectionReference db, String idElemento) {
    return Container(
      child: ElevatedButton(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        // textColor: Colors.white,
        // color: Colors.blueAccent,
        child: (crear) ? Text('Aceptar') : Text('Cancelar'),
        onPressed: () {
          (crear) ? _submit(db, idElemento) : Navigator.pop(context);
        },
      ),
    );
  }

  void _submit(CollectionReference db, String idElemento) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      db.document(idElemento).updateData({'detalle': consejoDetalle});
    }
    Navigator.pop(context);
  }
}
