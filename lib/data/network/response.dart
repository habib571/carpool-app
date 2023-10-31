class BaseResponse {
  bool success ;
  String message ; 
    final Map<String, dynamic> data ;
 BaseResponse({
  required this.success, 
  required this.message ,
  required this.data 
    });
  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
     success: json['success'] , 
     message:  json['message'] ,
     data: (json['data'] as Map<String, dynamic>?) ?? {},
    );
  }



} 