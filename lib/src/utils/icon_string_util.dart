import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add'                       : Icons.add,
  'remove'                    : Icons.remove,
  'photo_size_select_actual'  : Icons.photo_size_select_actual,
  'photo_camera'              : Icons.photo_camera,
};

Icon getIcon(String nombreIcono){
  return Icon(_icons[nombreIcono],);
}