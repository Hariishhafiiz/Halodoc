class Doctor {
  final String id;
  final String name;
  final String speciality;
  final String imageUrl;
  final String language;
  final String gender;
  final int rating;
  final int age;
  final String price;
  final String university;

  Doctor({
    required this.id,
    required this.name,
    required this.speciality,
    required this.imageUrl,
    required this.language,
    required this.gender,
    required this.rating,
    required this.age,
    required this.price,
    required this.university,
  });
}

final List<Doctor> dummyDoctors = [
  Doctor(
    id: '786646446',
    name: 'Dr. John Doe',
    speciality: 'Pediatrician',
    imageUrl: 'assets/doctor_image.png',
    language: 'English',
    gender: 'Male',
    rating: 90,
    age: 45,
    price: '90.000',
    university: 'Harvard University',
  ),
  Doctor(
    id: '295917694',
    name: 'Dr. Dewi Puspitasari',
    speciality: 'Dentist',
    imageUrl: 'assets/doctor_image.png',
    language: 'Indonesia',
    gender: 'Female',
    rating: 87,
    age: 40,
    price: '100.000',
    university: 'Universitas Indonesia',
  ),
  Doctor(
    id: '875149671',
    name: 'Dr. Alex Tan',
    speciality: 'Pulmonologist',
    imageUrl: 'assets/doctor_image.png',
    language: 'English',
    gender: 'Male',
    rating: 95,
    age: 50,
    price: '110.000',
    university: 'Stanford University',
  ),
  Doctor(
    id: '376163860',
    name: 'Dr. Sarah Wijaya',
    speciality: 'Surgeon',
    imageUrl: 'assets/doctor_image.png',
    language: 'Indonesia',
    gender: 'Female',
    rating: 99,
    age: 35,
    price: '120.000',
    university: 'Universitas Gadjah Mada',
  ),
  Doctor(
    id: '527813842',
    name: 'Dr. Michael Quinlan',
    speciality: 'Neurologist',
    imageUrl: 'assets/doctor_image.png',
    language: 'English',
    gender: 'Male',
    rating: 84,
    age: 55,
    price: '130.000',
    university: 'Yale University',
  ),
  Doctor(
    id: '433680841',
    name: 'Dr. Agnes Maria',
    speciality: 'Surgeon',
    imageUrl: 'assets/doctor_image.png',
    language: 'Indonesia',
    gender: 'Female',
    rating: 75,
    age: 30,
    price: '140.000',
    university: 'Universitas Padjadjaran',
  ),
];