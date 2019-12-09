import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add'                       : Icons.add,
  'remove'                    : Icons.remove,
  'photo_size_select_actual'  : Icons.photo_size_select_actual,
  'photo_camera'              : Icons.photo_camera,
  'local_dining'              : Icons.local_dining,
  'work'                      : Icons.work,
  'add_comment'               : Icons.add_comment,     
  'free_breakfast'            : Icons.free_breakfast,
  'fastfood'                  : Icons.fastfood,
  'brightness_2'              : Icons.brightness_2,
  'local_drink'               : Icons.local_drink,
  'healing'                   : Icons.healing,
  'cake'                      : Icons.cake,
  'whatshot'                  : Icons.whatshot,
  'search'                    : Icons.search
};

Icon getIcon(String nombreIcono){
  return Icon(_icons[nombreIcono], color: Colors.white, size: 40,);
}