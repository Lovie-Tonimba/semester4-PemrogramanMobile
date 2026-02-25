int calculate() {
  return 6 * 7;
}

// SOAL 1
// untuk menyimpan fungsi perhitungan BMI
double hitungBmi(double berat, double tinggi) {

  // ubah tinggi dari cm ke meter dulu
  double tinggiMeter = tinggi / 100;

  // rumus BMI yaitu berat / (tinggi * tinggi)
  return berat / (tinggiMeter * tinggiMeter);
}

// SOAL 2
// untuk menghitung konversi berdasarkan nilai mata uang yang ditentukan
double hitungKonversi(double rupiah, double mataUang) {
  // rumusnya yaitu jumlah uang / nilai mataUang
  return rupiah / mataUang;
}

// SOAL 3
// berisi jenis-jenis operator
// 1. aritmatika dan 2. Penugasan
double hitungTotalPajak(double harga, int jumlah) {
  double subtotal = harga * jumlah; // aritmatika *
  subtotal += (subtotal * 0.11);    // penugasan += (misal PPN 11%)
  return subtotal;
}
// 3. relasional dan 4. Logika
bool cekKelayakanBonus(double total, bool member) {
  // disini bonus diberikan jika (Total > 100rb DAN Member) ATAU (Total > 500rb)
  return (total > 100000 && member) || (total > 500000);
}
// 5. kondisional (ternary)
String dapatkanPesan(bool layak) {
  return layak ? "Selamat anda mendapat bonus kupon" : "tidak ada bonus";
}

// CHALLENGE
class konversi{
  // nilai 1 unit jika dijadikan meter, misalnya 1 km = 1000 m dsb.
  final Map<String, double> panjang = {'km': 1000, 'm': 1, 'dm': 0.1, 'cm': 0.01, 'mm': 0.001};
  final Map<String, double> massa = {'kg': 1000, 'hg': 100, 'g': 1, 'dg': 0.1, 'mg': 0.001};
  final Map<String, double> volume = {'kl': 1000, 'l': 1, 'dl': 0.1, 'cl': 0.01, 'ml': 0.001};

  // konversi sederhana
  double hitung(double nilai, String dari, String ke, Map<String, double> unitMap) {
    // nilai dikali angka pengali asal, lalu dibagi angka pengali tujuan
    return (nilai * unitMap[dari]!) / unitMap[ke]!;
  }

  // khusus suhu karena rumusnya tidak bisa pakai Map perkalian
  double hitungSuhu(double n, String dari, String ke) {
    if (dari == 'C' && ke == 'F') return (n * 9 / 5) + 32;
    if (dari == 'C' && ke == 'K') return n + 273.15;
    return n; 
  }
}