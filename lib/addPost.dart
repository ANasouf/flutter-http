import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:httpapp/apiClient.dart';

import 'post.dart';

class AddPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Add Post'),
          onPressed: () async {
            var post = Post(title: 'foo', body: 'bar', userId: 1);

            Response response;
            response =
                await ApiClient.apiClient.post('/posts', data: post.toJson());

            print(response);
          },
        ),
      ),
    );
  }
}
