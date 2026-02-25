import 'package:jobsheet2/jobsheet2.dart' as jobsheet2;

void main(){
  print('===== Tugas Praktikum 1: Mengitung BMI =====');

  // inputan ditetapkan di awal
  double beratBadan = 52.0; 
  double tinggiBadan = 155.0;

  // memanggil fungsi dari file lib
  double hasilBmi = jobsheet2.hitungBmi(beratBadan, tinggiBadan);

  // menentukan status dengan operator if-else relasional
  String status;
  if (hasilBmi < 18.5) {
    status = "Kurus";
  } else if (hasilBmi >= 18.5 && hasilBmi <= 24.9) {
    status = "Ideal";
  } else {
    status = "Gemuk";
  }

  print('Berat Badan  : $beratBadan kg');
  print('Tinggi Badan : $tinggiBadan cm');
  print('Skor BMI     : $hasilBmi');
  print('Status       : $status');
}