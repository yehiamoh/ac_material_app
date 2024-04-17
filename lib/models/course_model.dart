


class CourseModel {
  final String courseName;
  final String playlist;
  final String? playlist2;
  final String drive;
  final List<Week> weeks;
  final String? book;

  CourseModel({
    required this.courseName,
    required this.playlist,
    this.playlist2,
    required this.drive,
    required this.weeks,
    this.book,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    courseName: json["courseName"],
    playlist: json["playlist"],
    playlist2: json["playlist2"]??"https://drive.google.com/drive/folders/18mNqi6JSoCW-XjPxVz44Ms5cdQYozYcp",
    drive: json["drive"],
    weeks: List<Week>.from(json["weeks"].map((x) => Week.fromJson(x))),
    book: json["book"],
  );

  Map<String, dynamic> toJson() => {
    "courseName": courseName,
    "playlist": playlist,
    "playlist2": playlist2,
    "drive": drive,
    "weeks": List<dynamic>.from(weeks.map((x) => x.toJson())),
    "book": book,
  };
}

class Week {
  final String weekName;
  final List<Resource> resources;

  Week({
    required this.weekName,
    required this.resources,
  });

  factory Week.fromJson(Map<String, dynamic> json) => Week(
    weekName: json["weekName"],
    resources: List<Resource>.from(json["resources"].map((x) => Resource.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "weekName": weekName,
    "resources": List<dynamic>.from(resources.map((x) => x.toJson())),
  };
}

class Resource {
  final Icon icon;
  final String text;
  final String link;

  Resource({
    required this.icon,
    required this.text,
    required this.link,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
    icon: iconValues.map[json["icon"]]!,
    text: json["text"],
    link: json["link"]??"https://drive.google.com/drive/folders/18mNqi6JSoCW-XjPxVz44Ms5cdQYozYcp",
  );

  Map<String, dynamic> toJson() => {
    "icon": iconValues.reverse[icon],
    "text": text,
    "link": link,
  };
}

enum Icon {
  FAS_FA_FILE_DOWNLOAD,
  FA_SOLID_FA_BOOK_OPEN,
  FA_SOLID_FA_CIRCLE_INFO,
  FA_SOLID_FA_LIST_CHECK
}

final iconValues = EnumValues({
  "fas fa-file-download": Icon.FAS_FA_FILE_DOWNLOAD,
  "fa-solid fa-book-open": Icon.FA_SOLID_FA_BOOK_OPEN,
  "fa-solid fa-circle-info": Icon.FA_SOLID_FA_CIRCLE_INFO,
  "fa-solid fa-list-check": Icon.FA_SOLID_FA_LIST_CHECK
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
