import 'package:jobsheet2/jobsheet2.dart' as jobsheet2;

void main() {
  print('===== Tugas Praktikum 2: Kalkulator Konversi Mata Uang =====');
  // contoh jumlah uang rupiah
  double jumlahRupiah = 1000000.0;

  // nilai mata uang saat ini
  final double usd = 16815; // Dollar Amerika
  final double jpy = 107.30;   // Yen Jepang
  final double eur = 19796; // Euro Eropa

  // memanggil fungsi dari lib untuk menghitung konversi
  double hasilUsd = jobsheet2.hitungKonversi(jumlahRupiah, usd);
  double hasilJpy = jobsheet2.hitungKonversi(jumlahRupiah, jpy);
  double hasilEur = jobsheet2.hitungKonversi(jumlahRupiah, eur);

  print('Jumlah Uang    : Rp $jumlahRupiah');
  print('1. Dollar (AS) : \$$hasilUsd');
  print('2. Yen (Jepang): ¥$hasilJpy');
  print('3. Euro (Eropa): €$hasilEur');
}