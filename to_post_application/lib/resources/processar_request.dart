import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

const _urlEndpoint = "https://api.tibiadata.com/v2/characters/Aegda+Anden.json";
// String _requestCharacterData = "https://api.tibiadata.com/v2/characters/$_characterName.json";

// void main() async {
//   runApp(
//     MaterialApp(
//       home: Home(),
//       theme: ThemeData(hintColor: Colors.amber, primaryColor: Colors.white),
//     ),
//   );
// }

Future<Map<String, dynamic>> getData() async {
  http.Response response = await http.get(_urlEndpoint);
  return json.decode(response.body);
}

Future<String> getDataString() async {
  http.Response response = await http.get(_urlEndpoint);
  return json.decode(response.body).toString();
}

Future<Map<String, dynamic>> getCharacterData(String paramCharName) async {
  // String _characterName = paramCharName;
  http.Response response = await http.get("https://api.tibiadata.com/v2/characters/$paramCharName.json");
  // _characterName = '';
  return json.decode(response.body);
}

// Future<String> postAsync() async {
//   // final client = HttpClient();

//   //final request = await client.postUrl(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
//   //final request = await client.postUrl(Uri.parse(_teste));
//   // request.headers.set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
//   // request.write('{"title": "Foo","body": "Bar", "userId": 99}');

//   // final response = await request.close();

//   // response.transform(utf8.decoder).listen((contents) {
//   //   print(contents);
//   // });

//   // return "";
// }
