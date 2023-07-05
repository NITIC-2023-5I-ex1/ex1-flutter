class TODO{
  String title;
  String description;
  int priority;
  DateTime dueDate;

  TODO(this.title,this.description,this.priority,this.dueDate);

  String parseDate() {
    return "${dueDate.year} / ${dueDate.month} / ${dueDate.day}";
  }
}