import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:m3allim/User.dart';
import 'package:m3allim/bottomNavigator.dart';
import 'package:m3allim/ServiceProvider.dart';

import './displayOneCategoryCard.dart';
import './Categories.dart';
import './designCard.dart';
import './test.dart';

import './crud.dart';
import 'Doha.dart';


class MyApp extends StatelessWidget{
  String name;
  List<Categories> listCategories;
  MyApp(this.listCategories, this.name);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: _MyApp(listCategories,name));
  }
  }




class _MyApp extends StatelessWidget {
  User u = new User(20, false, GeoPoint(11, 44), "حسام", "10341089");

  List<Categories> categoriesList;
  String name;
  _MyApp(this.categoriesList,this.name);

  @override
  Widget build(BuildContext context) {
    final title = 'Categories';
    return 
       Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              iconSize: 17.0,
              onPressed: () {},
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(8.0),
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 5.0,
          children: categoriesList
              .map((data) => GestureDetector(
                    child: displayOneCard(data),
                    onTap: () async {
                      if (data.sub.length != 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyApp(data.sub,data.name)));
                      } else {
                          if(name.isEmpty){
                            name = data.name;
                          }
                        List<ServiceProvider> prof =
                            await fb.getnServiceProviders(
                                name, data.name, 5, 'distance', true, u);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Myapp(prof, u)));
                      }
                    },
                  ))
              .toList(),
        ),
        bottomNavigationBar: bottomNavigator(),
      
    );
  }
}
