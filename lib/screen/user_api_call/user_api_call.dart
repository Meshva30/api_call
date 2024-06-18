import 'package:api_call/screen/user_api_call/provider/user_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class UserApiHomePage extends StatelessWidget {
  const UserApiHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final providerT = context.watch<UserApiProvider>();

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.black,
        title: const Text('User\'s data Form API'),
      ),

      body: ListView(
        children: [
          ...List.generate(
            providerT.usersList.length,
                (index) => ListTile(
              // id, user id
              leading: Text(
                'id: ${providerT.usersList[index].id}',
              ),
              // title
              title: Text(
                overflow: TextOverflow.ellipsis,
                'user: ${providerT.usersList[index].username}',
              ),

              // body, tags
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    'email: ${providerT.usersList[index].email}',
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    'phone: ${providerT.usersList[index].phone}',
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    'website: ${providerT.usersList[index].website}',
                  ),
                  const Text(
                    overflow: TextOverflow.ellipsis,
                    'Address:',
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    '\t\tstreet: ${providerT.usersList[index].address?.street}',
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    '\t\tsuite: ${providerT.usersList[index].address?.suite}',
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    '\t\tcity: ${providerT.usersList[index].address?.city}',
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    '\t\tzipcode: ${providerT.usersList[index].address?.zipcode}',
                  ),
                  const Text(
                    overflow: TextOverflow.ellipsis,
                    '\t\tgeo:',
                  ),
                  // Text(
                  //   overflow: TextOverflow.ellipsis,
                  //   '\t\t\t\t lat: ${providerT.usersList[index].address?.geo.lat}',
                  // ),
                  // Text(
                  //   overflow: TextOverflow.ellipsis,
                  //   '\t\t\t\t lang: ${providerT.usersList[index].address?.geo.lng}',
                  // ),
                  const Text(
                    overflow: TextOverflow.ellipsis,
                    'Company:',
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    '\t\tname: ${providerT.usersList[index].company?.name}',
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    '\t\tcatchPhrase: ${providerT.usersList[index].company?.catchPhrase}',
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    '\t\tbs: ${providerT.usersList[index].company?.bs}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}



class ApiService {
  Future<String> callApi(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
