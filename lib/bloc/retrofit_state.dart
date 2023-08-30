part of 'retrofit_bloc.dart';

@immutable
abstract class RetrofitState {}

class RetrofitInitial extends RetrofitState {}

class RetrofitLoadInProgress extends RetrofitState {}

class UserLoadSuccess extends RetrofitState {
  final Future<List<UserRequest>> users;

  UserLoadSuccess({required this.users});
}

class PostLoadSuccess extends RetrofitState {
  final Future<List<PostRequest>> posts;

  PostLoadSuccess({required this.posts});
}

class PostPostingSuccess extends RetrofitState {}

class RetrofitLoadFailure extends RetrofitState {
  final String error;

  RetrofitLoadFailure({required this.error});
}
