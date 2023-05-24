/// 购物篮商品列表
class ModuleList {
  late List<Module> modules;

  ModuleList(this.modules);

  factory ModuleList.fromJson(dynamic list) {
    List moduleList = list as List;
    List<Module> modules = moduleList.map((i) => Module.fromJson(i)).toList();
    return ModuleList(modules);
  }

}

/// 商品模块
class Module {
  late int id; // 模块ID
  late String title;
  late String name; // 模块名称
  late String code;
  late String imgpath;
  late String descshow;
  late String color;
  late String size;
  late String fix;
  late List<dynamic> group;
  // late List<App> apps;

  Module(
      this.id,
      this.title,
      this.name,
      this.code,
      this.imgpath,
      this.descshow,
      this.color,
      this.size,
      this.fix,
      this.group,
  );//, this.apps);

  factory Module.fromJson(Map<String, dynamic> json) {

    // fix: 56.88,
    //group: [2]}
    int id = json['id'];
    String title = json['title'];
    String name = json['name'];
    String code = json['code'];
    String imgpath = json['imgpath'];
    String descshow = json['descshow'];
    String color = json['color'];
    String size = json['size'];
    String fix = json['fix'];
    List<dynamic> group = json['group'];
    
    return Module(id, title, name, code, imgpath, descshow, color, size, fix, group);//, apps);
  }
}