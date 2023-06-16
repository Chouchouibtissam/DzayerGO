import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import '../Notifiers/eventNotifier.dart';
import 'package:dzayergo/Models/EventModel.dart';

class EventService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late final db = FirebaseDatabase.instance.ref();

  //Getting data from collection
  getEvents(EventNotifier eventNotifier) async {
    List<Event> _eventList = [];

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Events')
        .get()
        .then((value) {

      value.docs.forEach((doc) {
        Event event = Event.fromMap(doc.data());
        _eventList.add(event);

        /*Print the data
        print('Event Data:');
        print('Title: ${event.Title}');
        print('Wilaya: ${event.wilaya}');
        print('Date: ${event.Date}');
        print('---');*/
      });

      return value;
    });

    eventNotifier.updateEventList(_eventList);
  }
}
