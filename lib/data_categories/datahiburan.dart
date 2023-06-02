class DataHiburan {
  String gambar,
      judul,
      penulis,
      harga;


  DataHiburan (
      this.gambar,
      this.judul,
      this.penulis,
      this.harga

      );
}

final List<DataHiburan> entertainment = [
  DataHiburan(
      'assets/hiburan1.jpg',
      '100 hari mengenal diri',
      'Mprop Picoez al-Jingini',
      'Rp.48.000'
  ),
  DataHiburan(
      'assets/hiburan2.jpg',
      'Sukses Bisnis modal dengkul itupun dengkul orang',
      'Edi AH Iyubenu',
      'Rp.40.000'
  ),

];
