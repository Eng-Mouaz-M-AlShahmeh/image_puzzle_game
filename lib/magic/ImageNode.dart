/* Developed by: Eng Mouaz M AlShahmeh */
import 'dart:ui' as ui show Image;
import 'dart:ui';

class ImageNode {
  int curIndex = 0;
  int index;
  Path path;
  Rect rect;
  ui.Image image;

  int getXIndex(int level) {
    return index % level;
  }

  int getYIndex(int level) {
    return (index / level).floor();
  }
}
