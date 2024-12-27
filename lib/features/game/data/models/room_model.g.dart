// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomModelImpl _$$RoomModelImplFromJson(Map<String, dynamic> json) =>
    _$RoomModelImpl(
      id: json['id'] as String,
      player1: json['player1'] == null
          ? null
          : PlayerModel.fromJson(json['player1'] as Map<String, dynamic>),
      player2: json['player2'] == null
          ? null
          : PlayerModel.fromJson(json['player2'] as Map<String, dynamic>),
      currentPlayer: json['currentPlayer'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$RoomModelImplToJson(_$RoomModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'player1': instance.player1,
      'player2': instance.player2,
      'currentPlayer': instance.currentPlayer,
      'status': instance.status,
    };
