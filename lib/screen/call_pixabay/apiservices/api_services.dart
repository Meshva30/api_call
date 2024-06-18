import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiServices {

  Future<String?> apiCalling(String category) async {
    String api =
        'https://pixabay.com/api/?key=36643208-07b3c983a397efc05417416a0&q=$category&image_type=photo&per_page=50';
    Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      return response.body;
    }

    return null;
  }
}
