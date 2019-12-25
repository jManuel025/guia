import 'package:flutter/material.dart';

class ProjectDetailPage extends StatefulWidget {
  @override
  _ProjectDetailPageState createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  @override
  Widget build(BuildContext context) {
    
    dynamic proyecto = ModalRoute.of(context).settings.arguments;
    // Map areas = proyecto['areas'].cast<String, dynamic>();
    Map areas = proyecto['areas'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Información'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context)),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Card(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(proyecto['titulo'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                SizedBox(height: 40.0),
                Text('Descripción', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5)),
                Text(proyecto['descripcion'], textAlign: TextAlign.justify,),
                Divider(height: 25.0),
                Text('Contactar a:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5)),
                Text(proyecto['autor']),
                Text(proyecto['contacto']),
                Divider(height: 25.0),
                Text('Duración aproximada', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5)),
                Text("${proyecto['duracion']} días"),
                Divider(height: 25.0),
                Text('Tipo de remuneración', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5)),
                (proyecto['tipoRemuneracion']) ? Text('Económica') : Text('Desarrollo personal'), 
                Divider(height: 25.0),
                Text('Areas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5)),
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  spacing: 5.0,
                  children: <Widget>[
                    Chip(
                      label: Text('Artes', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      backgroundColor: (areas['Artes']) ? Colors.blue : Colors.grey,
                    ),
                    Chip(
                      label: Text('Ciencias sociales', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      backgroundColor: (areas['Ciencias sociales']) ? Colors.blue : Colors.grey,
                    ),
                    Chip(
                      label: Text('Humanidades', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      backgroundColor: (areas['Humanidades']) ? Colors.blue : Colors.grey,
                    ),
                    Chip(
                      label: Text('Ingeniería', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      backgroundColor: (areas['Ingeniería']) ? Colors.blue : Colors.grey,
                    ),
                    Chip(
                      label: Text('Tecnología', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      backgroundColor: (areas['Tecnología']) ? Colors.blue : Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}