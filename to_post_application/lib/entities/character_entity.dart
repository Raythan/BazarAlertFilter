import 'dart:convert';

final String characterTable = "Character";

class CharacterModel {
  int id;
  String name;
  String title;
  String sex;
  String vocation;
  int level;
  int achievementPoints;
  String world;
  String residence;
  String accountStatus;
  String status;

  CharacterModel(
      {this.id,
      this.name,
      this.title,
      this.sex,
      this.vocation,
      this.level,
      this.achievementPoints,
      this.world,
      this.residence,
      this.accountStatus,
      this.status});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'sex': sex,
      'vocation': vocation,
      'level': level,
      'achievementPoints': achievementPoints,
      'world': world,
      'residence': residence,
      'accountStatus': accountStatus,
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CharacterModel(
      id: map['id'],
      name: map['name'],
      title: map['title'],
      sex: map['sex'],
      vocation: map['vocation'],
      level: map['level'],
      achievementPoints: map['achievementPoints'],
      world: map['world'],
      residence: map['residence'],
      accountStatus: map['accountStatus'],
    );
  }

  factory CharacterModel.fromMapDataApi(Map<String, dynamic> map) {
    if (map == null) return null;

    return CharacterModel(
        //id: map['id'],
        name: map['characters']['data']['name'],
        title: map['characters']['data']['title'],
        sex: map['characters']['data']['sex'],
        vocation: map['characters']['data']['vocation'],
        level: map['characters']['data']['level'],
        achievementPoints: map['characters']['data']['achievement_points'],
        world: map['characters']['data']['world'],
        residence: map['characters']['data']['residence'],
        accountStatus: map['characters']['data']['account_status'],
        status: map['characters']['data']['status']);
  }

  CharacterModel fromMapDataApi(Map<String, dynamic> map) {
    if (map == null) return null;

    return CharacterModel(
        //id: map['id'],
        name: map['characters']['data']['name'],
        title: map['characters']['data']['title'],
        sex: map['characters']['data']['sex'],
        vocation: map['characters']['data']['vocation'],
        level: map['characters']['data']['level'],
        achievementPoints: map['characters']['data']['achievement_points'],
        world: map['characters']['data']['world'],
        residence: map['characters']['data']['residence'],
        accountStatus: map['characters']['data']['account_status'],
        status: map['characters']['data']['status']);
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) => CharacterModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CharacterModel(id: $id, name: $name, title: $title, sex: $sex, vocation: $vocation, level: $level, achievementPoints: $achievementPoints, world: $world, residence: $residence, accountStatus: $accountStatus)';
  }
}
