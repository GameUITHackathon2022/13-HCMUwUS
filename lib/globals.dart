import 'dart:async';
import 'dart:io';

enum SourceOption { gallery, camera }

class Global {
  int planted = 0, streaked = 0, coins = 0;
  File _image = File("");
}

Global global = Global();