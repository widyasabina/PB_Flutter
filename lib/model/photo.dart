class Photo {
  String? id;
  String? altDescription;
  Urls? urls;
  int? likes;
  bool? likedByUser;
  User? user;

  Photo({
    required this.id,
    required this.altDescription,
    required this.urls,
    required this.likes,
    required this.likedByUser,
    required this.user,
  });

 
  Photo.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      altDescription = json['alt_description'];
      urls = Urls.fromJson(json['urls']);
      likes = json['likes'];
      likedByUser = json['liked_by_user'];
      user = User.fromJson(json['user']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
     data['id'] = id;
     data['altDescription'] = altDescription;
     data['urls'] = urls;
     data['likes'] = likes;
     data['likedByUser'] = likedByUser;
     data['user'] = user;
     return data;   
  }
}

class Urls {
  String? regular;

  Urls({required this.regular});

  Urls.fromJson(Map<String, dynamic> json) {
      regular = json['regular'];
  }

  Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = <String, dynamic>{};
     data['regular'] = regular;
     return data;
  }
}

class User {
  String? id;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  ProfileImage? profileImage;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.profileImage,
  });

  User.fromJson(Map<String, dynamic> json) {

      id = json['id'];
      username = json['username'];
      name = json['name'];
      firstName = json['first_name'];
      lastName = json['last_name'];
      profileImage = json['profile_image'] != null ? ProfileImage.fromJson(json['profile_image']) : null;
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
      data['id'] = id;
      data['username'] = username;
      data['name'] = name;
      data['firstName'] = firstName;
      data['lastName'] = lastName;
      data['profile_image'] = profileImage?.toJson();
      return data;
    
  }
}

class ProfileImage {
  String? small;

  ProfileImage({required this.small});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    
      small = json['small'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
      data['small'] = small;
      return data;
    
  }
}