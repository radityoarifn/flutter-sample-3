import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/src/utils/constants.dart';
import 'package:flutter_ui_challenges/src/utils/models/developer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.deepOrange
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('About Flutter UI Challenges'),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200
                    ),
                    child: Text("Flutter UI Challenges is our effort to replicate various UIs in flutter and share it with you for free."),
                  ),
                  SizedBox(height: 20.0),
                  Text("Contributors", style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10.0),
                  ...DEVELOPERS.map((dev) => _buildHeader(dev)).toList()
                ],
              ),
            ),
          );
        }
      ),
    );
  }


  Widget _buildHeader(Developer developer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,),
      child: MaterialButton(
        padding: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: Colors.grey.shade200,
        onPressed: () => _open(developer.github),
        child: Row(children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                radius: 35.0,
                backgroundImage: NetworkImage(developer.imageUrl)))),
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(developer.name, style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10.0),
              Text(developer.profession),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.map, size: 12.0, color: Colors.black54,),
                  SizedBox(width: 10.0),
                  Text(developer.address, style: TextStyle(
                    color: Colors.black54
                  ),),
                ],
              ),
            ],
          )
        ],),
      ),
    );
  }
  _open(String url)async {
    if(await canLaunch(url)) {
      launch(url);
    }
  }
}