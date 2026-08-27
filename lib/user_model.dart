class UserModel {
  // 1. Properti/Variabel Utama
  final String id; 
  final String name; 
  final String? email; 
  final int age; 
  final bool isActive;

  // 2. Constructor Utama (Named Parameters)
  UserModel({
    required this.id,
    required this.name,
    this.email, // Tidak required karena nullable ( String? )
    required this.age,
    required this.isActive,
  });

  // 3. Factory Constructor (Deserialization: JSON -> Objek Dart)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String? ?? '', // Default ke string kosong jika null
      name: json['name'] as String? ?? 'Unknown User', // Default 'Unknown User'
      email: json['email'] as String?, // Nullable, tidak pakai default
      age: json['age'] as int? ?? 0, // Default ke 0 jika null
      isActive: json['isActive'] as bool? ?? false, // Default ke false jika null
    );
  }

  // 4. Method toJson (Serialization: Objek Dart -> Map/JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'isActive': isActive,
    };
  }
}

// 5. Eksekusi dan Pengujian (Fungsi Main)
void main() {
  // Simulasi data JSON dari API di mana ada field yang hilang/null ('id', 'email', 'isActive')
  Map<String, dynamic> jsonResponse = {
    'name': 'Budi Santoso',
    'age': 22,
  };

  // Konversi JSON ke Objek (Aman dari crash berkat Null Safety & Fallback ??)
  UserModel user = UserModel.fromJson(jsonResponse);

  // Cetak hasil
  print('Nama: ${user.name}');
  print('ID: ${user.id}');
  print('Status: ${user.isActive}');

  // Konversi kembali Objek ke JSON
  print('To JSON: ${user.toJson()}');
}