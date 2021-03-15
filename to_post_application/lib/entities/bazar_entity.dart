import 'dart:convert';

final String characterTable = "Bazar";

class BazarModel {
  int id;
  String worldFilter;
  String pvpTypeFilter;
  String battleEyeFilter;
  String vocationFilter;
  int minLevelFilter;
  int maxLevelFilter;
  String skillFilter;
  int minSkillFilter;
  int maxSkillFilter;
  String sortByFilter;
  String ascDescFilter;

  BazarModel(
      {this.id,
      this.worldFilter,
      this.pvpTypeFilter,
      this.battleEyeFilter,
      this.vocationFilter,
      this.minLevelFilter,
      this.maxLevelFilter,
      this.skillFilter,
      this.minSkillFilter,
      this.maxSkillFilter,
      this.sortByFilter,
      this.ascDescFilter});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'worldFilter': worldFilter,
      'pvpTypeFilter': pvpTypeFilter,
      'battleEyeFilter': battleEyeFilter,
      'vocationFilter': vocationFilter,
      'minLevelFilter': minLevelFilter,
      'maxLevelFilter': maxLevelFilter,
      'skillFilter': skillFilter,
      'minSkillFilter': minSkillFilter,
      'maxSkillFilter': maxSkillFilter,
      'sortByFilter': sortByFilter,
      'ascDescFilter': ascDescFilter
    };
  }

  factory BazarModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return BazarModel(
        id: map['id'],
        worldFilter: map['worldFilter'],
        pvpTypeFilter: map['pvpTypeFilter'],
        battleEyeFilter: map['battleEyeFilter'],
        vocationFilter: map['vocationFilter'],
        minLevelFilter: map['minLevelFilter'],
        maxLevelFilter: map['maxLevelFilter'],
        skillFilter: map['skillFilter'],
        minSkillFilter: map['minSkillFilter'],
        maxSkillFilter: map['maxSkillFilter'],
        sortByFilter: map['sortByFilter'],
        ascDescFilter: map['ascDescFilter']);
  }

  String toJson() => json.encode(toMap());
  factory BazarModel.fromJson(String source) => BazarModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BazarModel(id: $id, worldFilter: $worldFilter, pvpTypeFilter: $pvpTypeFilter, battleEyeFilter: $battleEyeFilter, vocationFilter: $vocationFilter, minLevelFilter: $minLevelFilter, maxLevelFilter: $maxLevelFilter, skillFilter: $skillFilter, minSkillFilter: $minSkillFilter, maxSkillFilter: $maxSkillFilter, sortByFilter: $sortByFilter, ascDescFilter: $ascDescFilter)';
  }
}
