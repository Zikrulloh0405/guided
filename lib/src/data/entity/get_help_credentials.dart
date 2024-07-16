import "dart:convert";

GetHelpCredentials getHelpCredentialsFromJson(String str) => GetHelpCredentials.fromJson(json.decode(str));

String getHelpCredentialsToJson(GetHelpCredentials data) => json.encode(data.toJson());

class GetHelpCredentials {

  GetHelpCredentials({
    this.success,
    this.data,
  });

  factory GetHelpCredentials.fromJson(Map<String, dynamic> json) => GetHelpCredentials(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );
  final bool? success;
  final Data? data;

  GetHelpCredentials copyWith({
    bool? success,
    Data? data,
  }) =>
      GetHelpCredentials(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    "success": success,
    "data": data?.toJson(),
  };
}

class Data {

  Data({
    this.id,
    this.onlineChat,
    this.phone,
    this.address,
    this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    onlineChat: json["onlineChat"],
    phone: json["phone"],
    address: json["address"],
    email: json["email"],
  );
  final String? id;
  final String? onlineChat;
  final String? phone;
  final String? address;
  final String? email;

  Data copyWith({
    String? id,
    String? onlineChat,
    String? phone,
    String? address,
    String? email,
  }) =>
      Data(
        id: id ?? this.id,
        onlineChat: onlineChat ?? this.onlineChat,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        email: email ?? this.email,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    "id": id,
    "onlineChat": onlineChat,
    "phone": phone,
    "address": address,
    "email": email,
  };
}
