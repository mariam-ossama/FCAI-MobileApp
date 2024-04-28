class StoreModel {
  int id;
  String? storeName;
  String? storeType;
  String? location;
  double? latitude;
  double? longitude;
  bool is_favourite;

  StoreModel({
    required this.id,
    this.storeName,
    this.storeType,
    this.location,
    this.latitude,
    this.longitude,
    this.is_favourite = false,
  });
}