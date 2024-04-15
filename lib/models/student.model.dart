class StudentModel {
  StudentModel({
    String? status,
    String? message,
    num? responseCode,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
  }

  StudentModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  num? _responseCode;
  Data? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['responseCode'] = _responseCode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    String? profilePic,
    String? mobileNumber,
    num? category,
    String? categoryString,
    num? dailyTarget,
    num? initPage,
    num? depositCoin,
    num? earnedCoin,
    bool? isPromoter,
    bool? isPromoterApplied,
    bool? isEducator,
    bool? isEducatorApplied,
    List<dynamic>? jobPreference,
    bool? isEmailVerified,
    bool? isMobileVerified,
    bool? isProfileCompleted,
    String? id,
    List<dynamic>? education,
    List<dynamic>? experience,
    String? createdAt,
    String? updatedAt,
    String? autoLoginToken,
  }) {
    _profilePic = profilePic;
    _mobileNumber = mobileNumber;
    _category = category;
    _categoryString = categoryString;
    _dailyTarget = dailyTarget;
    _initPage = initPage;
    _depositCoin = depositCoin;
    _earnedCoin = earnedCoin;
    _isPromoter = isPromoter;
    _isPromoterApplied = isPromoterApplied;
    _isEducator = isEducator;
    _isEducatorApplied = isEducatorApplied;
    _jobPreference = jobPreference;
    _isEmailVerified = isEmailVerified;
    _isMobileVerified = isMobileVerified;
    _isProfileCompleted = isProfileCompleted;
    _id = id;
    _education = education;
    _experience = experience;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _autoLoginToken = autoLoginToken;
  }

  Data.fromJson(dynamic json) {
    _profilePic = json['profilePic'];
    _mobileNumber = json['mobileNumber'];
    _category = json['category'];
    _categoryString = json['categoryString'];
    _dailyTarget = json['dailyTarget'];
    _initPage = json['initPage'];
    _depositCoin = json['depositCoin'];
    _earnedCoin = json['earnedCoin'];
    _isPromoter = json['isPromoter'];
    _isPromoterApplied = json['isPromoterApplied'];
    _isEducator = json['isEducator'];
    _isEducatorApplied = json['isEducatorApplied'];
    if (json['jobPreference'] != null) {
      _jobPreference = [];
      json['jobPreference'].forEach((v) {
        _jobPreference = [];
      });
    }
    _isEmailVerified = json['isEmailVerified'];
    _isMobileVerified = json['isMobileVerified'];
    _isProfileCompleted = json['isProfileCompleted'];
    _id = json['_id'];
    if (json['education'] != null) {
      _education = [];
      json['education'].forEach((v) {
        _education = [];
      });
    }
    if (json['experience'] != null) {
      _experience = [];
      json['experience'].forEach((v) {
        _experience = [];
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _autoLoginToken = json['autoLoginToken'];
  }
  String? _profilePic;
  String? _mobileNumber;
  num? _category;
  String? _categoryString;
  num? _dailyTarget;
  num? _initPage;
  num? _depositCoin;
  num? _earnedCoin;
  bool? _isPromoter;
  bool? _isPromoterApplied;
  bool? _isEducator;
  bool? _isEducatorApplied;
  List<dynamic>? _jobPreference;
  bool? _isEmailVerified;
  bool? _isMobileVerified;
  bool? _isProfileCompleted;
  String? _id;
  List<dynamic>? _education;
  List<dynamic>? _experience;
  String? _createdAt;
  String? _updatedAt;
  String? _autoLoginToken;

  String? get profilePic => _profilePic;
  String? get mobileNumber => _mobileNumber;
  num? get category => _category;
  String? get categoryString => _categoryString;
  num? get dailyTarget => _dailyTarget;
  num? get initPage => _initPage;
  num? get depositCoin => _depositCoin;
  num? get earnedCoin => _earnedCoin;
  bool? get isPromoter => _isPromoter;
  bool? get isPromoterApplied => _isPromoterApplied;
  bool? get isEducator => _isEducator;
  bool? get isEducatorApplied => _isEducatorApplied;
  List<dynamic>? get jobPreference => _jobPreference;
  bool? get isEmailVerified => _isEmailVerified;
  bool? get isMobileVerified => _isMobileVerified;
  bool? get isProfileCompleted => _isProfileCompleted;
  String? get id => _id;
  List<dynamic>? get education => _education;
  List<dynamic>? get experience => _experience;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get autoLoginToken => _autoLoginToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profilePic'] = _profilePic;
    map['mobileNumber'] = _mobileNumber;
    map['category'] = _category;
    map['categoryString'] = _categoryString;
    map['dailyTarget'] = _dailyTarget;
    map['initPage'] = _initPage;
    map['depositCoin'] = _depositCoin;
    map['earnedCoin'] = _earnedCoin;
    map['isPromoter'] = _isPromoter;
    map['isPromoterApplied'] = _isPromoterApplied;
    map['isEducator'] = _isEducator;
    map['isEducatorApplied'] = _isEducatorApplied;
    if (_jobPreference != null) {
      map['jobPreference'] = _jobPreference?.map((v) => v.toJson()).toList();
    }
    map['isEmailVerified'] = _isEmailVerified;
    map['isMobileVerified'] = _isMobileVerified;
    map['isProfileCompleted'] = _isProfileCompleted;
    map['_id'] = _id;
    if (_education != null) {
      map['education'] = _education?.map((v) => v.toJson()).toList();
    }
    if (_experience != null) {
      map['experience'] = _experience?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['autoLoginToken'] = _autoLoginToken;
    return map;
  }
}
