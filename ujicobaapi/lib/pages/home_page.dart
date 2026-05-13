import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _weatherService = WeatherService('1b58436569e89fe17a328ed1c11d7564');

  final List<String> _cities = [
    "Malang",
    "Palu",
    "Jakarta",
    "Bandung",
    "Surabaya",
    "Denpasar",
    "Makassar",
    "Jayapura",
  ];

  List<Weather> _weatherList = [];
  bool _isLoading = true;

  _fetchAllWeather() async {
    List<Weather> tempWeathers = [];

    try {
      String currentCity = await _weatherService.getCurrentCity();
      final currentWeather = await _weatherService.getWeather(currentCity);
      tempWeathers.add(currentWeather);
    } catch (e) {
      print("Gagal ambil lokasi otomatis, lewati... Error: $e");
    }

    // 2. Ambil kota favorit
    for (String city in _cities) {
      if (tempWeathers.isNotEmpty &&
          tempWeathers[0].cityName.toLowerCase() == city.toLowerCase()) {
        continue;
      }

      try {
        final weather = await _weatherService.getWeather(city);
        tempWeathers.add(weather);

        // TAMBAHAN: Beri jeda setengah detik sebelum lanjut ke kota berikutnya
        await Future.delayed(const Duration(milliseconds: 500));
      } catch (e) {
        print("Gagal mengambil data kota $city: $e");
      }
    }

    setState(() {
      _weatherList = tempWeathers;
      _isLoading = false;
    });
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'haze':
      case 'fog':
        return 'assets/cloud.json';
      case 'rain':
      case 'drizzle':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchAllWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlue[400]!, Colors.lightBlue[100]!],
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                "WEATHER APP",
                style: GoogleFonts.bebasNeue(
                  color: Colors.white,
                  fontSize: 32,
                  letterSpacing: 2,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  icon: const Icon(
                    Icons.power_settings_new,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),

            _isLoading
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      itemCount: _weatherList.length,
                      itemBuilder: (context, index) {
                        final weather = _weatherList[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    weather.cityName,
                                    style: GoogleFonts.inter(
                                      color: Colors.grey[900],
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    weather.mainCondition,
                                    style: GoogleFonts.inter(
                                      color: Colors.grey[700],
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: Lottie.asset(
                                      getWeatherAnimation(
                                        weather.mainCondition,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${weather.temperature.round()}°',
                                    style: GoogleFonts.oswald(
                                      color: Colors.grey[900],
                                      fontSize: 50,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

            Padding(
              padding: const EdgeInsets.only(bottom: 30.0, top: 10),
              child: Column(
                children: [
                  Text(
                    "Lovie Jechonia Tonimba",
                    style: GoogleFonts.inter(
                      color: Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "NIM: 244107060101",
                    style: GoogleFonts.inter(
                      color: Colors.grey[500],
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
