import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Notifiers/eventNotifier.dart';
import '../Services/Event_Service.dart';
import '../Models/EventModel.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  EventService eventService = EventService();
  final ScrollController _controller = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    EventNotifier eventNotifier =
    Provider.of<EventNotifier>(context, listen: false);
    eventService.getEvents(eventNotifier);
  }

  @override
  Widget build(BuildContext context) {
    EventNotifier eventNotifier = Provider.of<EventNotifier>(context);
    List<Event> filteredEventList = eventNotifier.eventList
        .where((event) =>
    event.wilaya!.toLowerCase().contains(eventNotifier.filter.toLowerCase()) ||
        eventNotifier.filter.isEmpty)
        .toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () => {},
              iconSize: 40,
              icon: const Icon(Icons.arrow_back_ios),
              color: const Color(0xff461A3E),
            ),
            const SizedBox(width: 10), // Add spacing between icon and text
            Text(
              'Les évenements à venir',
              style: TextStyle(
                color: const Color(0xff461A3E),
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
        body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 35,
                  right: 35,
                  top: 20,
                  bottom: 20,
                ),
                padding: const EdgeInsets.only(left: 25, right: 10),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.2,
                  ),
                  color: const Color(0x608b5486),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    eventNotifier.updateFilter(value);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Chercher un évenement',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    suffixIconColor: Color(0xff461A3E),
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(filteredEventList.length, (index) {
                  Event event = filteredEventList[index];
                  if (event.Title != null) {
                    return buildBox(event);
                  } else {
                    return Container();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBox(Event event) {
    String eventDate = event.Date!.split(' ')[0];
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
        top: 25,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/NotreDame.png',
              width: 170,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            event.Title!,
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.place_outlined,
                color: Color(0xff461A3E),
              ),
              Text(
                event.wilaya!,
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 40),
              Text(
                eventDate,
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
