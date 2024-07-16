import "dart:convert";

ErrorCaseModel errorCaseModelFromJson(String str) => ErrorCaseModel.fromJson(json.decode(str));

String errorCaseModelToJson(ErrorCaseModel data) => json.encode(data.toJson());

class ErrorCaseModel {

  ErrorCaseModel({
    this.success,
    this.error,
  });

  factory ErrorCaseModel.fromJson(Map<String, dynamic> json) => ErrorCaseModel(
    success: json["success"],
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );
  final bool? success;
  final Error? error;

  ErrorCaseModel copyWith({
    bool? success,
    Error? error,
  }) =>
      ErrorCaseModel(
        success: success ?? this.success,
        error: error ?? this.error,
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "error": error?.toJson(),
  };
}

class Error {

  Error({
    this.message,
    this.code,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    message: json["message"],
    code: json["code"],
  );
  final String? message;
  final String? code;

  Error copyWith({
    String? message,
    String? code,
  }) =>
      Error(
        message: message ?? this.message,
        code: code ?? this.code,
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "code": code,
  };
}
