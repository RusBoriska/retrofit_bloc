import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/retrofit_bloc.dart';
import '/model/model.dart';


class GetUsers extends StatelessWidget {
  const GetUsers({Key? key}) : super(key: key);

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
        if (state is UserLoadSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("The list of users is loaded"),
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
                      context.read<RetrofitBloc>().add(UserRequestEvent());
                  },
                  child: const Text("Get a list of users"),
                ),
              ),
          );
        }
        else if (state is RetrofitLoadInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RetrofitLoadFailure) {
          return const Center(
            child: Text("Error!"),
          );
        } else if (state is UserLoadSuccess) {
          return _buildBody(context, state);
        }
        return Container();
      },
    );
  }

// build list view & manage states
  FutureBuilder<List<UserRequest>> _buildBody(BuildContext context, UserLoadSuccess state) {
    final client = state.users;
    return FutureBuilder<List<UserRequest>>(
      future: client,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<UserRequest>? users = snapshot.data;
          return _buildListView(context, users!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // build list view & its tile
  Widget _buildListView(BuildContext context, List<UserRequest> users) {
    return
      ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const Icon(
              Icons.account_box, color: Colors.green, size: 50,),
            title: Text(
              users[index].name, style: const TextStyle(fontSize: 20),),
            subtitle: Text(users[index].email),
          ),
        );
      }, itemCount: users.length,
      );
  }
}