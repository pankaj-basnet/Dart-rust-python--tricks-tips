String formatMeasurement(double value, String unit){
  return "$value $unit";
}

void main() {
  print('------ string concatenation  ---------');
  print(formatMeasurement(120, 'mmHg'));
}

// OUTPUT:
// ------ string concatenation  ---------
// 120.0 mmHg

