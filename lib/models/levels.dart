class Levels {
  final String name;
  final Map unlockedLevels;

  Levels({this.name, this.unlockedLevels});

}

class LevelData {
  final Map unlockedLevels;
  LevelData({this.unlockedLevels});

  bool isUnlocked(String level){
    return this.unlockedLevels[level];
  }

  bool unlockLevel(String level){
    this.unlockedLevels.update('level', (value) => true);
  }

}