import 'package:flutter/material.dart';
import 'package:my_app/globals.dart' as globals;

class OnboardingPage extends StatefulWidget {
  final Function(Locale) setLocale;

  const OnboardingPage({super.key, required this.setLocale});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool _isExpanded = false;
  Locale _selectedLocale = const Locale('id');

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void _selectLanguage(Locale locale) {
    setState(() {
      _selectedLocale = locale;
      _isExpanded = false;
    });
    widget.setLocale(locale);
    globals.lang = locale.languageCode;
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
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Image.asset(
                  'assets/LanguageOnboarding.png',
                  height: 322,
                ),
              ),
              const SizedBox(height: 0),
              Text(
                globals.lang == 'en' ? 'Choose language preferences' : 'Pilih preferensi bahasa',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _toggleExpand,
                child: Container(
                  width: 225,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.shade100.withOpacity(0.2),
                    border: Border.all(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(languageImage, width: 24),
                                const SizedBox(width: 10),
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
                                      _selectLanguage(const Locale('en'));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      decoration: const BoxDecoration(
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
                                          const SizedBox(width: 10),
                                          const Text('English (UK)'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]
                              : [
                                  GestureDetector(
                                    onTap: () {
                                      _selectLanguage(const Locale('id'));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      decoration: const BoxDecoration(
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
                                          const SizedBox(width: 10),
                                          const Text('Indonesia'),
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
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(globals.lang == 'en' ? 'Next' : 'Lanjut'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
