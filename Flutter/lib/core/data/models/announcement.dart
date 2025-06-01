class Announcement {
  final String announcerName;
  final String announcerImage;
  final String announcementImage;
  final String announcementText;
  final String timeAgo;
  final String tag;

  Announcement({
    required this.announcerName,
    required this.announcerImage,
    required this.announcementImage,
    required this.announcementText,
    required this.timeAgo,
    required this.tag,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      announcerName: json['announcer_name'],
      announcerImage: json['announcer_image'],
      announcementImage: json['announcement_image'],
      announcementText: json['announcement_text'],
      timeAgo: json['time_ago'],
      tag: json['tag'],
    );
  }
}