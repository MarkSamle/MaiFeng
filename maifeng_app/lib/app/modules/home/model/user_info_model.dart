class UserInfoModel {
  late int userId;
  late int deptId;
  late String userName;
  late String nickName;
  late String email;
  late String phonenumber;
  late String sex;
  late String avatar;
  late String status;
  late String delFlag;
  late String loginIp;
  late String loginDate;
  late Dept dept;

  UserInfoModel(
    this.userId,
    this.deptId,
    this.userName,
    this.nickName,
    this.email,
    this.phonenumber,
    this.sex,
    this.avatar,
    this.status,
    this.delFlag,
    this.loginIp,
    this.loginDate,
    this.dept,
  );

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    deptId = json['deptId'];
    userName = json['userName'] ?? '';
    nickName = json['nickName'] ?? '';
    email = json['email'] ?? '';
    phonenumber = json['phonenumber'] ?? '';
    sex = json['sex'] ?? '';
    avatar = json['avatar'] ?? '';
    status = json['status'] ?? '';
    delFlag = json['delFlag'] ?? '';
    loginIp = json['loginIp'] ?? '';
    loginDate = json['loginDate'] ?? '';
    dept = Dept.fromJson(json['dept']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['deptId'] = deptId;
    data['userName'] = userName;
    data['nickName'] = nickName;
    data['email'] = email;
    data['phonenumber'] = phonenumber;
    data['sex'] = sex;
    data['avatar'] = avatar;
    data['status'] = status;
    data['delFlag'] = delFlag;
    data['loginIp'] = loginIp;
    data['loginDate'] = loginDate;
    data['dept'] = dept;
    return data;
  }
}

class Dept {
  late int deptId;
  late int parentId;
  late String deptName;
  late String parentName;
  late String leader;

  Dept(
    this.deptId,
    this.parentId,
    this.deptName,
    this.parentName,
    this.leader,
  );

  Dept.fromJson(Map<String, dynamic> json) {
    deptId = json['userId'] ?? -1;
    parentId = json['parentId'] ?? -1;
    deptName = json['deptName'] ?? '';
    leader = json['leader'] ?? '';
    parentName = json['parentName'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deptId'] = deptId;
    data['parentId'] = parentId;
    data['deptName'] = deptName;
    data['leader'] = leader;
    data['parentName'] = parentName;
    return data;
  }
}
