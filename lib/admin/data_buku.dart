

class Buku {
  int? id;
  String? gambar;
  String? judul;
  String? penerbit;
  String? penulis;
  String? tahun;
  String? harga;
  String? desc;

  Buku({
    this.id,
    this.gambar,
    this.judul,
    this.penerbit,
    this.penulis,
    this.tahun,
    this.harga,
    this.desc
  });

  Map<String, dynamic> toMap() {
    var book = Map<String, dynamic>();

    if(id != null) {
      book['id'] = id;
    }
    book['gambar'] = gambar;
    book['judul'] = judul;
    book['penerbit'] = penerbit;
    book['penulis'] = penulis;
    book['tahun'] = tahun;
    book['harga'] = harga;
    book['desc'] = desc;

    return book;

  }

  Buku.fromMap(Map<String, dynamic> book) {
    this.id = book['id'];
    this.gambar = book['gambar'];
    this.judul = book['judul'];
    this.penerbit = book['penerbit'];
    this.penulis = book['penulis'];
    this.tahun = book['tahun'];
    this.harga = book['harga'];
    this.desc = book['desc'];
  }

}