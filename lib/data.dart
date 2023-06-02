class Book {
  String title,
   writer,
   price,
   image,
   penerbit,
   tahun,
   description;
  int pages;
  double rating;

  Book (
      this.title,
      this.writer,
      this.penerbit,
      this.tahun,
      this.description,
      this.price,
      this.image,
      this.rating,
      this.pages);


}

final List<Book> books = [
  Book('MUHAMMADKU SAYANGKU 3',
      'Edi Ah iyubenu',
      'Diva Press',
      '2021',
      'Segalanya, semuanya, seluruhnya, dikarenakan terbekahinya cinta di hati kita kepada Kanjeng Nabi Saw.Bila sekeping hati telah dikebaki terima kasih, bangga, gembira, dan bahagia kepada Kanjeng Nabi Saw, tepat seketika Allah Ta’ala bertahta di dalam hati yang sama.Allah Ta’ala dan Kanjeng Nabi Saw adalah satu kesatuan (“sepaket”); pada suatu pengertian dapat dipahami Satu Wujud—Ahmad tanpa Mim adalah Ahad.Isyfa’ lana ya RasulaLlah!',
      'Rp 40.000',
      'assets/buku1.jpg',
      6.5,
      124),
  Book('DONGENG MBAH JIWO',
      'Sudjiwo Tedjo',
      'Diva Press',
      '2021',
      'Cerita di dalam buku itu, sangat-sangat menarik maknanya. Sejujurnya itu kenyataan yang kita alami di rimba Indonesia ini, he he .... Saya terpengaruh ajaran dia menyebut rimba. Saran saya kepada para anak muda, bacalah buku ini tapi siapkan diri untuk cerdas berfikir agar mengerti alam pikir Kyai Sujiwo Tejo. Banyak pemahaman yang sangat luas dari cerita-cerita di buku ini. Seperti hikayat tapi persis seperti kenyataan rimba Indonesia saat ini. Selamat membaca!',
      'Rp 70.000',
      'assets/buku2.jpg',
      4.5,
      238),
  Book('MANTIQ',
      'Aziz Anwar Fachrudin',
      'Ircisod',
      '2021',
      'Ketika ‘ilmu alat’ disebut, umumnya orang yang belajar ilmu-ilmu keislaman hari ini cenderung akan mengasosiasikannya dengan gramatika bahasa Arab, yakni nahwu (sintaksis) dan sharf (morfologi). Namun, khazanah klasik Islam menyebut mantiq sebagai ilmu alat juga. “Waba’du fal-manthiqu lil-jan?ni # nisbatuhu kan-na?wi lil-lis?ni”, demikian tulis Al-Akhdhari (w. 1575) dalam nazam As-Sullam al-Munawraq. “Mantiq bagi pikiran ialah seperti nahwu bagi bahasa.”',
      'Rp 56.000',
      'assets/buku3.jpg',
      4.0,
      222),
  Book('TENTANG KITA DAN LAUT',
      'Yetti A.KA',
      'Diva Press',
      '2021',
      'Sejak itu juga, aku makin sering saja membayangkan kau berdiri di laut dan memandang ikan-ikan dengan berbagai kejadian aneh menyertainya—tergantung aku maunya seperti apa. Aku tidak tahu rasanya menjadi dirimu. Pasti saja sulit.',
      'Rp 48.000',
      'assets/buku4.jpg',
      3.0,
      120),
  Book('SIRAH NABAWIYAH',
      'Syaikh Shafiyur Rahman al-Mubarakpuri',
      'Diva Press',
      '2021',
      'Membaca buku sirah Nabi Saw ini barangkali akan terasa unik. Mengapa? Sebab, buku ini memberikan gambaran nyata tentang kehidupan Nabi Saw, berdasarkan apa yang dianggap sebagai sumber-sumber akurat dan dapat dipercaya oleh para akademisi serta sejarawan Islam. Tidak sedikit pun ada usaha untuk “memodernkan” Nabi Saw dengan menunjukkan beberapa sifat Nabi Saw yang saat ini banyak kita jumpai, atau dengan membuat atau membenarkan apa pun yang akan dianggap “tidak tepat secara politik” oleh sebagian pembaca.',
      'Rp 110.000',
      'assets/buku5.jpg',
      5.5,
      362),
  Book('PULANG KE RINJANI',
      'Reza Nufa',
      'Diva Press',
      '2021',
      'Berjalan kaki tidaklah istimewa. Semua orang melakukannya. Namun pada awal 2016 sebuah mimpi tentang hamparan savana mendorongku untuk melakukannya dengan lebih jauh. Bersama hasrat untuk bunuh diri, masa lalu yang serba ungu, dan secuil harapan untuk menemukan kembali lajur-lajur yang hilang dalam hidup, kumulai langkah pertama menuju puncak Gunung Rinjani, dari Ciputat, kurang lebih 1700 kilometer panjangnya.',
      'Rp 95.000',
      'assets/buku6.jpg',
      3.0,
      444),
  Book('SEPOTONG HATI DI ANGKRINGAN',
      'Oleh Joko Pinurbo',
      'Diva Press',
      '2021',
      'Pada suatu malam yang nyamnyam, kau menemukan sepotong hati yang lezat dalam sebungkus nasi kucing. Kau mengira itu hati ibumu atau hati kekasihmu. Namun, bisa saja itu hati orang yang pernah kausakiti atau menyakitimu. Angkringan adalah nama sebuah sunyi, tempat kau melerai hati, lebih-lebih saat hatimu disakiti sepi.',
      'Rp 50.000',
      'assets/buku7.jpg',
      2.5,
      80),
  Book('SESAUDARA DALAM IMAN',
      'Oleh Edi Ah iyubenu',
      'Diva Press',
      '2021',
      '“Jadikanlah orang lain bagai timbangan bagimu: lakukanlah kepada mereka apa yang kamu ingin mereka lakukan padamu dan jangan lakukan kepada mereka apa yang kamu tak ingin mereka lakukan padamu.” —Sayyidina Ali bin Abi Thalib',
      'Rp 60.000',
      'assets/buku8.jpg',
      4.5,
      324),
  Book('ADAB DI ATAS ILMU',
      'Oleh Imam Nawawi',
      'Diva Press',
      '2021',
      'Sepintar apa pun seseorang, namun ia tidak memiliki adab, gugurlah nilai semua pengetahuannya; tak dapat dijadikan rujukan, takkan pula memproduksi kebaikan-kebaikan. Bahkan amal-amal ibadahnya pun tak bernilai apa-apa bila tidak dihiasi dengan adab. Hal ini karena adab merupakan pondasi agama. Aku diutus hanya untuk memperbaiki adab-adab (yang baik), sabda Kanjeng Nabi Saw.',
      'Rp 48.000',
      'assets/buku9.jpg',
      3.5,
      200),
  Book('WAYAHE NGOPI 2',
      'Tri Wibowo BS',
      'Diva Press',
      '2022',
      'Perihal ilmunya, buku ini memiliki karakter yang berbeda dengan buku sebelumnya, Wayahe Ngopi 1. Buku ini lebih teoritik, bahkan akademik, meski di banyak bagiannya teruntai refleksi-refleksi mendalam sebagai jabaran dan keterangan elaboratif khas personal-penulis terhadap tokoh-tokoh tasawuf dan teori-teori yang sedang didedahkan',
      'Rp 56.000',
      'assets/agama1.jpg',
      3.5,
      262),
  Book('DINAMIKA ISLAM MILENIAL',
      'Prof. Dr. H. Faisal Ismail, M.A',
      'Ircisod',
      '2022',
      'Buku ini menghimpun berbagai refleksi atas dinamika kehidupan yang sangat beragam dan bervariasi sesuai isu-isu yang mencuat ke permukaan dan perlu mendapat sorotan, tanggapan, dan ulasan. Isu-isu aktual tentang Islam, Pancasila, NKRI, praktik syariah hingga diskursus demokrasi menghiasi bagian-bagian buku ini.',
      'Rp 56.000',
      'assets/agama2.jpg',
      4.5,
      370),
  Book('CATATAN PARA MANTAN',
      'Bambang Eka Cahya Widodo dkk.',
      'Ircisod',
      '2022',
      'Yang menarik dari buku ini tentu saja adalah para penulisnya terlibat secara langsung dalam penyelenggaraan pemilu di Indonesia. Mereka mempunyai kelebihan dibandingkan pengamat atau akademisi, karena mereka adalah bagian dari fenomena yang dituliskan. Karya mereka adalah catatan dari lapangan, yang bukan didasarkan oleh riset akademik dengan waktu terbatas.',
      'Rp 90.000',
      'assets/sosial1.jpg',
      5.0,
      476),
  Book('MADILOG',
      'Tan Malaka',
      'Ircisod',
      '2022',
      'Pada perang Jepang-Tiongkok, tepatnya di Shanghai penghabisan tahun 1931, tiga hari lamanya saya terkepung di belakang jalan bernama North Sichuan Road, tempat peperangan pertama kali meletus. Dari North Sichuan Road tadi, Jepang menembak ke arah Po Shan Road dan tentara Tiongkok dari arah sebaliknya. Di antaranya, persisnya di kampung Wang Pan Cho, saya dengan pustaka saya terpaku. Sesudah dua atau tiga hari berselang, tentara Jepang baru memberi izin kepada kampung tempat saya tinggal untuk berpindah rumah, pergi ke tempat yang lebih aman dalam tempo lima menit saja.',
      'Rp 96.000',
      'assets/sosial2.jpg',
      5.0,
      534),
  Book('100 HARI MELIHAT DIRI',
      'Mprop Picoez al-Jingini',
      'Diva Press',
      '2020',
      '“Jika dengan jingan pun tak juga engkau berusaha mengenal dirimu, lalu bagaimana akan engkau jawab dari mana, sedang apa, akan kembali ke mana, dan untuk apa engkau diciptakan?” -Picoez al-Jingini “Gaya cerita refleksi atas masalah-masalah hidup umumnya kita, seperti ambisi, kecewa, marah, benci, bingung, gamang, kalut, dendam, aleman, dll., dituturkan dalam buku embuh ini melalui khutbah tumbuh-tumbuhan.',
      'Rp 48.000',
      'assets/motivasi1.jpeg',
      6.0,
      239),
  Book('SUKSES BISNIS MODAL DENGKUL, ITU PUN DENGKUL ORANG',
      'Edi AH Iyubenu',
      'Diva Press',
      '2020',
      'Impian sukses, lalu kaya, mengendon di kepala semua kita. Persoalannya, tak banyak dari kita yang mampu mengeksekusi impiannya. Lalu kendala-kendala disenaraikan sebagai biang kerok ketidakmungkinan eksekusinya. Padahal, aslinya, kendala-kendala itu ya dia sendirilah yang menciptakannya. Salah satunya ialah kendala modal. Tiadanya modal disebutkan sebagai kendala terbesarnya. Tak ada modal digelegarkan sebagai penyebab kegagalannya. Padahal, ia belum mulai juga, belum berbisnis, belum ke mana-mana. Ia bangkrut sebelum mulai, bahkan. Kan geli.... Lagi-lagi, aslinya, ya dia sendiri yang menjadikan perkara modal itu sebagai penghalangnya. Manfaatkan dengkul, dong.',
      'Rp 40.000',
      'assets/motivasi2.jpg',
      4.5,
      168),
  Book('SURVIVAL TEACHER',
      'Asrul Right',
      'Noktah',
      '2021',
      'Tidak banyak pribadi yang mau memaknai profesi guru secara mendalam. Padahal, semua itu dibangun oleh kesadaran diri yang benar-benar matang. Akibatnya, banyak sekali anak muda potensial yang di awal karier justru terjebak pada alur berpikir mengejar kemapanan. Ini tidak sepenuhnya salah memang. Agar mampu bertindak profesional, setiap orang sudah sepantasnya mendapat hak yang setimpal. ',
      'Rp 38.400',
      'assets/pendidikan1.jpg',
      3.5,
      260),
  Book('REINVENTING SCHOOL',
      'Asrul Right dan Okfalisa',
      'Laksana',
      '2021',
      'Buku yang sangat provokatif, kekinian, dan penuh gagasan, yang menantang conventional thinking serta ditulis dengan bahasa lugas sehingga enak dibaca. Bacaan alternatif yang mampu membuat Anda merenungi kembali makna-makna pendidikan seutuhnya. Bangsa Indonesia sangat membutuhkan guru-guru yang memiliki talenta, yang mampu beradaptasi dengan perkembangan zaman. Buku ini adalah jawabannya!',
      'Rp 56.000',
      'assets/pendidikan2.jpg',
      3.5,
      272),
  Book('MOTHERS JOURNEY',
      'Sarah Fransisca',
      'Noktah',
      '2021',
      'Di buku ini, penulis menceritakan perjalanannya sebagai mama muda. Mulai hamil dan mengalami kandungan lemah (inkompetensi serviks), berjuang agar ASI lancar, menyiapkan MPASI, hingga menjadi mama yang tetap produktif berkarya tanpa mengabaikan buah hati.',
      'Rp 56.000',
      'assets/family1.jpg',
      4.5,
      148),
  Book('EVERY CHILD IS SPECIAL',
      'Mega Sinta Wulandari',
      'Laksana',
      '2021',
      'Anak-anak hanyalah anak-anak. Ketika perilakunya tidak seperti yang Anda harapkan, bukan berarti ia adalah anak yang nakal. Jika anak tidak mau mendengarkan, tidak lantas ia harus dilabeli keras kepala. Apabila anak belum mampu atau lamban melakukan sesuatu, bukan berarti ia malas atau bodoh. Setiap anak spesial dengan caranya masing-masing.',
      'Rp 44.000',
      'assets/family2.jpg',
      4.0,
      192),

];

