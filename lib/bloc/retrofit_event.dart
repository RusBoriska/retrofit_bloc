part of 'retrofit_bloc.dart';

@immutable
abstract class RetrofitEvent {}


class UserRequestEvent extends RetrofitEvent {}

class PostRequestEvent extends RetrofitEvent {}

class PostPostingEvent extends RetrofitEvent {
    final String title;
    final String body;
    final int userId;

    PostPostingEvent({required this.title, required this.body, required this.userId});
}
