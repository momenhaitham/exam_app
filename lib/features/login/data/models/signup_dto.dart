import 'package:exam_app_project/features/login/data/models/user_dto.dart';
import 'package:exam_app_project/features/login/domain/models/signup_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'signup_dto.g.dart';
@JsonSerializable()
class SignupDto {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "token")
    String? token;
    @JsonKey(name: "user")
    User? user;

    SignupDto({
        this.message,
        this.token,
        this.user,
    });

    factory SignupDto.fromJson(Map<String, dynamic> json) => _$SignupDtoFromJson(json);

    Map<String, dynamic> toJson() => _$SignupDtoToJson(this);

    SignupModel toModel(){
      return SignupModel(message: this.message??"",token: this.token);
    }

}