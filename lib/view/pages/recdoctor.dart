import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/models/user/user_profile.dart';
import 'package:my_app/services/database_service.dart';
import 'package:my_app/view/pages/jadwal_page.dart';
import 'package:my_app/globals.dart' as globals;
import 'package:my_app/dummy_doctors.dart';

class ChatWithDoctorPage extends StatefulWidget {
  const ChatWithDoctorPage({super.key});

  @override
  _ChatWithDoctorPageState createState() => _ChatWithDoctorPageState();
}

class _ChatWithDoctorPageState extends State<ChatWithDoctorPage> {
  final GetIt _getIt = GetIt.instance;
  bool isFilterExpanded = false;

  List<Doctor> filteredDoctors = [];
  late DatabaseService _databaseService;

  @override
  void initState() {
    super.initState();
    _databaseService = _getIt.get<DatabaseService>();

    loadDoctors();
  }

  Future<void> loadDoctors() async {
    UserProfile doctor = await _databaseService.getDoctor();
    Doctor doctorObj = Doctor(
      id: doctor.uid!,
      name: doctor.name ?? "Dokter A",
      speciality: 'Pediatrician',
      imageUrl: 'assets/doctor_image.png',
      language: 'English',
      gender: 'Male',
      rating: 90,
      age: 45,
      price: '90.000',
      university: 'Harvard University',
    );

    setState(() {
      filteredDoctors = [doctorObj, ...dummyDoctors];
    });
  }

  List<String> selectedSpecialities = [];
  List<String> selectedLanguages = [];
  List<String> selectedGenders = [];
  List<String> selectedSorted = [];

  void filterDoctors() {
    setState(() {
      filteredDoctors = dummyDoctors.where((doctor) {
        bool matchesSpeciality = selectedSpecialities.isEmpty ||
            selectedSpecialities.contains(doctor.speciality);
        bool matchesLanguage =
            selectedLanguages.isEmpty || selectedLanguages.contains(doctor.language);
        bool matchesGender =
            selectedGenders.isEmpty || selectedGenders.contains(doctor.gender);

        return matchesSpeciality && matchesLanguage && matchesGender;
      }).toList();
      if (selectedSorted.contains('rating')) {
        filteredDoctors.sort((a, b) => b.rating.compareTo(a.rating));
      } else {
        filteredDoctors = dummyDoctors.where((doctor) {
          bool matchesSpeciality = selectedSpecialities.isEmpty ||
              selectedSpecialities.contains(doctor.speciality);
          bool matchesLanguage =
              selectedLanguages.isEmpty || selectedLanguages.contains(doctor.language);
          bool matchesGender =
              selectedGenders.isEmpty || selectedGenders.contains(doctor.gender);

          return matchesSpeciality && matchesLanguage && matchesGender;
        }).toList();
      }
    });
  }

  void toggleSpeciality(String speciality) {
    setState(() {
      if (selectedSpecialities.contains(speciality)) {
        selectedSpecialities.remove(speciality);
      } else {
        selectedSpecialities.add(speciality);
      }
      filterDoctors();
    });
  }

  void toggleLanguage(String language) {
    setState(() {
      if (selectedLanguages.contains(language)) {
        selectedLanguages.remove(language);
      } else {
        selectedLanguages.add(language);
      }
      filterDoctors();
    });
  }

  void toggleGender(String gender) {
    setState(() {
      if (selectedGenders.contains(gender)) {
        selectedGenders.remove(gender);
      } else {
        selectedGenders.add(gender);
      }
      filterDoctors();
    });
  }

