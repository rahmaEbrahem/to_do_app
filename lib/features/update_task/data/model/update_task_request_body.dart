class UpdateTaskRequestBody {
  final String title;
  final String description;
  final String status;
  final String priority;

  UpdateTaskRequestBody({
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "status": status,
      "priority": priority,
    };
  }
}
