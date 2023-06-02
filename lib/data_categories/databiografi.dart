class DataBiografi {
  String gambar,
      judul,
      penulis,
      harga;


  DataBiografi (
      this.gambar,
      this.judul,
      this.penulis,
      this.harga

      );
}

final List<DataBiografi> biografi = [
  DataBiografi(
      'assets/sosial1.jpg',
      'CATATAN PARA MANTAN',
      'Mprop Picoez al-Jingini',
      'Rp.90.000'
  ),
  DataBiografi(
      'assets/sosial2.jpg',
      'MADILOG',
      'Tan Malaka',
      'Rp.96.000'
  ),
];
