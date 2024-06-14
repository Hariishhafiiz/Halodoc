import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/dummy_doctors.dart';
import 'package:my_app/models/user/user_profile.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:my_app/services/database_service.dart';
import 'package:my_app/services/navigation_service.dart';
import 'package:my_app/view/pages/chat_pages.dart';

class JadwalPage extends StatefulWidget {
  final Doctor doctor;
  const JadwalPage({super.key, required this.doctor});

  @override
  _JadwalPageState createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  String? selectedDate;
  String? selectedTime;

  final GetIt _getIt = GetIt.instance;
  late AuthService _authService;
  late DatabaseService _databaseService;
  late NavigationService _navigationService;

  @override
  void initState() {
    super.initState();
    _authService = _getIt.get<AuthService>();
    _databaseService = _getIt.get<DatabaseService>();
    _navigationService = _getIt.get<NavigationService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDF2155),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButton: selectedDate != null && selectedTime != null
          ? FloatingActionButton.extended(
              onPressed: () async {
                final chatExists = await _databaseService.checkDoctorChatExists(
                  _authService.user!.uid,
                  widget.doctor.id,
                );
                if (!chatExists) {
                  await _databaseService.createNewDoctorChat(
                      _authService.user!.uid, widget.doctor.id);
                }
                _navigationService.push(MaterialPageRoute(builder: (context) {
                  return ChatPage(
                    chatUser: UserProfile(
                      uid: widget.doctor.id,
                      name: widget.doctor.name,
                      pfpURL: widget.doctor.imageUrl,
                      role: 'doctor',
                    ),
                  );
                }));
              },
              label: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Hubungi dokter',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              backgroundColor: const Color(0xFFDF2155),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFDF2155),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/doctor_image.jpg'),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/online.svg',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Online',
                          style:
                              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.doctor.name,
                          style:
                              const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.doctor.speciality,
                          style: const TextStyle(fontSize: 16, color: Color(0xFF333333)),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              '${widget.doctor.age} years old  ',
                              style:
                                  const TextStyle(fontSize: 13, color: Color(0xFF333333)),
                            ),
                            const Icon(Icons.thumb_up, size: 16),
                            Text(
                              ' ${widget.doctor.rating}%',
                              style:
                                  const TextStyle(fontSize: 13, color: Color(0xFF333333)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 1),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: const Color(0xFFCDD9EE),
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.doctor.price,
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/gradu.png', width: 20, height: 20),
                            const SizedBox(width: 5),
                            Row(
                              children: [
                                const Text(
                                  'Graduated from  ',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 70, 70, 70)),
                                ),
                                Text(
                                  widget.doctor.university,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 35, 34, 34)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset('assets/practice.png', width: 20, height: 20),
                            const SizedBox(width: 5),
                            const Row(
                              children: [
                                Text(
                                  'Practices at  ',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 70, 70, 70)),
                                ),
                                Text(
                                  'RSUP dr. Sardjito, DI Yogyakarta',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 35, 34, 34)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(Icons.document_scanner,
                                size: 20, color: Color(0xFF6B79BF)),
                            SizedBox(width: 5),
                            Text('STR Number'),
                          ],
                        ),
                        const SizedBox(height: 5), // Jarak antara STR Number dan teks
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.doctor.id,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF333333)),
                            ),
                            IconButton(
                              icon: const Icon(Icons.copy,
                                  size: 16), // Perkecil ukuran ikon salin
                              onPressed: () {
                                // Aksi untuk menyalin STR Number
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10), // Kurangi jarak
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jadwal Dokter',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Image.asset('assets/calendar.png', width: 20, height: 20),
                      const SizedBox(width: 5),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '17 Juni 2024 - 23 Juni 2024',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Durasi waktu satu sesi konsultasi adalah 30 menit',
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  buildSchedule('Senin, 17 Juni 2024',
                      ['08.00', '09.00', '11.00', '16.00', '16.30', '19.00', '20.00']),
                  buildSchedule('Selasa, 18 Juni 2024',
                      ['08.00', '09.00', '11.00', '16.00', '16.30', '19.00', '20.00']),
                  buildSchedule('Rabu, 19 Juni 2024',
                      ['08.00', '09.00', '11.00', '16.00', '16.30', '19.00', '20.00']),
                  buildSchedule('Kamis, 20 Juni 2024',
                      ['08.00', '09.00', '11.00', '16.00', '16.30', '19.00', '20.00']),
                  buildSchedule('Jumat, 21 Juni 2024',
                      ['08.00', '09.00', '11.00', '16.00', '16.30', '19.00', '20.00']),
                  buildSchedule('Sabtu, 22 Juni 2024',
                      ['08.00', '09.00', '11.00', '16.00', '16.30', '19.00', '20.00']),
                  buildSchedule('Minggu, 23 Juni 2024',
                      ['08.00', '09.00', '11.00', '16.00', '16.30', '19.00', '20.00']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSchedule(String date, List<String> times) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.only(left: 0, right: 35, top: 16, bottom: 16),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'Pilih sesi konsultasi',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 5),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: times.map((time) {
                bool isBooked = time == '08.00' || time == '16.00' || time == '20.00';
                bool isSelected = selectedDate == date && selectedTime == time;
                return GestureDetector(
                  onTap: () {
                    if (!isBooked) {
                      if (selectedDate == date && selectedTime == time) {
                        setState(() {
                          selectedDate = null;
                          selectedTime = null;
                        });
                      } else {
                        setState(() {
                          selectedDate = date;
                          selectedTime = time;
                        });
                      }
                    }
                  },
                  child: Chip(
                    label: Text(
                      time,
                      style: TextStyle(
                        fontSize: 12, // Perkecil ukuran font
                        color: isBooked ? Colors.red : Colors.black,
                        fontWeight: isBooked ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8), // Atur padding untuk memperlebar rectangle
                    backgroundColor: isBooked
                        ? Colors.grey[300]
                        : isSelected
                            ? const Color.fromARGB(255, 200, 226, 191)
                            : const Color.fromARGB(255, 255, 255, 255),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
