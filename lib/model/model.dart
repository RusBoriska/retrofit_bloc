import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';


//Address and Company are nested so I will work with them later
@JsonSerializable()
class UserRequest {
  int id;
  String name;
  String username;
  String email;
  // Address address;
  String phone;
  String website;
  // Company company;

  UserRequest({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    // required this.address,
    required this.phone,
    required this.website,
    // required this.company,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}


@JsonSerializable()
class PostRequest {
  String title;
  String body;
  int userId;

  PostRequest({
    required this.title,
    required this.body,
    required this.userId,
  });

  factory PostRequest.fromJson(Map<String, dynamic> json) =>
      _$PostRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PostRequestToJson(this);
}


@JsonSerializable()
class PostResponse {
  int userId;
  int id;
  String title;
  String body;

  PostResponse({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PostResponseToJson(this);
}

@JsonSerializable()
class LogonResopnse {
  late String retCode;
  late List<GetIndexesResult> result;
  LogonResopnse({required this.retCode, required this.result});
  factory LogonResopnse.fromJson(Map<String, dynamic> json) =>
      _$LogonResopnseFromJson(json);
  Map<String, dynamic> toJson() => _$LogonResopnseToJson(this);
}

@JsonSerializable()
class GetIndexesResult {
  late String indexCode;
  GetIndexesResult({required this.indexCode});
  factory GetIndexesResult.fromJson(Map<String, dynamic> json) =>
      _$GetIndexesResultFromJson(json);
  Map<String, dynamic> toJson() => _$GetIndexesResultToJson(this);
}

@JsonSerializable()
class GetIndexesDataPost {
  String marketCode = '';
  List<String> indexList = [];
  GetIndexesDataPost({required this.marketCode, required this.indexList});
  factory GetIndexesDataPost.fromJson(Map<String, dynamic> json) =>
      _$GetIndexesDataPostFromJson(json);
  Map<String, dynamic> toJson() => _$GetIndexesDataPostToJson(this);
}