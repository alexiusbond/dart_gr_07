import 'animals.dart';

void main() {
  Animal.showCounter();

  Cat cat = Cat(2, Color.red);
  cat.meow();
  print(cat.info());

  Dog dog = Dog(5, Color.yellow, 'Sit');
  dog.bark();
  print(dog.info());

  FightingDog fightingDog = FightingDog(1, Color.green, 'Fight', 10);
  fightingDog.bark();
  fightingDog.fight();
  print(fightingDog.info());

  if (fightingDog.commands == 'Fight') {
    print('This dog is dangerous.');
  }

  if (fightingDog.color == Color.green) {
    print('This dog is beautiful.');
  }

  Animal.showCounter();
  print('\x1B[35mEND of program!');
}
