import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List datas = [];
  bool err = false;
  bool load = true;

  // Get liste of data
  get_data() async {
    var res = await apiGet('posts');

    setState(() {
      if (res['status'] == 200) {
        datas = res['data'].data;
        load = false;
      } else {
        setState(() {
          err = true;
          load = false;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_data();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Api Text'),
            ),
            body: load
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : err
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.warning,
                              color: Colors.amber,
                            ),
                            Text("Une erreure est survenue"),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: datas.length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = datas[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius:
                                      MediaQuery.of(context).size.width / 15,
                                ),
                                title: Text(
                                  "${data['title']} ...",
                                  maxLines: 1,
                                ),
                                subtitle: Text(
                                  data['body'],
                                  maxLines: 3,
                                ),
                              ),
                            ),
                          );
                        })));
  }
}
