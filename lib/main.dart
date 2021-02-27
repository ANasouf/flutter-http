import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:httpapp/apiClient.dart';

import 'addPost.dart';
import 'post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (_) => Home(),
        '/add': (_) => AddPost(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: FutureBuilder<List<Post>>(
            future: getPosts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('Error');
                }
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        print('clicked: ${snapshot.data[index].userId}');
                        Navigator.of(context).pushNamed('/add');
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Text(snapshot.data[index].id.toString()),
                            Text(snapshot.data[index].title),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }
}

Future<List<Post>> getPosts() async {
  Response response;
  response = await ApiClient.apiClient.get('/posts');

  List<Post> posts = postFromJson(response.data);
  return posts;
}
