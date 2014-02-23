import 'package:start/start.dart';


import 'package:http_server/http_server.dart';
import 'package:logging/logging.dart';

import 'dart:convert';

import 'lib/member.dart';


void main() {

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
  
  final String contentType= "application/json; charset=UTF-8";

  start(port: 3000).then((Server app) {

    app.static('build');

    app.get('/hello/:name.:lastname?').listen((request) {
      Member m = new Member("asd");
      
      addCorsHeaders(request.response);
      request.response
        .header('Content-Type', contentType)
        //.send(JSON.encode(['Hello, ${request.param('name')} ${request.param('lastname')}']));
          .send(JSON.encode(m.toJson()));
    });
  });
}
void addCorsHeaders(Response res) {
  res.header("Access-Control-Allow-Origin", "*, ");
  res.header("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}