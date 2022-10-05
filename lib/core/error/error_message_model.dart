class ErrorMessageModel {
  final int code;
  final String message;
  ErrorMessageModel({
    required this.code,
    required this.message,
  });
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        code: json['cod'],
        message: json['message'],
      );
}
