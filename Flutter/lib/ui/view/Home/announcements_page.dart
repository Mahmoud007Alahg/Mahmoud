import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../core/data/models/announcement.dart';
import 'announcement_card.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({super.key});

  @override
  _AnnouncementsPageState createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  late Future<List<Announcement>> futureAnnouncements;

  @override
  void initState() {
    super.initState();
    futureAnnouncements = fetchAnnouncements();
  }

  Future<List<Announcement>> fetchAnnouncements() async {
    final response = await http.get(Uri.parse("https://example.com/api/announcements"));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Announcement.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load announcements");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الإعلانات")),
      body: FutureBuilder<List<Announcement>>(
        future: futureAnnouncements,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("حدث خطأ: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: snapshot.data!.map((announcement) => AnnouncementCard(
                announcerName: announcement.announcerName,
                announcerImage: announcement.announcerImage,
                announcementImage: announcement.announcementImage,
                announcementText: announcement.announcementText,
                timeAgo: announcement.timeAgo,
                tag: announcement.tag,
              )).toList(),
            );
          } else {
            return const Center(child: Text("لا توجد بيانات متاحة"));
          }
        },
      ),
    );
  }
}