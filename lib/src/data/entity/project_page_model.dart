import "dart:convert";

ProjectsModel projectsModelFromJson(String str) => ProjectsModel.fromJson(json.decode(str));

String projectsModelToJson(ProjectsModel data) => json.encode(data.toJson());

class ProjectsModel {

  ProjectsModel({
    this.success,
    this.data,
  });

  factory ProjectsModel.fromJson(Map<String, dynamic> json) => ProjectsModel(
    success: json["success"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );
  final bool? success;
  final List<Datum>? data;

  ProjectsModel copyWith({
    bool? success,
    List<Datum>? data,
  }) =>
      ProjectsModel(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {

  Datum({
    this.id,
    this.titleUz,
    this.titleEn,
    this.titleRu,
    this.aboutUz,
    this.aboutRu,
    this.aboutEn,
    this.location,
    this.budget,
    this.investment,
    this.photos,
    this.status,
    this.orderIndex,
    this.createdAt,
    this.createdById,
    this.title,
    this.about,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    titleUz: json["titleUz"],
    titleEn: json["titleEn"],
    titleRu: json["titleRu"],
    aboutUz: json["aboutUz"],
    aboutRu: json["aboutRu"],
    aboutEn: json["aboutEn"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    budget: json["budget"],
    investment: json["investment"],
    photos: json["photos"] == null ? [] : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
    status: json["status"] == null ? null : Status.fromJson(json["status"]),
    orderIndex: json["orderIndex"]?.toDouble(),
    createdAt: json["createdAt"],
    createdById: json["createdById"],
    title: json["title"],
    about: json["about"],
  );
  final String? id;
  final String? titleUz;
  final String? titleEn;
  final String? titleRu;
  final String? aboutUz;
  final String? aboutRu;
  final String? aboutEn;
  final Location? location;
  final num? budget;
  final num? investment;
  final List<Photo>? photos;
  final Status? status;
  final double? orderIndex;
  final num? createdAt;
  final String? createdById;
  final String? title;
  final String? about;

  Datum copyWith({
    String? id,
    String? titleUz,
    String? titleEn,
    String? titleRu,
    String? aboutUz,
    String? aboutRu,
    String? aboutEn,
    Location? location,
    num? budget,
    num? investment,
    List<Photo>? photos,
    Status? status,
    double? orderIndex,
    num? createdAt,
    String? createdById,
    String? title,
    String? about,
  }) =>
      Datum(
        id: id ?? this.id,
        titleUz: titleUz ?? this.titleUz,
        titleEn: titleEn ?? this.titleEn,
        titleRu: titleRu ?? this.titleRu,
        aboutUz: aboutUz ?? this.aboutUz,
        aboutRu: aboutRu ?? this.aboutRu,
        aboutEn: aboutEn ?? this.aboutEn,
        location: location ?? this.location,
        budget: budget ?? this.budget,
        investment: investment ?? this.investment,
        photos: photos ?? this.photos,
        status: status ?? this.status,
        orderIndex: orderIndex ?? this.orderIndex,
        createdAt: createdAt ?? this.createdAt,
        createdById: createdById ?? this.createdById,
        title: title ?? this.title,
        about: about ?? this.about,
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "titleUz": titleUz,
    "titleEn": titleEn,
    "titleRu": titleRu,
    "aboutUz": aboutUz,
    "aboutRu": aboutRu,
    "aboutEn": aboutEn,
    "location": location?.toJson(),
    "budget": budget,
    "investment": investment,
    "photos": photos == null ? [] : List<dynamic>.from(photos!.map((x) => x.toJson())),
    "status": status?.toJson(),
    "orderIndex": orderIndex,
    "createdAt": createdAt,
    "createdById": createdById,
    "title": title,
    "about": about,
  };
}

class Location {

  Location({
    this.lat,
    this.lon,
    this.regionId,
    this.region,
    this.districtId,
    this.district,
    this.addressLineUz,
    this.addressLineRu,
    this.addressLineEn,
    this.addressLine,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
    regionId: json["regionId"],
    region: json["region"] == null ? null : District.fromJson(json["region"]),
    districtId: json["districtId"],
    district: json["district"] == null ? null : District.fromJson(json["district"]),
    addressLineUz: json["addressLineUz"],
    addressLineRu: json["addressLineRu"],
    addressLineEn: json["addressLineEn"],
    addressLine: json["addressLine"],
  );
  final double? lat;
  final double? lon;
  final int? regionId;
  final District? region;
  final int? districtId;
  final District? district;
  final String? addressLineUz;
  final String? addressLineRu;
  final String? addressLineEn;
  final String? addressLine;

  Location copyWith({
    double? lat,
    double? lon,
    int? regionId,
    District? region,
    int? districtId,
    District? district,
    String? addressLineUz,
    String? addressLineRu,
    String? addressLineEn,
    String? addressLine,
  }) =>
      Location(
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        regionId: regionId ?? this.regionId,
        region: region ?? this.region,
        districtId: districtId ?? this.districtId,
        district: district ?? this.district,
        addressLineUz: addressLineUz ?? this.addressLineUz,
        addressLineRu: addressLineRu ?? this.addressLineRu,
        addressLineEn: addressLineEn ?? this.addressLineEn,
        addressLine: addressLine ?? this.addressLine,
      );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
    "regionId": regionId,
    "region": region?.toJson(),
    "districtId": districtId,
    "district": district?.toJson(),
    "addressLineUz": addressLineUz,
    "addressLineRu": addressLineRu,
    "addressLineEn": addressLineEn,
    "addressLine": addressLine,
  };
}

class District {

  District({
    this.id,
    this.nameUz,
    this.nameRu,
    this.nameEn,
    this.name,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
    id: json["id"],
    nameUz: json["nameUz"],
    nameRu: json["nameRu"],
    nameEn: json["nameEn"],
    name: json["name"],
  );
  final int? id;
  final String? nameUz;
  final String? nameRu;
  final String? nameEn;
  final String? name;

  District copyWith({
    int? id,
    String? nameUz,
    String? nameRu,
    String? nameEn,
    String? name,
  }) =>
      District(
        id: id ?? this.id,
        nameUz: nameUz ?? this.nameUz,
        nameRu: nameRu ?? this.nameRu,
        nameEn: nameEn ?? this.nameEn,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameUz": nameUz,
    "nameRu": nameRu,
    "nameEn": nameEn,
    "name": name,
  };
}

class Photo {

  Photo({
    this.id,
    this.photoId,
    this.orderIndex,
    this.photoUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    id: json["id"],
    photoId: json["photoId"],
    orderIndex: json["orderIndex"],
    photoUrl: json["photoUrl"],
  );
  final String? id;
  final String? photoId;
  final num? orderIndex;
  final String? photoUrl;

  Photo copyWith({
    String? id,
    String? photoId,
    num? orderIndex,
    String? photoUrl,
  }) =>
      Photo(
        id: id ?? this.id,
        photoId: photoId ?? this.photoId,
        orderIndex: orderIndex ?? this.orderIndex,
        photoUrl: photoUrl ?? this.photoUrl,
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "photoId": photoId,
    "orderIndex": orderIndex,
    "photoUrl": photoUrl,
  };
}

class Status {

  Status({
    this.id,
    this.nameUz,
    this.nameEn,
    this.nameRu,
    this.color,
    this.orderIndex,
    this.percent,
    this.name,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    id: json["id"],
    nameUz: json["nameUz"],
    nameEn: json["nameEn"],
    nameRu: json["nameRu"],
    color: json["color"],
    orderIndex: json["orderIndex"]?.toDouble(),
    percent: json["percent"],
    name: json["name"],
  );
  final String? id;
  final String? nameUz;
  final String? nameEn;
  final String? nameRu;
  final String? color;
  final double? orderIndex;
  final num? percent;
  final String? name;

  Status copyWith({
    String? id,
    String? nameUz,
    String? nameEn,
    String? nameRu,
    String? color,
    double? orderIndex,
    num? percent,
    String? name,
  }) =>
      Status(
        id: id ?? this.id,
        nameUz: nameUz ?? this.nameUz,
        nameEn: nameEn ?? this.nameEn,
        nameRu: nameRu ?? this.nameRu,
        color: color ?? this.color,
        orderIndex: orderIndex ?? this.orderIndex,
        percent: percent ?? this.percent,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameUz": nameUz,
    "nameEn": nameEn,
    "nameRu": nameRu,
    "color": color,
    "orderIndex": orderIndex,
    "percent": percent,
    "name": name,
  };
}
