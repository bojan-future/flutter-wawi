import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'display_picture.dart';

/// A screen that allows users to take a picture using a given camera
class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;
  final int deliveryID;

  ///
  const TakePictureScreen({
    Key? key,
    required this.camera,
    required this.deliveryID,
  }) : super(key: key);

  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final Color col = Colors.red[400]!;
  late int cameraID = 0;
  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.veryHigh,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Nehmen Sie ein Bild auf'), backgroundColor: col),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Flexible(
                flex: 6,
                child: FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CameraPreview(_controller);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )),
            SizedBox(width: 8),
            Expanded(
              child: TextButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.camera_alt, size: 40)],
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  primary: Colors.black,
                ),
                onPressed: () async {
                  await _initializeControllerFuture;
                  final image = await _controller.takePicture();
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen(
                        imagePath: image.path,
                        deliveryID: widget.deliveryID,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async {
          await _initializeControllerFuture;
          final cameras = await availableCameras();
          print(cameraID);
          if (cameraID == 0) {
            _controller = CameraController(
              cameras[1],
              ResolutionPreset.veryHigh,
            );
            cameraID = 1;
          } else if (cameraID == 1) {
            if (cameras.length == 3) {
              _controller = CameraController(
                cameras[2],
                ResolutionPreset.veryHigh,
              );
              cameraID = 2;
            } else {
              _controller = CameraController(
                cameras[0],
                ResolutionPreset.veryHigh,
              );
              cameraID = 0;
            }
          } else if (cameraID == 2) {
            _controller = CameraController(
              cameras[0],
              ResolutionPreset.veryHigh,
            );
            cameraID = 0;
          }

          setState(() {
            _initializeControllerFuture = _controller.initialize();
          });
        },
        child: const Icon(Icons.sync),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
