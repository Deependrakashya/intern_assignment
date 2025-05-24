class MusicServicesModel {
  String? title;
  String? subTitle;
  String? imgUrl;
  String? iconUrl;

  MusicServicesModel({this.title, this.subTitle, this.imgUrl, this.iconUrl});

  MusicServicesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['subTitle'];
    imgUrl = json['imgUrl'];
    iconUrl = json['iconUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['imgUrl'] = this.imgUrl;
    data['iconUrl'] = this.iconUrl;
    return data;
  }
}
