class Items {
  int id;
  String nama;
  int harga;
  int jumlah;
  String deks;
  String image;

  Items({
    required this.id,
    required this.nama,
    required this.harga,
    required this.jumlah,
    required this.deks,
    required this.image,
  });
}

final List<Items> item = [
  Items(
    id: 1,
    nama: 'MANTIQ',
    harga: 50000,
    jumlah: 3,
    deks: 'Ilmu Mantiq adalah ilmu yang mempelajari ....',
    image: 'assets/buku1.jpg',
  ),
  Items(
    id: 2,
    nama: 'MADILOG',
    harga: 40000,
    jumlah: 2,
    deks: 'Ilmu Madilog adalah ilmu yang mempelajari ....',
    image: 'assets/buku2.jpg',
  ),
  Items(
    id: 3,
    nama: 'MUHAMMADKU SAYANGKU 3',
    harga: 55000,
    jumlah: 4,
    deks: 'Ilmu Mantiq adalah ilmu yang mempelajari ....',
    image: 'assets/buku3.jpg',
  ),
];
