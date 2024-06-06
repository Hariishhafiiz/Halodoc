import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rekmed/service/auth_service.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:rekmed/model/user/user_profile.dart';
import 'package:rekmed/service/navigation_service.dart';

class InfoCustService extends StatefulWidget {
  const InfoCustService({Key? key}) : super(key: key);

  @override
  State<InfoCustService> createState() => _InfoCustServiceState();
}

class _InfoCustServiceState extends State<InfoCustService> {
  final GetIt _getIt = GetIt.instance;
  late AuthService _authService;
  late String? name;
  late NavigationService _navigationService;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _authService = _getIt.get<AuthService>();
    _navigationService = _getIt.get<NavigationService>();
    // name = _authService.user!.displayName;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 3) { // Jika ikon Inbox dipilih
        _navigationService.pushReplacementNamed("/home");
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('assets/ProfileIcon.png'),
                ),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Haikal',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
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
                physics: NeverScrollableScrollPhysics(),
                children: [
                  buildFeatureButton(context, 'Chat dengan Dokter', 'assets/ChatDokter.png'),
                  buildFeatureButton(context, 'Toko Kesehatan', 'assets/TokoKesehatan.png'),
                  buildFeatureButton(context, 'Home Lab & Vaksinasi', 'assets/HomeLabVaksinasi.png'),
                  buildFeatureButton(context, 'Asuransiku', 'assets/Asuransiku.png'),
                  buildFeatureButton(context, 'Kesehatan Mental', 'assets/KesehatanMental.png'),
                  buildFeatureButton(context, 'Haloskin', 'assets/Haloskin.png'),
                  buildFeatureButton(context, 'Buat Janji Offline', 'assets/BuatJanjiOffline.png'),
                  buildFeatureButton(context, 'Lihat Semua', 'assets/LihatSemua.png'),
                ],
              ),
              buildPromoSection(),
              buildProductSection('Tenang Menjaga Keluarga', [
                'Injeksi Vit C',
                'Medical Check Up',
                'Hematologi Lengkap',
                'Vaksin HPV',
                'Cek Ginjal'
              ]),
              buildProductSection('Produk Paling Diinginkan', [
                'Acne Skin Care',
                'Cough & Flu',
                'Vitamin',
                'Mom & Baby Care',
                'Kontrasepsi Wanita',
                'Asma',
                'Disfungsi Ereksi'
              ]),
              buildArticleSection(),
              SizedBox(height: 8),
            ],
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 180, // Adjust the width as needed
        height: 45,
        child: FloatingActionButton(
          onPressed: () {
            // Add your chat functionality here
          },
          backgroundColor: Color(0xFFDF2155),
          child: Center(
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



      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildFeatureButton(BuildContext context, String title, String imagePath) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(title: title)));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 40, height: 40),
          SizedBox(height: 8),
          Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
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
          Text('Promo Menarik', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Container(
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
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Container(
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
            SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
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
              Text('Read 100+ New Articles', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              OutlinedButton(
                onPressed: () {},
                child: Text('See All', style: TextStyle(color: Colors.red, fontSize: 12)),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.red, width: 1),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  minimumSize: Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: OutlinedButton(
              onPressed: () {},
              child: Text('All', style: TextStyle(fontSize: 12)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey, width: 1),
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          Container(
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
              child: Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;

  DetailPage({required this.title});

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
