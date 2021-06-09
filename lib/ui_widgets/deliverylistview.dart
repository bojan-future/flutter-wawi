import 'package:flutter/material.dart';

/// ListView with built in camera functionality
class DeliveriesForImagesWidget extends StatefulWidget {
  ///
  DeliveriesForImagesWidget({
    Key? key,
    required this.title,
    this.color = Colors.red,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  final String title;
  final Color color;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  @override
  _DeliveriesForImagesWidgetState createState() =>
      _DeliveriesForImagesWidgetState();
}

class _DeliveriesForImagesWidgetState extends State<DeliveriesForImagesWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: (Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 5),
          Text("   Hier werden die letzten 10 Anlieferungen gelistet:"),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: widget.itemCount,
              itemBuilder: widget.itemBuilder,
            ),
          )
        ],
      )),
    );
  }
}
