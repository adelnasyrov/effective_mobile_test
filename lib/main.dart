import 'package:effective_mobile_test/view/booking_view.dart';
import 'package:effective_mobile_test/view/room_view.dart';
import 'package:flutter/material.dart';
import 'view/hotel_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontFamily: 'SFProDisplay',
      ),
      child: MaterialApp(
        title: 'emTest',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, background: const Color(0xffF6F6F9)),
          useMaterial3: true,
        ),
        routes: {
          '/hotel': (context) => const HotelView(),
          '/room': (context) => const RoomView(),
          '/booking': (context) => const BookingView(),
        },
        initialRoute: '/hotel',
      ),
    );
  }
}
