class Notifi {
  String? fromId;
  String? toId;
  String? senderName;
  String? description;
  String? senderPhotoUrl ;
  bool? isRequest;
  //DateTime? time ;

  Notifi({
    this.fromId,
    this.toId,
    this.senderName,
    this.description,
    this.isRequest, 
    //this.time ,
    this.senderPhotoUrl
  });

  // Deserialize JSON to Notifi object
  factory Notifi.fromJson(Map<String, dynamic> json) => Notifi(
        fromId: json['fromId'],
        toId: json['toId'],
        senderName: json['senderName'],
        description: json['description'],
        isRequest: json['isRequest'], 
        //time : DateTime.parse(json["time"]),
        senderPhotoUrl :json['senderPhotoUrl']
      );



  // Serialize Notifi object to JSON
  Map<String, dynamic> toJson() => {
        'fromId': fromId,
        'toId': toId,
        'senderName': senderName,
        'description': description,
        'isRequest': isRequest, 
       // 'time' : time ,
        'senderPhotoUrl' :senderPhotoUrl 
      };
}