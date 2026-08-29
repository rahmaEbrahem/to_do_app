class Homemodel {
  List<Data>? data;
  Meta? meta;
  dynamic error;

  Homemodel({this.data, this.meta, this.error});

  Homemodel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    error = json["error"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    if (meta != null) {
      _data["meta"] = meta?.toJson();
    }
    _data["error"] = error;
    return _data;
  }
}

class Meta {
  int? currentPage;
  int? lastPage;
  int? perPage;
  int? numberOfPages;
  int? total;

  Meta({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.numberOfPages,
    this.total,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json["current_page"];
    lastPage = json["last_page"];
    perPage = json["per_page"];
    numberOfPages = json["number_of_pages"];
    total = json["total"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["current_page"] = currentPage;
    _data["last_page"] = lastPage;
    _data["per_page"] = perPage;
    _data["number_of_pages"] = numberOfPages;
    _data["total"] = total;
    return _data;
  }
}

class Data {
  int? taskId;
  String? title;
  String? description;
  String? status;
  String? deliveryDate;
  String? priority;
  String? createdAt;

  Data({
    this.taskId,
    this.title,
    this.description,
    this.status,
    this.deliveryDate,
    this.priority,
    this.createdAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    taskId = json["taskId"];
    title = json["title"];
    description = json["description"];
    status = json["status"];
    deliveryDate = json["deliveryDate"];
    priority = json["priority"];
    createdAt = json["createdAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["taskId"] = taskId;
    _data["title"] = title;
    _data["description"] = description;
    _data["status"] = status;
    _data["deliveryDate"] = deliveryDate;
    _data["priority"] = priority;
    _data["createdAt"] = createdAt;
    return _data;
  }
}
