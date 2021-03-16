class VxTimelineModel {
  final int id;
  final String heading;
  final String description;
  final String? actionUrl;

  const VxTimelineModel(
      {required this.id,
      required this.heading,
      required this.description,
      this.actionUrl});
}
