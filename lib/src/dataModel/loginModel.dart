class loginModel {
  MItem1? mItem1;
  MItem2? mItem2;

  loginModel({this.mItem1, this.mItem2});

  loginModel.fromJson(Map<String, dynamic> json) {
    mItem1 =
    json['m_Item1'] != null ? new MItem1.fromJson(json['m_Item1']) : null;
    mItem2 =
    json['m_Item2'] != null ? new MItem2.fromJson(json['m_Item2']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mItem1 != null) {
      data['m_Item1'] = this.mItem1!.toJson();
    }
    if (this.mItem2 != null) {
      data['m_Item2'] = this.mItem2!.toJson();
    }
    return data;
  }
}

class MItem1 {
  String? responseCode;
  String? responseType;
  String? description;

  MItem1({this.responseCode, this.responseType, this.description});

  MItem1.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    responseType = json['ResponseType'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    data['ResponseType'] = this.responseType;
    data['Description'] = this.description;
    return data;
  }
}

class MItem2 {
  int? pkey;
  String? oTP;
  String? userID;
  String? userName;
  String? mobileNo;
  List<PlantInfo>? plantInfo;
  List<RolesInfo>? rolesInfo;

  MItem2(
      {this.pkey,
        this.oTP,
        this.userID,
        this.userName,
        this.mobileNo,
        this.plantInfo,
        this.rolesInfo});

  MItem2.fromJson(Map<String, dynamic> json) {
    pkey = json['Pkey'];
    oTP = json['OTP'];
    userID = json['UserID'];
    userName = json['UserName'];
    mobileNo = json['MobileNo'].toString();
    if (json['PlantInfo'] != null) {
      plantInfo = <PlantInfo>[];
      json['PlantInfo'].forEach((v) {
        plantInfo!.add(new PlantInfo.fromJson(v));
      });
    }
    if (json['RolesInfo'] != null) {
      rolesInfo = <RolesInfo>[];
      json['RolesInfo'].forEach((v) {
        rolesInfo!.add(new RolesInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Pkey'] = this.pkey;
    data['OTP'] = this.oTP;
    data['UserID'] = this.userID;
    data['UserName'] = this.userName;
    data['MobileNo'] = this.mobileNo;
    if (this.plantInfo != null) {
      data['PlantInfo'] = this.plantInfo!.map((v) => v.toJson()).toList();
    }
    if (this.rolesInfo != null) {
      data['RolesInfo'] = this.rolesInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlantInfo {
  int? plantPkey;
  String? plantID;
  String? plantName;

  PlantInfo({this.plantPkey, this.plantID, this.plantName});

  PlantInfo.fromJson(Map<String, dynamic> json) {
    plantPkey = json['PlantPkey'];
    plantID = json['PlantID'];
    plantName = json['PlantName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PlantPkey'] = this.plantPkey;
    data['PlantID'] = this.plantID;
    data['PlantName'] = this.plantName;
    return data;
  }
}

class RolesInfo {
  int? rolePkey;
  String? roleCode;
  String? roleName;

  RolesInfo({this.rolePkey, this.roleCode, this.roleName});

  RolesInfo.fromJson(Map<String, dynamic> json) {
    rolePkey = json['RolePkey'];
    roleCode = json['RoleCode'];
    roleName = json['RoleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RolePkey'] = this.rolePkey;
    data['RoleCode'] = this.roleCode;
    data['RoleName'] = this.roleName;
    return data;
  }
}
