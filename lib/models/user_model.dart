class UserModelResponse {
  final String name;
  final String job;
  final String? id;
  final String? createdAt;

  UserModelResponse({required this.name, required this.job, this.id, this.createdAt});

  factory UserModelResponse.fromJson(Map<String,dynamic> json){
    return UserModelResponse(
      name: json['name'] ?? '',
      job: json['job']?? '',
      id: json['id']?? '',
      createdAt: json['createdAt']?? '',
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'job': job,
    };
  }

  
}