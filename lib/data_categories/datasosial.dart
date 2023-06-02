class DataSosial {
  String gambar,
      judul,
      penulis,
      harga;


  DataSosial (
      this.gambar,
      this.judul,
      this.penulis,
      this.harga

      );
}

final List<DataSosial> sosials = [
  DataSosial(
      'assets/sosial1.jpg',
      'CATATAN PARA MANTAN',
      'Mprop Picoez al-Jingini',
      'Rp.90.000'
  ),
  DataSosial(
      'assets/sosial2.jpg',
      'MADILOG',
      'Tan Malaka',
      'Rp.96.000'
  ),
];
