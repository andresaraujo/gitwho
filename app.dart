import 'package:start/start.dart';


import 'package:http_server/http_server.dart';
import 'package:logging/logging.dart';
import 'dart:async' show runZoned;
import 'dart:io' show Platform;

import 'dart:convert';

import 'lib/member.dart';


void main() {

  runZoned(() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((rec) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    });
    
    final contentType= "application/json; charset=UTF-8";
    
    // the port should be driven off of the environment
    // variable to enable heroku deployment.
    var portEnv = Platform.environment['PORT'];
    var port = portEnv == null ? 3000 : int.parse(portEnv);

    print(">>Running server at port ${port}");
    
    start(port: port, host: '0.0.0.0').then((Server app) {

      app.static('build');

      //test endpoint
      app.get('/hello/:name.:lastname?').listen((request) {
        Member m = new Member("asd");
        
        addCorsHeaders(request.response);
        request.response
          .header('Content-Type', contentType)
            .send(JSON.encode(m.toJson()));
      });
    });
  },
  onError: (e, stackTrace) => print('Oh noes! $e $stackTrace'));
  
  
}
void addCorsHeaders(Response res) {
  res.header("Access-Control-Allow-Origin", "*, ");
  res.header("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}
