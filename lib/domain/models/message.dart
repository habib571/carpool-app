class Message {
  String? chatId ;
  String? toId;
  String? fromId;
  String? msg;
  String? sentTime;
  bool? isRead;
  Message( this.chatId ,this.toId, this.fromId, this.msg, this.sentTime, this.isRead);

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        json['chatId'] ,
        json['toId'],
        json['fromId'],
        json['msg'],
        json['sentTime'],
        json['isRead'],
      );

  Map<String, dynamic> toJson() => {
        'chatId':chatId ,
        'toId': toId,
        'fromId': fromId,
        'msg': msg,
        'sentTime': sentTime,
        'isRead': isRead,
      };
}
