import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:async';

const _teste = "https://api.tibiadata.com/v2/characters/Aegda+Anden.json";

// void main() async {
//   runApp(
//     MaterialApp(
//       home: Home(),
//       theme: ThemeData(hintColor: Colors.amber, primaryColor: Colors.white),
//     ),
//   );
// }

Future<Map> getData() async {
  http.Response response = await http.get(_teste);
  return json.decode(response.body);
}

Future<String> postAsync() async {
  final client = HttpClient();

  //final request = await client.postUrl(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  //final request = await client.postUrl(Uri.parse(_teste));
  // request.headers.set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
  // request.write('{"title": "Foo","body": "Bar", "userId": 99}');

  // final response = await request.close();

  // response.transform(utf8.decoder).listen((contents) {
  //   print(contents);
  // });

  return "";
}
