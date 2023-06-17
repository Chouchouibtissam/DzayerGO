import 'package:flutter/foundation.dart';
import '../Models/EventModel.dart';

class EventNotifier with ChangeNotifier {
  List<Event> _eventList = [];
  String _filter = '';

  List<Event> get eventList => _eventList;
  String get filter => _filter;

  void setEvents(List<Event> events) {
    _eventList = events;
    notifyListeners();
  }

  void updateFilter(String filter) {
    _filter = filter;
    notifyListeners();
  }
  void updateEventList(List<Event> events) {
    _eventList = events;
    notifyListeners();
  }

}
