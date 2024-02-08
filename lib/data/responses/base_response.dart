class BaseResponse {
  bool? success ;
  String? message ; 

 BaseResponse({
   this.success, 
 this.message ,

    });
  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
     success: json['success'] ?? false , 
     message:  json['message'] ?? '' ,
    );
  }



} 