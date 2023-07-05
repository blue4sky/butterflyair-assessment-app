import 'package:http/http.dart' as http;
import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:butterflyair_assessment_app/data/api_key.dart';

String pmUrl =
    'https://api.breathelondon.org/api/getClarityData/CLDP0098/IPM25/Sat 1 Apr 2023 00:00:00 GMT/Sat 1 Jul 2023 00:00:00 GMT/Hourly?key=$breatheLondonApiKey';

String no2Url =
    'https://api.breathelondon.org/api/getClarityData/CLDP0098/INO2/Sat 1 Apr 2023 00:00:00 GMT/Sat 1 Jul 2023 00:00:00 GMT/Hourly?key=$breatheLondonApiKey';

Future<List<ApiData>?> fetchPMData() async {
  final response = await http.get(Uri.parse(pmUrl));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<ApiData> data = pmDataFromJson(response.body);
    return data;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

Future<List<ApiData>?> fetchNOData() async {
  final response = await http.get(Uri.parse(no2Url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<ApiData> data = pmDataFromJson(response.body);
    return data;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}
