import 'package:dio/dio.dart';

import '../api/api_client.dart';
import '../model/model.dart';

class RepoClass {
  late APIClient mClient;
  RepoClass() {
    mClient = APIClient(Dio());
  }


  Future<List<UserRequest>> getUsersData() async {
    // var usersResponse = await mClient.getUsers();
    List<UserRequest> usersResponse = await mClient.getUsers();
    return usersResponse;
  }


  Future<List<PostRequest>> getPostsData() async {
    List<PostRequest> postsResponse = await mClient.getPosts();
    return postsResponse;
  }


  demoPost() async {
    PostRequest dataPost = PostRequest(
        title: 'This is Title',
        body: 'This is Body',
        userId: 69);
    var postResponse = await mClient.postDemo(dataPost);
    print('title is ${postResponse.title}, body is ${postResponse.body}, userId is ${postResponse.userId}, id is ${postResponse.id}');
  }


// Post with our user's parameters
  postPosts(title, body, userId) async {
    PostRequest dataPost = PostRequest(
        title: title,
        body: body,
        userId: userId);
    var postResponse = await mClient.postDemo(dataPost);
    print('title is ${postResponse.title}, body is ${postResponse.body}, userId is ${postResponse.userId}');
  }

}