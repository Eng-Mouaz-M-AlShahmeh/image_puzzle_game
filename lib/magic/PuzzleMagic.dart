/* Developed by: Eng Mouaz M AlShahmeh */
import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui show instantiateImageCodec, Codec, Image;
import 'dart:ui';
import 'package:flutter_puzzle_game/magic/ImageNode.dart';

class PuzzleMagic {
  ui.Image image;
  double eachWidth;
  Size screenSize;
  double baseX;
  double baseY;
  int level;
  double eachBitmapWidth;

  Future<ui.Image> init(String path, Size size, int level) async {
    await getImage(path);
    screenSize = size;
    this.level = level;
    eachWidth = screenSize.width * 0.8 / level;
    baseX = screenSize.width * 0.1;
    baseY = (screenSize.height - screenSize.width) * 0.5;
    eachBitmapWidth = (image.width / level);
    return image;
  }

  Future<ui.Image> getImage(String path) async {
    File data = File(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.readAsBytesSync());
    FrameInfo frameInfo = await codec.getNextFrame();
    image = frameInfo.image;
    return image;
  }

  List<ImageNode> doTask() {
    List<ImageNode> list = [];
    for (int j = 0; j < level; j++) {
      for (int i = 0; i < level; i++) {
        if (j * level + i < level * level - 1) {
          ImageNode node = ImageNode();
          node.rect = getOkRectF(i, j);
          node.index = j * level + i;
          makeBitmap(node);
          list.add(node);
        }
      }
    }
    return list;
  }

  Rect getOkRectF(int i, int j) {
    return Rect.fromLTWH(
        baseX + eachWidth * i, baseY + eachWidth * j, eachWidth, eachWidth);
  }

  Future<void> makeBitmap(ImageNode node) async {
    int i = node.getXIndex(level);
    int j = node.getYIndex(level);
    Rect rect = getShapeRect(i, j, eachBitmapWidth);
    rect = rect.shift(
        Offset(eachBitmapWidth.toDouble() * i, eachBitmapWidth.toDouble() * j));
    PictureRecorder recorder = PictureRecorder();
    double ww = eachBitmapWidth.toDouble();
    Canvas canvas = Canvas(recorder, Rect.fromLTWH(0.0, 0.0, ww, ww));
    Rect rect2 = Rect.fromLTRB(0.0, 0.0, rect.width, rect.height);
    Paint paint = Paint();
    canvas.drawImageRect(image, rect, rect2, paint);
    node.image = await recorder.endRecording().toImage(ww.floor(), ww.floor());
    node.rect = getOkRectF(i, j);
  }

  Rect getShapeRect(int i, int j, double width) {
    return Rect.fromLTRB(0.0, 0.0, width, width);
  }
}
