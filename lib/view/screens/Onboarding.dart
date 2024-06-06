import 'package:flutter/material.dart';
import 'package:rekmed/service/navigation_service.dart';
import 'package:get_it/get_it.dart';

class OnboardingPage extends StatefulWidget {
  final Function(Locale) setLocale;

  OnboardingPage({required this.setLocale});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool _isExpanded = false;
  Locale _selectedLocale = Locale('id');
  final GetIt _getIt = GetIt.instance;

  late NavigationService _navigationService;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void initState() {
    super.initState();
    _navigationService = _getIt.get<NavigationService>();
  }

  void _selectLanguage(Locale locale) {
    setState(() {
      _selectedLocale = locale;
      _isExpanded = false;
    });
    widget.setLocale(locale);
    // You might want to save the language preference here
  }

  @override
  Widget build(BuildContext context) {
    String languageText =
        _selectedLocale.languageCode == 'id' ? 'Indonesia' : 'English (UK)';
    String languageImage = _selectedLocale.languageCode == 'id'
        ? 'assets/indonesia.png'
        : 'assets/english.png';

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0), // Menambah padding atas
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Image.asset(
                  'assets/LanguageOnboarding.png', // Pastikan path ke gambar benar
                  height: 322,
                ),
              ),
              SizedBox(
                  height: 0), // Mengatur jarak antara gambar dan teks menjadi 0
              Text(
                'Choose language preferences',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                  color: Color(
                      0xFF333333), // Mengatur warna teks menjadi hitam dengan kode 333333
                ),
              ),
              SizedBox(
                  height: 10), // Mengatur jarak antara teks dan opsi bahasa
              GestureDetector(
                onTap: _toggleExpand,
                child: Container(
                  width: 225, // Mengurangi lebar container
                  decoration: BoxDecoration(
                    color: Colors.redAccent.shade100.withOpacity(0.2),
                    border: Border.all(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(languageImage, width: 24),
                                SizedBox(width: 10),
                                Text(languageText),
                              ],
                            ),
                            GestureDetector(
                              onTap: _toggleExpand,
                              child: Icon(
                                _isExpanded
                                    ? Icons.expand_more
                                    : Icons.chevron_right,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_isExpanded)
                        Column(
                          children: _selectedLocale.languageCode == 'id'
                              ? [
                                  GestureDetector(
                                    onTap: () {
                                      _selectLanguage(Locale('en'));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset('assets/english.png',
                                              width: 24),
                                          SizedBox(width: 10),
                                          Text('English (UK)'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]
                              : [
                                  GestureDetector(
                                    onTap: () {
                                      _selectLanguage(Locale('id'));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset('assets/indonesia.png',
                                              width: 24),
                                          SizedBox(width: 10),
                                          Text('Indonesia'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                        ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 30.0), // Add padding for the button
                child: ElevatedButton(
                  onPressed: () async {
                    _navigationService.pushReplacementNamed("/login");
                  },
                  child: Text('Next'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent, // Background color
                    foregroundColor: Colors.white, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
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
