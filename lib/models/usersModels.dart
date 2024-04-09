class User {
  dynamic id;
  String? nama;
  String? email;
  String? jk;
  String? alamat;
  String? agama;

  User(
      {this.id,
      this.nama,
      this.email,
      this.jk,
      this.alamat,
      this.agama});

  factory User.createUser(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      nama: json['nama'] ?? '',
      email: json['email'] ?? '',
      jk: json['jk'] ?? '',
      agama: json['agama'] ?? '',
      alamat: json['alamat'] ?? '',
    );
  }

  
}
