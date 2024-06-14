import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/models/user/user_profile.dart';
import 'package:my_app/services/auth_service.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:my_app/models/user/user_profile.dart';
import 'package:my_app/services/navigation_service.dart';
import 'package:my_app/view/screens/chat/Assistant.dart';
import 'package:my_app/services/database_service.dart';
import 'package:my_app/globals.dart' as globals;
import 'package:my_app/view/pages/recdoctor.dart';


class InfoCustService extends StatefulWidget {
  const InfoCustService({super.key});

  @override
  State<InfoCustService> createState() => _InfoCustServiceState();
}

class _InfoCustServiceState extends State<InfoCustService> {
  final GetIt _getIt = GetIt.instance;
  final authService = AuthService();
  late String name;
  late NavigationService _navigationService;
  late DatabaseService _databaseService;
  late UserProfile? userProfile;
  // int _selectedIndex = 0;
  

  @override
  void initState() {
    super.initState();
    _navigationService = _getIt.get<NavigationService>();
    _databaseService = _getIt.get<DatabaseService>();
  }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     if (index == 3) { // Jika ikon Inbox dipilih
  //       _navigationService.pushReplacementNamed("/home");
  //     }
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          FutureBuilder<UserProfile?>(
            future: _databaseService.getCurrentUserProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/ProfileIcon.png'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Loading...',
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/ProfileIcon.png'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Error',
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasData && snapshot.data != null) {
                final userProfile = snapshot.data!;
                return Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: userProfile.pfpURL != null
                          ? NetworkImage(userProfile.pfpURL!)
                          : const AssetImage('assets/ProfileIcon.png') as ImageProvider,
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        // Add navigation or action here if needed
                      },
                      child: Text(
                        userProfile.name ?? 'Guest',
                        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                );
              } else {
                return Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/ProfileIcon.png'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Guest',
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          const Row(
            children: [
              Text('Pogung Kidul', style: TextStyle(color: Colors.black, fontSize: 15.0)),
              Icon(Icons.location_on, color: Colors.red),
            ],
          ),
        ],
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  buildFeatureButton(context, globals.lang == 'en' ? 'Chat with Doctor' : 'Chat dengan Dokter', 'assets/ChatDokter.png'),
                  buildFeatureButton(context, globals.lang == 'en' ? 'Health Store' : 'Toko Kesehatan', 'assets/TokoKesehatan.png'),
                  buildFeatureButton(context, globals.lang == 'en' ? 'Home lab and vaccination' : 'Home Lab & Vaksinasi', 'assets/HomeLabVaksinasi.png'),
                  buildFeatureButton(context, globals.lang == 'en' ? 'My Insurace' : 'Asuransiku', 'assets/Asuransiku.png'),
                  buildFeatureButton(context, globals.lang == 'en' ? 'Mental Health' : 'Kesehatan Mental', 'assets/KesehatanMental.png'),
                  buildFeatureButton(context, 'Haloskin', 'assets/Haloskin.png'),
                  buildFeatureButton(context, globals.lang == 'en' ? 'Make Offline Appointment' : 'Buat Janji Offline', 'assets/BuatJanjiOffline.png'),
                  buildFeatureButton(context, globals.lang == 'en' ? 'See All' : 'Lihat Semua', 'assets/LihatSemua.png'),
                ],
              ),
              buildPromoSection(),
              buildProductSection(globals.lang == 'en' ? 'Take Care of Your Family' : 'Tenang Menjaga Keluarga', [
                globals.lang == 'en' ? 'Vitamin C Injection' : 'Injeksi Vit C',
                'Medical Check Up',
                globals.lang == 'en' ? 'Complete Hematology' : 'Hematologi Lengkap',
                globals.lang == 'en' ? 'HPV Vaccine' : 'Vaksin HPV',
                globals.lang == 'en' ? 'Kidney Check' : 'Cek Ginjal'
              ]),
              buildProductSection(globals.lang == 'en' ? 'Most Desired Product' : 'Produk Paling Diinginkan', [
                'Acne Skin Care',
                'Cough & Flu',
                'Vitamin',
                'Mom & Baby Care',
                globals.lang == 'en' ? 'Female Contraception' : 'Kontrasepsi Wanita',
                globals.lang == 'en' ? 'Asthma' : 'Asma',
                globals.lang == 'en' ? 'Erectile Dysfunction' : 'Disfungsi Ereksi'
              ]),
              buildArticleSection(),
              const SizedBox(height: 8),
            ],
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 180, // Adjust the width as needed
        height: 45,
        child: FloatingActionButton(
          onPressed: () {
            _navigationService
              .push(MaterialPageRoute(builder: (context){
                return const Assistant();
                }
              )
            );
          },
          backgroundColor: const Color(0xFFDF2155),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Aligns icon and text at the center horizontally
              children: [
                Icon(Icons.chat, color: Colors.white),
                SizedBox(width: 8), // Adjust the spacing between icon and text as needed
                Flexible(
                  child: Text(
                    'Customer Service',
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis, // Handles overflow by ellipsizing text
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,



      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.history),
      //       label: 'History',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.mail),
      //       label: 'Inbox',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.more_horiz),
      //       label: 'More',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.red,
      //   unselectedItemColor: Colors.grey,
      //   onTap: _onItemTapped,
      // ),
    );
  }

  Widget buildFeatureButton(BuildContext context, String title, String imagePath) {
    return InkWell(
      onTap: () {
        if (title == 'Chat dengan Dokter' || title == 'Chat with Doctor') {
          _navigationService
              .push(MaterialPageRoute(builder: (context){
                return const ChatWithDoctorPage();
                }
              )
            );
          return;
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(title: title)));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 40, height: 40),
          const SizedBox(height: 8),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget buildPromoSection() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(globals.lang == 'en' ? 'Best Deals' : 'Promo Menarik', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 151,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildPromoCard('assets/Promo1.png'),
                buildPromoCard('assets/Promo2.png'),
                buildPromoCard('assets/Promo3.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPromoCard(String imagePath) {
    return Card(
      child: Image.asset(imagePath, width: 400, fit: BoxFit.cover),
    );
  }

  Widget buildProductSection(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return buildProductCard(items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductCard(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        width: 83,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/StethoscopeIcon.png', width: 30, height: 30),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget buildArticleSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(globals.lang == 'en' ? 'Read 100+ New Articles' : 'Baca 100+ Artikel Baru', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red, width: 1),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text('See All', style: TextStyle(color: Colors.red, fontSize: 12)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.grey, width: 1),
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text('All', style: TextStyle(fontSize: 12)),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildArticleCard('Folikulitis Bikin Gatal dan Nyeri? Dokter Ini Paham Pengobatannya', 'assets/Article1.png'),
                buildArticleCard('7 Hal yang Bisa Menjaga Kesehatan Tulang Belakang', 'assets/Article1.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildArticleCard(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
        ),
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity, height: 150),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Page for $title'),
      ),
    );
  }
}
