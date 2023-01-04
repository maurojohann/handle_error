import 'package:erros_handle/feature/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data_models.g.dart';

@JsonSerializable(createToJson: false)
class UserDataModels extends UserEntity {
  @JsonKey(name: 'userId')
  final int userIds;

  UserDataModels(this.userIds, int id, String title, bool completed)
      : super(
          userIds,
          id,
          title,
          completed,
        );

  factory UserDataModels.fromJson(Map<String, dynamic> json) => _$UserDataModelsFromJson(json);
}
