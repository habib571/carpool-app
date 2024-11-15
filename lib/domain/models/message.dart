class Message { 
  String? toId;
  String? fromId;
  String? msg;
  String? sentTime;
  bool? isRead;
  Message( this.toId, this.fromId, this.msg, this.sentTime, this.isRead);

  factory Message.fromJson( Map<String, dynamic> json) => Message(
        json['toId'],
        json['fromId'],
        json['msg'],
        json['sentTime'],
        json['isRead'],
      );

  Map<String, dynamic> toJson() => { 

        'toId': toId,
        'fromId': fromId,
        'msg': msg,
        'sentTime': sentTime,
        'isRead': isRead , 
      };
}
