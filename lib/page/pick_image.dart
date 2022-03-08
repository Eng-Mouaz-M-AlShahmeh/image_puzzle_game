/* Developed by: Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_puzzle_game/page/GamePage.dart';

class PickImage extends StatefulWidget {
  const PickImage({Key key}) : super(key: key);

  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('حمل صورة للأحجية'),
          onPressed: () async {
            setState(() async {
              final XFile image =
                  await _picker.pickImage(source: ImageSource.gallery);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                        body: GamePage(
                            MediaQuery.of(context).size, image.path, 4))),
              );
            });
          },
        ),
      ),
    );
  }
}
