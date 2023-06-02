class DataBahasa {
  String gambar,
      judul,
      penulis,
      harga;


  DataBahasa (
      this.gambar,
      this.judul,
      this.penulis,
      this.harga

      );
}

final List<DataBahasa> bahasa = [
  DataBahasa(
      'assets/sosial1.jpg',
      'CATATAN PARA MANTAN',
      'Mprop Picoez al-Jingini',
      'Rp.90.000'
  ),
  DataBahasa(
      'assets/sosial2.jpg',
      'MADILOG',
      'Tan Malaka',
      'Rp.96.000'
  ),
];
