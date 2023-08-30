import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '/model/model.dart';
import '/repository/repo_class.dart';

part 'retrofit_event.dart';
part 'retrofit_state.dart';


class RetrofitBloc extends Bloc<RetrofitEvent, RetrofitState> {
  final RepoClass _repoClass = RepoClass();
  RetrofitBloc() : super(RetrofitInitial()) {
    on<UserRequestEvent>((event, emit) async {
      emit(RetrofitLoadInProgress());
      try {
        emit(UserLoadSuccess(users: _repoClass.getUsersData()
        ));
      } catch (e) {
        print(e);
        emit(RetrofitLoadFailure(error: e.toString()));
      }
    });
    on<PostRequestEvent>((event, emit) async {
      emit(RetrofitLoadInProgress());
      try {
        emit(PostLoadSuccess(posts: _repoClass.getPostsData()
        ));
      } catch (e) {
        print(e);
        emit(RetrofitLoadFailure(error: e.toString()));
      }
    });
    on<PostPostingEvent>((event, emit) async {
      emit(RetrofitLoadInProgress());
      try {
        _repoClass.postPosts(event.title, event.body, event.userId);
        emit(PostPostingSuccess());
        print('event.title is ${event.title}, event.body is ${event.body}, event.userId is ${event.userId}');
      } catch (e) {
        print(e);
        emit(RetrofitLoadFailure(error: e.toString()));
      }
    });

  }
}