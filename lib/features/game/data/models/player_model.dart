import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_model.freezed.dart';
part 'player_model.g.dart';

@freezed
class PlayerModel with _$PlayerModel {
  const factory PlayerModel({
    required String? displayName,
    required String? ava,
    required String id,
  }) = _PlayerModel;

  factory PlayerModel.fromJson(Map<String, Object?> json) =>
      _$PlayerModelFromJson(json);
}
