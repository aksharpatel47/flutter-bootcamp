// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return Chat(user: json['user'] as String, text: json['text'] as String);
}

Map<String, dynamic> _$ChatToJson(Chat instance) =>
    <String, dynamic>{'user': instance.user, 'text': instance.text};
