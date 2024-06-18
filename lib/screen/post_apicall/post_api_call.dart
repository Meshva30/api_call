import 'package:api_call/screen/post_apicall/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


class PostApiHomePage extends StatelessWidget {
  const PostApiHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final providerT = context.watch<PostApiProvider>();

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.black,
        title:  Text('user Api call'),
      ),

      body: ListView(
        children: [
          ...List.generate(
            providerT.postList.length,
                (index) => ListTile(
              // id, user id
              leading: Text(
                'userId: ${providerT.postList[index].userId}',
              ),
              // title
              title: Text(
                overflow: TextOverflow.ellipsis,
                'id: ${providerT.postList[index].id}',
              ),

              // body, tags
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    'title: ${providerT.postList[index].title}',
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    'body: ${providerT.postList[index].body}',
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
