import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../views/camera_view.dart';

/// ListView with built in camera functionality
class DeliveryImagesWidget extends StatefulWidget {
  ///
  DeliveryImagesWidget({
    Key? key,
    required this.title,
    this.color = Colors.red,
    required this.itemCount,
    required this.itemBuilder,
    required this.packetID,
    required this.onPhotoFinished,
  }) : super(key: key);

  /// Screen title
  final String title;

  /// header color
  final Color color;

  /// count of elements in the list
  final int itemCount;

  /// list item builder
  final IndexedWidgetBuilder itemBuilder;

  /// id of the parent delivery
  final int packetID;

  /// callback executed when photo has been made
  final VoidCallback onPhotoFinished;

  @override
  _DeliveryImagesWidgetState createState() => _DeliveryImagesWidgetState();
}

class _DeliveryImagesWidgetState extends State<DeliveryImagesWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () async {
              Feedback.forTap(context);
              WidgetsFlutterBinding.ensureInitialized();
              final cameras = await availableCameras();
              final firstCamera = cameras.first;
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => TakePictureScreen(
                            camera: firstCamera,
                            packetID: widget.packetID,
                          ))).then((value) {
                widget.onPhotoFinished();
              });
            },
            child: Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(22.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Icon(Mdi.camera),
                )),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
              ),
              controller: _scrollController,
              itemCount: widget.itemCount,
              itemBuilder: widget.itemBuilder,
            ),
          )
        ],
      ),
    );
  }
}
