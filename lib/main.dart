import 'package:flutter/material.dart';
import 'package:retrofit_bloc/bloc/retrofit_bloc.dart';
import 'presentation/get_posts.dart';
import 'presentation/get_users.dart';
import 'presentation/post_posts.dart';
import 'repository/repo_class.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RetrofitBloc(),
      child: MaterialApp(
      title: 'Retrofit + BLoC',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    ),
);
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Retrofit + BLoC"),
      ),
      body: pressed
          ? const Text('Body')
          : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ElevatedButton(
                      child: const Text(
                        "Get a list of users",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Background color
                      ),
                      onPressed: () => {
                      context.read<RetrofitBloc>().add(UserRequestEvent()), //To add our event instead of the Initial state
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const GetUsers()),
                        ),
                      }),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                      child: const Text(
                        "A form for posting",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Background color
                      ),
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const PostPosts()),
                        ),
                      }),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                      child: const Text(
                        "Get a list of posts",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Background color
                      ),
                      onPressed: () => {
                        context.read<RetrofitBloc>().add(PostRequestEvent()), //To add our event instead of the Initial state
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const GetPosts()),
                        ),

                        // setState(() {
                        //   RepoClass repoClass = RepoClass();
                        //   repoClass.getPostsData();
                        //
                        // })


                      }),
                ],
              )
            ],
          )
      ),
    );
  }
}