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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'storeName': storeName,
      'storeType': storeType,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'isFavourite': is_favourite ? 1 : 0,
    };
  }

  factory StoreModel.fromMap(Map<String, dynamic> map) {
    return StoreModel(
      id: map['id'],
      storeName: map['storeName'],
      storeType: map['storeType'],
      location: map['location'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      is_favourite: map['isFavourite'] == 1,
    );
  }

  StoreModel copyWith({
    int? id,
    String? storeName,
    String? storeType,
    String? location,
    double? latitude,
    double? longitude,
    bool? isFavourite,
  }) {
    return StoreModel(
      id: id ?? this.id,
      storeName: storeName ?? this.storeName,
      storeType: storeType ?? this.storeType,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      is_favourite: isFavourite ?? this.is_favourite,
    );
  }
}
