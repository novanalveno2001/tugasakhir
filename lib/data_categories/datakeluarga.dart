class DataKeluarga {
  String gambar,
      judul,
      penulis,
      harga;


  DataKeluarga (
      this.gambar,
      this.judul,
      this.penulis,
      this.harga

      );
}

final List<DataKeluarga> family = [
  DataKeluarga(
      'assets/family1.jpg',
      'MOTHERS JOURNEY',
      'Sarah Fransisca',
      'Rp.56.000'
  ),
  DataKeluarga(
      'assets/family2.jpg',
      'EVERY CHILD IS SPECIAL',
      'Mega Sinta Wulandari',
      'Rp.44.000'
  ),

];
