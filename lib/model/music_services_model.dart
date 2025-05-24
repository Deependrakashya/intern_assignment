class MusicServicesModel {
  String? title;
  String? subTitle;
  String? imgUrl;

  MusicServicesModel({this.title, this.subTitle, this.imgUrl});

  MusicServicesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['subTitle'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}
