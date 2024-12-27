import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tic_tac_toe/features/game/data/models/player_model.dart';

part 'room_model.freezed.dart';
part 'room_model.g.dart';

@freezed
class RoomModel with _$RoomModel {
  const factory RoomModel({
    required String id,
    required PlayerModel? player1,
    required PlayerModel? player2,
    required String? currentPlayer,
    required String? status,
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, Object?> json) =>
      _$RoomModelFromJson(json);
}
