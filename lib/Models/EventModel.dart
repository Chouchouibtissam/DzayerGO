import '../Services/Event_Service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String? Event_Id;
  String? Title;
  String? Date;
  String? wilaya;

  Event({this.Event_Id, this.Title, this.Date, this.wilaya});

  // Sending Event details to the server
  Map<String, dynamic> toMap() {
    return {
      'EventId': Event_Id,
      'Title': Title,
      'date': Date,
      'Wilaya': wilaya,
    };
  }

  // Getting Event details from server
  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      Event_Id: map['EventId'],
      Title: map['Title'],
      Date: map['date'] is Timestamp
          ? (map['date'] as Timestamp).toDate().toString()
          : null,
      wilaya: map['Wilaya'],
    );
  }

  EventService eventService = EventService();
}
