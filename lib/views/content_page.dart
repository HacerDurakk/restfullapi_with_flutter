import 'package:flutter/material.dart';
import 'package:gtech1/models/photo_model.dart';
import 'package:gtech1/service/photo_service.dart';

class ContentPage extends StatefulWidget {
  PhotoModel _photoModel;
  ContentPage(this._photoModel, {Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: ListView(
            children: [
              Text(
                "Title" + widget._photoModel.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Image.network(widget._photoModel.url)
            ],
          ),
        ));
  }
}
