import 'package:http/http.dart' as http;
import 'package:t0701/keys/key.dart';
import 'package:t0701/models/cultural.dart';
import 'dart:convert';

Future<List<Cultural>> fetchCultural() async {
  late List<Cultural> culturalList;
  String url = "http://apis.data.go.kr/6480000/gyeongnamcultural/gyeongnamculturallist?serviceKey=" + apiKey
              + '&pageNo=1&numOfRows=10&resultType=json';
  final response = await http.get(Uri.parse(url));
  final responseBody = response.body;
  print(responseBody);
  final jsonMap = json.decode(responseBody);
  print('\n----------------KKK------------------\n');
  print(jsonMap['gyeongnamculturallist']['body']['items']['item'][0]['MYONGCHING']);
  // culturalList = jsonMap.containsKey('gyeongnamculturallist')
  //     ? (jsonMap['gyeongnamculturallist']['item'] as List)
  //     .map((e) => Cultural.fromJson(e)).toList()
  //     : List.empty();
  culturalList = jsonMap.containsKey('gyeongnamculturallist') &&
      jsonMap['gyeongnamculturallist']['body']['items']['item'] != null
      ? (jsonMap['gyeongnamculturallist']['body']['items']['item'] as List)
      .map((e) => Cultural.fromJson(e))
      .toList()
      : [];


  print('\n----------------------------------\n');

  culturalList.forEach((element) {
    print(element.MYONGCHING + " + " + element.CONTENT + "\n");
  });

  if(response.statusCode == 200){
    return culturalList;
  }else{
    throw Exception('Failed to load park info');
  }
}