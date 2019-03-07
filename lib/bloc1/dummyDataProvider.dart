import 'dart:convert';

import 'package:bloc_issue/dummyModel.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class DummyDataProvider {

  final http.Client httpClient;

  DummyDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<DummyData> getDummyInfo() async {

    final url = 'https://jsonplaceholder.typicode.com/todos/1';
    final response = await this.httpClient.get(url);

    return DummyData.fromJson(jsonDecode(response.body));
  }

}