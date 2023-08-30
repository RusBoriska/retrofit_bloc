import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/retrofit_bloc.dart';
import '/model/model.dart';


class GetPosts extends StatelessWidget {
  const GetPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RetrofitBloc, RetrofitState>(
      listener: (context, state) {
        if (state is RetrofitLoadInProgress) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Data loading"),
            ),
          );
        }
        if (state is PostLoadSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("The list of posts is loaded"),
            ),
          );
        }
        if (state is RetrofitLoadFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.only(bottom: 500.0),
              content: Text("Error: ${state.error}"),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is RetrofitInitial) {
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<RetrofitBloc>().add(PostRequestEvent());
                },
                child: const Text("Get a list of posts"),
              ),
            ),
          );
        }
        else if (state is RetrofitLoadInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is RetrofitLoadFailure) {
          return const Center(
            child: Text("Error!"),
          );
        }
        else if (state is PostLoadSuccess) {
          return _buildBody(context, state);
        }
        return Container();
      },
    );
  }

// build list view & manage states
  FutureBuilder<List<PostRequest>> _buildBody(BuildContext context, PostLoadSuccess state) {
    final client = state.posts;
    return FutureBuilder<List<PostRequest>>(
      future: client,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<PostRequest>? posts = snapshot.data;
          return _buildListView(context, posts!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // build list view & its tile
  Widget _buildListView(BuildContext context, List<PostRequest> posts) {
    return
      ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const Icon(
              Icons.account_box, color: Colors.green, size: 50,),
            title: Text(
              posts[index].title, style: const TextStyle(fontSize: 20),),
            subtitle: Text(posts[index].body),
          ),
        );
      }, itemCount: posts.length,
      );
  }
}