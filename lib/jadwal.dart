import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({Key? key}) : super(key: key);

  @override
  _JadwalPageState createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  String? selectedDate;
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F1),
      appBar: AppBar(
        backgroundColor: Color(0xFFDF2155),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFFDF2155),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/doctor_image.png'),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/online.svg',
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Online',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                    offset: Offset(0, 3), // changes position of shadow
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
                          'Dr. Yuri Yunita',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Pediatrician',
                          style: TextStyle(fontSize: 16, color: Color(0xFF333333)),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              '99 years old  ',
                              style: TextStyle(fontSize: 13, color: Color(0xFF333333)),
                            ),
                            Icon(Icons.thumb_up, size: 16),
                            Text(
                              ' 0.1%',
                              style: TextStyle(fontSize: 13, color: Color(0xFF333333)),
                            ),
                          ],
                        ),
                        SizedBox(height: 1),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Color(0xFFCDD9EE),
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Rp50.000',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                            SizedBox(width: 5),
                            Row(
                              children: [
                                Text(
                                  'Graduated from  ',
                                  style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 70, 70, 70)),
                                ),
                                Text(
                                  'Universitas Cirebon',
                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 35, 34, 34)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset('assets/practice.png', width: 20, height: 20),
                            SizedBox(width: 5),
                            Row(
                              children: [
                                Text(
                                  'Practices at  ',
                                  style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 70, 70, 70)),
                                ),
                                Text(
                                  'RSUP dr. Sardjito, DI Yogyakarta',
                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 35, 34, 34)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.document_scanner, size: 20, color: Color(0xFF6B79BF)),
                            SizedBox(width: 5),
                            Text('STR Number'),
                          ],
                        ),
                        SizedBox(height: 5), // Jarak antara STR Number dan teks
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '00011122233444',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF333333)),
                            ),
                            IconButton(
                              icon: Icon(Icons.copy, size: 16), // Perkecil ukuran ikon salin
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
            SizedBox(height: 10), // Kurangi jarak
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jadwal Dokter',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Image.asset('assets/calendar.png', width: 20, height: 20),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '29 Mei 2024 - 4 Juni 2024',
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
                  SizedBox(height: 10),
                  buildSchedule('Rabu, 29 Mei 2024', ['08.00', '09.00', '11.00', '16.00', '16.30', '19.00', '20.00']),
                  buildSchedule('Kamis, 30 Mei 2024', ['08.00', '09.00', '11.00', '16.00', '16.30', '19.00', '20.00']),
                  buildSchedule('Jumat, 31 Mei 2024', ['08.00', '09.00', '11.00', '16.00', '16.30', '19.00', '20.00']),
                  buildSchedule('Sabtu, 1 Juni 2024', ['08.00', '09.00', '11.00', '16.00', '16.30', '19.00', '20.00']),
                  buildSchedule('Minggu, 2 Juni 2024', ['08.00', '09.00', '11.00', '16.00', '16.30', '19.00', '20.00']),
                  buildSchedule('Senin, 3 Juni 2024', ['08.00', '09.00', '11.00', '16.00', '16.30', '19.00', '20.00']),
                  buildSchedule('Selasa, 4 Juni 2024', ['08.00', '09.00', '11.00', '16.00', '16.30', '19.00', '20.00']),
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Pilih sesi konsultasi',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 5),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: times.map((time) {
                bool isBooked = time == '08.00' || time == '16.00' || time == '20.00';
                bool isSelected = selectedDate == date && selectedTime == time;
                return GestureDetector(
                  onTap: () {
                    if (!isBooked) {
                      setState(() {
                        selectedDate = date;
                        selectedTime = time;
                      });
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Atur padding untuk memperlebar rectangle
                    backgroundColor: isBooked
                        ? Colors.grey[300]
                        : isSelected
                            ? Color.fromARGB(255, 200, 226, 191)
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