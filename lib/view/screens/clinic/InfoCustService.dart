import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Info Customer Service',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
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
                    'Masuk/Daftar',
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
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: buildCustomerServiceSection(),
          ),
        ],
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

  Widget buildCustomerServiceSection() {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Customer Service'),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: LinearGradient(
                    colors: [Color(0xFFDF2155), Color(0xFFC52F71), Color(0xFF93304A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    side: BorderSide(width: 1.0, color: Colors.transparent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/IconCS.png', width: 20, height: 20),
                      SizedBox(width: 8),
                      Text(
                        'Chat sekarang',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
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
