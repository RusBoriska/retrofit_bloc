// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => UserRequest(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      website: json['website'] as String,
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'website': instance.website,
    };

PostRequest _$PostRequestFromJson(Map<String, dynamic> json) => PostRequest(
      title: json['title'] as String,
      body: json['body'] as String,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$PostRequestToJson(PostRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'userId': instance.userId,
    };

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) => PostResponse(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };

LogonResopnse _$LogonResopnseFromJson(Map<String, dynamic> json) =>
    LogonResopnse(
      retCode: json['retCode'] as String,
      result: (json['result'] as List<dynamic>)
          .map((e) => GetIndexesResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LogonResopnseToJson(LogonResopnse instance) =>
    <String, dynamic>{
      'retCode': instance.retCode,
      'result': instance.result,
    };

GetIndexesResult _$GetIndexesResultFromJson(Map<String, dynamic> json) =>
    GetIndexesResult(
      indexCode: json['indexCode'] as String,
    );

Map<String, dynamic> _$GetIndexesResultToJson(GetIndexesResult instance) =>
    <String, dynamic>{
      'indexCode': instance.indexCode,
    };

GetIndexesDataPost _$GetIndexesDataPostFromJson(Map<String, dynamic> json) =>
    GetIndexesDataPost(
      marketCode: json['marketCode'] as String,
      indexList:
          (json['indexList'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GetIndexesDataPostToJson(GetIndexesDataPost instance) =>
    <String, dynamic>{
      'marketCode': instance.marketCode,
      'indexList': instance.indexList,
    };
