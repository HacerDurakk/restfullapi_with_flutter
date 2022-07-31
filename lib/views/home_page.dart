import 'package:flutter/material.dart';
import 'package:gtech1/models/photo_model.dart';
import 'package:gtech1/service/photo_service.dart';
import 'package:gtech1/views/content_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PhotoModel>? _photos;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    _photos = await PhotoService().getModel();
    if (_photos != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lİst Photos'),
      ),
      body: Visibility(
        visible: isLoaded,
        // ignore: sort_child_properties_last
        child: ListView.builder(
          itemCount: _photos?.length,
          itemBuilder: (context, index) {
            return Container(
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ContentPage(_photos![index])));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _photos![index].id.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _photos![index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _photos?.remove(_photos![index]);
                            });
                          },
                          icon: Icon(Icons.delete)),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
