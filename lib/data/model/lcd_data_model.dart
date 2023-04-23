// ignore_for_file: public_member_api_docs, sort_constructors_first
class LCDData {
  final String lcdName;
  final String lcdId;
  final String lcdBrand;
  final String lcdPorts;
  final String lcdResolution;
  final String lcdStatus;
  final String lcdWeight;
  LCDData({
    required this.lcdName,
    required this.lcdId,
    required this.lcdBrand,
    required this.lcdPorts,
    required this.lcdResolution,
    required this.lcdStatus,
    required this.lcdWeight,
  });

  factory LCDData.fromFirestoreMap(Map<String, dynamic> map) {
    return LCDData(
      lcdName: map['lcd_name'] ?? '',
      lcdId: map['lcd_id'] ?? '',
      lcdBrand: map['brand'] ?? '',
      lcdPorts: map['port'] ?? '',
      lcdResolution: map['resolution'] ?? '',
      lcdStatus: map['status'] ?? '',
      lcdWeight: map['weight'] ?? '',
    );
  }
}
