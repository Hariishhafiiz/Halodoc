// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class ClinicProfile extends StatefulWidget {
  const ClinicProfile({super.key});

  @override
  ClinicProfileState createState() => ClinicProfileState();
}

class ClinicProfileState extends State<ClinicProfile> {
  String clinicName = 'Cahaya Mitra';
  String clinicUsername = 'CahayaMitra1';
  String clinicEmail = 'cahayamitra@example.com';
  String clinicPhone = '0812-3456-7890';
  String clinicAddress = 'Bulaksumur G.13';
  String clinicBPJS = '0087R002';
  String clinicSatuSehat = 'CahayaMitra1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Akun',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/RekmedLogo.png',
                      height: 50,
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Informasi Akun',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              Divider(color: Colors.teal),
              InfoRow(
                title: 'Nama Klinik',
                value: clinicName,
                onSave: (newValue) {
                  setState(() {
                    clinicName = newValue;
                  });
                },
              ),
              InfoRow(
                title: 'Username Klinik',
                value: clinicUsername,
                onSave: (newValue) {
                  setState(() {
                    clinicUsername = newValue;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Informasi Klinik',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              Divider(color: Colors.teal),
              InfoRow(
                title: 'E-mail Klinik',
                value: clinicEmail,
                onSave: (newValue) {
                  setState(() {
                    clinicEmail = newValue;
                  });
                },
              ),
              InfoRow(
                title: 'No. Telepon',
                value: clinicPhone,
                onSave: (newValue) {
                  setState(() {
                    clinicPhone = newValue;
                  });
                },
              ),
              InfoRow(
                title: 'Alamat Klinik',
                value: clinicAddress,
                onSave: (newValue) {
                  setState(() {
                    clinicAddress = newValue;
                  });
                },
              ),
              InfoRow(
                title: 'No. BPJS',
                value: clinicBPJS,
                onSave: (newValue) {
                  setState(() {
                    clinicBPJS = newValue;
                  });
                },
              ),
              InfoRow(
                title: 'No. SatuSehat',
                value: clinicSatuSehat,
                onSave: (newValue) {
                  setState(() {
                    clinicSatuSehat = newValue;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;
  final Function(String)? onSave;

  InfoRow({required this.title, required this.value, this.onSave});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  TextEditingController controller =
                      TextEditingController(text: value);
                  return Theme(
                    data: Theme.of(context).copyWith(
                      textSelectionTheme: TextSelectionThemeData(
                        cursorColor: Colors.teal,
                        selectionHandleColor: Colors.teal,
                      ),
                    ),
                    child: AlertDialog(
                      title: Text('Edit $title'),
                      content: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: "$title",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.teal),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.teal),
                          ),
                          onPressed: () {
                            if (onSave != null) {
                              onSave!(controller.text);
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Row(
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
