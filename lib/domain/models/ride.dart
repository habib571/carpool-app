class Ride { 
   int? id ; 
  String? driverId ;  
  String? from ; 
  String? to ;
  String? date ; 
  String? time ; 
  int? seats ;
  String? price ;   
  String? distance  ;
Ride({
    this.id,
    this.driverId,
    this.from,
    this.to,
    this.date,
    this.time,
    this.seats,
    this.price, 
    this.distance
  });
 factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      id: json['id'] ?? 0,
      driverId: json['driver_id']  ?? '',
      from: json['start_location'] ??'' ,
      to: json['end_location']  ??'',
      date: json['departure_date'] ?? '',
      time: json['departure_time'] ?? '',
      seats: json['available_seats'] ?? '',
      price: json['price_per_seat'] ?? '', 
      distance: json['disatnce']?? ''
    );
  }
}