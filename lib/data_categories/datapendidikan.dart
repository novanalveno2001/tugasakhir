class DataPendidikan {
  String gambar,
      judul,
      penulis,
      harga;


  DataPendidikan (
      this.gambar,
      this.judul,
      this.penulis,
      this.harga

      );
}

final List<DataPendidikan> education = [
  DataPendidikan(
      'assets/pendidikan1.jpg',
      'SURVIVAL TEACHER',
      'Asrul Right',
      'Rp.38.400'
  ),
  DataPendidikan(
      'assets/pendidikan2.jpg',
      'REINVENTING SCHOOL',
      'Asrul Right dan Okfalisa',
      'Rp.56.000'
  ),

];