  void toggleSorted(String sort) {
    setState(() {
      if (selectedSorted.contains(sort)) {
        selectedSorted.remove(sort);
      } else {
        selectedSorted.add(sort);
      }
      filterDoctors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDF2155),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Text(
                globals.lang == 'en' ? 'Chat with Doctor' : 'Chat dengan Dokter',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            color: const Color(0xFFDF2155),
            width: double.infinity,
            height: 80,
            child: const Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  SearchBar(),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isFilterExpanded = !isFilterExpanded;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      isFilterExpanded
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Text(
                        'Filter by',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            constraints: BoxConstraints(
              minHeight: isFilterExpanded ? 40.0 : 0.0,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: isFilterExpanded
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 3.0, 18.0, 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Specialities',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Color(0xFF5F5F5F),
                          ),
                        ),
                        FilterSection(
                          filterChips: [
                            FilterChipWidget(
                                label: 'Pediatrician',
                                assetPath: 'assets/pediatrician.svg',
                                isSelected: selectedSpecialities.contains('Pediatrician'),
                                onSelected: () => toggleSpeciality('Pediatrician')),
                            FilterChipWidget(
                                label: 'Dentist',
                                assetPath: 'assets/dentist.svg',
                                isSelected: selectedSpecialities.contains('Dentist'),
                                onSelected: () => toggleSpeciality('Dentist')),
                            FilterChipWidget(
                                label: 'Pulmonologist',
                                assetPath: 'assets/pulmonologist.svg',
                                isSelected:
                                    selectedSpecialities.contains('Pulmonologist'),
                                onSelected: () => toggleSpeciality('Pulmonologist')),
                            FilterChipWidget(
                                label: 'Surgeon',
                                assetPath: 'assets/surgeon.svg',
                                isSelected: selectedSpecialities.contains('Surgeon'),
                                onSelected: () => toggleSpeciality('Surgeon')),
                            FilterChipWidget(
                                label: 'Neurologist',
                                assetPath: 'assets/neuro.svg',
                                isSelected: selectedSpecialities.contains('Neurologist'),
                                onSelected: () => toggleSpeciality('Neurologist'))
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Language',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Color(0xFF5F5F5F),
                          ),
                        ),
                        FilterSection(
                          filterChips: [
                            FilterChipWidget(
                                label: 'Indonesia',
                                assetPath: 'assets/indonesia.svg',
                                isSelected: selectedLanguages.contains('Indonesia'),
                                onSelected: () => toggleLanguage('Indonesia')),
                            FilterChipWidget(
                                label: 'English',
                                assetPath: 'assets/english.svg',
                                isSelected: selectedLanguages.contains('English'),
                                onSelected: () => toggleLanguage('English')),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Gender',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Color(0xFF5F5F5F),
                          ),
                        ),
                        FilterSection(
                          filterChips: [
                            FilterChipWidget(
                                label: 'Female',
                                assetPath: 'assets/female copy.svg',
                                isSelected: selectedGenders.contains('Female'),
                                onSelected: () => toggleGender('Female')),
                            FilterChipWidget(
                                label: 'Male',
                                assetPath: 'assets/male.svg',
                                isSelected: selectedGenders.contains('Male'),
                                onSelected: () => toggleGender('Male')),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Sort',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Color(0xFF5F5F5F),
                          ),
                        ),
                        FilterSection(
                          filterChips: [
                            FilterChipWidget(
                                label: 'Rating',
                                assetPath: 'assets/thumbs-up.svg',
                                isSelected: selectedSorted.contains('rating'),
                                onSelected: () => toggleSorted('rating')),
                          ],
                        ),
                      ],
                    ),
                  )
                : null,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecommendedDoctorsSection(doctors: filteredDoctors),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 40.0,
        width: 330.0,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search Doctor',
            hintStyle: TextStyle(fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(8.0),
          ),
        ),
      ),
    );
  }
}

class FilterSection extends StatelessWidget {
  final List<FilterChipWidget> filterChips;

  const FilterSection({super.key, required this.filterChips});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: filterChips,
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;
  final String assetPath;
  final bool isSelected;
  final VoidCallback onSelected;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.assetPath,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(assetPath, height: 16, width: 16),
            const SizedBox(width: 4),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
        selected: isSelected,
        onSelected: (bool value) {
          onSelected();
        },
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.4),
        backgroundColor: Colors.white,
        selectedColor: const Color(0xFFDF2155).withOpacity(0.2),
        selectedShadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }
}

class RecommendedDoctorsSection extends StatelessWidget {
  final List<Doctor> doctors;

  const RecommendedDoctorsSection({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                globals.lang == 'en' ? 'Recommended Doctors' : 'Rekomendasi Dokter',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Text(
                'See All',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Color(0xFFDF2155),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ...doctors.map((doctor) => DoctorCard(doctor: doctor)),
      ],
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 249, 249, 249),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Image.asset(
                doctor.imageUrl,
                width: 70,
                height: 100,
              ),
              const SizedBox(width: 5),
              Baseline(
                baseline: -35,
                baselineType: TextBaseline.alphabetic,
                child: SvgPicture.asset(
                  'assets/online copy.svg',
                  width: 10,
                  height: 10,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      doctor.speciality,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${doctor.age} years old',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(children: [
                      const Icon(
                        Icons.thumb_up,
                        size: 14,
                        color: Color.fromARGB(180, 0, 0, 0),
                      ),
                      Text(
                        ' ${doctor.rating}%',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ]),
                    const SizedBox(height: 10),
                    Text(
                      doctor.language,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp ${doctor.price}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JadwalPage(
                      doctor: doctor,
                    )),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDF2155),
                  elevation: 7,
                ),
                child: const Text(
                  'Chat',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
