import 'boss.dart';
import 'hero.dart';
import 'dart:math';

class RpgGame {
  
  static Random random = Random();
  static int roundNumber = 0;
  static void startGame() {
    Boss boss = Boss('Org', 1000, 50);

    Warrior warrior1 = Warrior('Alpha', 280, 15);
    Warrior warrior2 = Warrior('Jack', 270, 20);
    Magic magic = Magic('Merlin', 290, 10);
    Berserk berserk = Berserk('Gutz', 260, 10);
    Medic doc = Medic('Haus', 250, 5, 15);
    Medic assistant = Medic('Retchet', 300, 5, 5);
    List<Hero> heroes = [warrior1, doc, warrior2, magic, berserk, assistant];

    _showStatistics(boss, heroes);
    while (!_isGameOver(boss, heroes)) {
      _playRound(boss, heroes);
    }
  }

  static bool _isGameOver(Boss boss, List<Hero> heroes) {
    if (!boss.isAlive()) {
      print('Heroes won!!!');
      return true;
    }
    bool allHeroesDead = true;
    for (var hero in heroes) {
      if (hero.isAlive()) {
        allHeroesDead = false;
        break;
      }
    }
    if (allHeroesDead) {
      print('Boss won!!!');
      return true;
    }
    return false;
  }

  static void _playRound(Boss boss, List<Hero> heroes) {
    roundNumber++;
    boss.chooseDefence();
    boss.attack(heroes);
    for (var hero in heroes) {
      if (hero.isAlive() && boss.isAlive() && boss.defence != hero.ability) {
        hero.attack(boss);
        hero.applySuperPower(boss, heroes);
      }
    }
    _showStatistics(boss, heroes);
  }

  static void _showStatistics(Boss boss, List<Hero> heroes) {
    print('ROUND $roundNumber ---------------');
    print(boss);
    for (var hero in heroes) {
      print(hero);
    }
  }
}
