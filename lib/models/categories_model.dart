import 'dart:ffi';

class Kategori {
  List airTerjun;
  List rekreasi;
  List rekomendasi;

  Kategori(
      {required this.airTerjun,
      required this.rekreasi,
      required this.rekomendasi});
}

class Destinasi {
  String image;
  String namaDepan;
  String nama;
  String alamat;
  String alamatKec;
  String hariOp;
  String hariOpLainnya;
  String jamOp;
  String jamOpLainnya;
  bool camping;
  String tiket;
  String deskripsi;
  List<String> imageGalerys;
  double lat;
  double long;
  int likes;

  Destinasi({
    required this.image,
    required this.namaDepan,
    required this.nama,
    required this.alamat,
    required this.alamatKec,
    required this.hariOp,
    required this.hariOpLainnya,
    required this.jamOp,
    required this.jamOpLainnya,
    required this.camping,
    required this.tiket,
    required this.deskripsi,
    required this.imageGalerys,
    required this.lat,
    required this.long,
    required this.likes,
  });
}

class Rekreasi {
  String image;
  String namaDepan;
  String nama;
  String alamat;
  String alamatKec;
  String hariOp;
  String hariOpLainnya;
  String jamOp;
  String jamOpLainnya;
  String tiket;
  String penginapan;
  String deskripsi;
  double lat;
  double long;

  Rekreasi({
    required this.image,
    required this.namaDepan,
    required this.nama,
    required this.alamat,
    required this.alamatKec,
    required this.hariOp,
    required this.hariOpLainnya,
    required this.jamOp,
    required this.jamOpLainnya,
    required this.tiket,
    required this.penginapan,
    required this.deskripsi,
    required this.lat,
    required this.long,
  });
}

class Rekomend {
  String image;
  String namaDepan;
  String nama;
  String alamat;
  String alamatKec;
  String hariOp;
  String hariOpLainnya;
  String jamOp;
  String jamOpLainnya;
  bool camping;
  String tiket;
  String deskripsi;
  List<String> imageGalerys;
  double lat;
  double long;
  int likes;

  Rekomend({
    required this.image,
    required this.namaDepan,
    required this.nama,
    required this.alamat,
    required this.alamatKec,
    required this.hariOp,
    required this.hariOpLainnya,
    required this.jamOp,
    required this.jamOpLainnya,
    required this.camping,
    required this.tiket,
    required this.deskripsi,
    required this.imageGalerys,
    required this.lat,
    required this.long,
    required this.likes,
  });
}

List<Kategori> categories = [
  Kategori(
    airTerjun: [
      Destinasi(
          image: 'assets/images/curug-ciampea.jpg',
          namaDepan: '',
          nama: 'Curug Ciampea',
          alamat: 'Desa Tapos I',
          alamatKec: 'Kecamatan Tenjolaya',
          hariOp: 'Setiap Hari',
          hariOpLainnya: '',
          jamOp: '07:00 - 17:30',
          jamOpLainnya: '',
          camping: false,
          tiket: '22.000',
          deskripsi: 'Curug Ciampea Bogor adalah salah satu Wisata',
          imageGalerys: [
            'assets/images/curug-ciampea-kemah.jpg',
            'assets/images/curug-ciampea-green-lagoon.webp'
          ],
          lat: -6.6867448,
          long: 106.6999085,
          likes: 0),
      Destinasi(
          image: 'assets/images/tenjolaya-park.jpg',
          namaDepan: '',
          nama: 'Curug Ciputri',
          alamat: 'Desa Tapos I',
          alamatKec: 'Kecamatan Tenjolaya',
          hariOp: 'Setiap Hari',
          jamOp: '08:00 - 17:00',
          hariOpLainnya: '',
          jamOpLainnya: '',
          camping: true,
          tiket: '50.000',
          deskripsi:
              'Curug Ciampea Bogor adalah salah satu pesona alam yang berada di kaki Gunung Salak. pada kawasan tersebut memiliki kandungan air yang jernih, serta pesona alam air terjun yang banyak, sehingga layak untuk dikunjungi.',
          imageGalerys: ['assets/images/curug-ciampea-kemah.jpg'],
          lat: -6.6762553,
          long: 106.7069437,
          likes: 5),
    ],
    rekreasi: [
      Rekreasi(
        image: 'assets/images/tenjolaya-park.jpg',
        namaDepan: '',
        nama: 'Tenjolaya Park',
        alamat: 'Gunung Malang',
        alamatKec: 'Kecamatan Tenjolaya',
        hariOp: 'Setiap Hari',
        jamOp: '07:00 - 17:30',
        hariOpLainnya: '',
        jamOpLainnya: '',
        tiket: '10.000',
        penginapan: 'Tersedia',
        deskripsi:
            'Wisata Kampung Istal Bogor menyuguhkan pesona alam yang begitu memukau, Pemandangan hijau berupa view Gunung Salak Bogor dipadukan dengan hawa sejuk khas pegunungan akan menjadi sajian utama di tempat wisata ini, Selain itu wisata populer di Bogor ini tentunya memiliki fasilitas dan wahana seru untuk dinikmati wisatawan.',
        lat: -6.6689736,
        long: 106.7035867,
      ),
      Rekreasi(
        image: 'assets/images/curug-ciampea.jpg',
        namaDepan: '',
        nama: 'Kampung Istal',
        alamat: 'Gunung Malang',
        alamatKec: 'Kecamatan Tenjolaya',
        hariOp: 'Setiap Hari',
        jamOp: '07:00 - 17:30',
        hariOpLainnya: '',
        jamOpLainnya: '',
        tiket: '10.000',
        penginapan: 'Tersedia',
        deskripsi:
            'Wisata Kampung Istal Bogor menyuguhkan pesona alam yang begitu memukau, Pemandangan hijau berupa view Gunung Salak Bogor dipadukan dengan hawa sejuk khas pegunungan akan menjadi sajian utama di tempat wisata ini, Selain itu wisata populer di Bogor ini tentunya memiliki fasilitas dan wahana seru untuk dinikmati wisatawan.',
        lat: -6.664888,
        long: 106.7114566,
      ),
      Rekreasi(
        image: 'assets/images/curug-ciampea.jpg',
        namaDepan: '',
        nama: 'Aldepos Salaca',
        alamat: 'Desa Tapos II',
        alamatKec: 'Kecamatan Tenjolaya',
        hariOp: 'Setiap Hari',
        jamOp: '07:00 - 17:30',
        hariOpLainnya: '',
        jamOpLainnya: '',
        tiket: 'Gratis',
        penginapan: 'Tersedia',
        deskripsi:
            'Wisata Kampung Istal Bogor menyuguhkan pesona alam yang begitu memukau, Pemandangan hijau berupa view Gunung Salak Bogor dipadukan dengan hawa sejuk khas pegunungan akan menjadi sajian utama di tempat wisata ini, Selain itu wisata populer di Bogor ini tentunya memiliki fasilitas dan wahana seru untuk dinikmati wisatawan.',
        lat: -6.6329829,
        long: 106.6948005,
      ),
    ],
    rekomendasi: [],
  )
];
