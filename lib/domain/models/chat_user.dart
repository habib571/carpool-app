class ChatUser { 
  String? id ;
  String? fromId;
  String? toId;
  String? name;
  String? imageUrl;
  String? lastMessage;
  bool? activeStatus;

  ChatUser( this.id , this.fromId, this.toId, this.name, this.imageUrl, this.lastMessage,
      this.activeStatus);

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser( 
      json['id'] ,
      json['fromId'],
      json['id'],
      json['name'],
      json['imageUrl'],
      json['lastMessage'],
      json['activeStatus'],
    );
  }

  Map<String, dynamic> toJson() => { 
         'id' : id ,
        'fromId': fromId,
        'toId': toId,
        'name': name,
        'imageUrl': imageUrl,
        'lastMessage': lastMessage,
        'activeStatus': activeStatus,
      };
}
