class TaskModel {
  final String id;
  final String title;
  final String? description;
  final bool? isComplete;

  TaskModel({
    required this.id,
    required this.title,
    this.description,
    this.isComplete,
  });
}
