class NameUser {
  final String nama;

  NameUser(this.nama);


  NameUser.fromJson(Map<String, dynamic> json) : nama = json['nama'];

  Map<String, dynamic> toJson() => {
    'nama': nama,

  };
}

class emailUser {
  final String email;

  emailUser(this.email);


  emailUser.fromJson(Map<String, dynamic> json) : email = json['email'];

  Map<String, dynamic> toJson() => {
    'email': email,
  };
}

class phoneUser {
  final String phone;

  phoneUser(this.phone);


  phoneUser.fromJson(Map<String, dynamic> json) : phone = json['phone'];

  Map<String, dynamic> toJson() => {
    'phone': phone,
  };
}