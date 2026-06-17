enum Color {
  red('\x1B[31m'),
  yellow('\x1B[33m'),
  green('\x1B[32m');

  final String code;

  const Color(this.code);
}

class Animal {
  static int _counter = 0;

  static void showCounter() {
    print('Fabric ANIMAL produced: $_counter');
  }

  int age;
  Color color;

  Animal(this.age, this.color) {
    _counter++;
  }

  String info() {
    return 'AGE: $age COLOR: ${color.code}${color.name}\x1B[0m';
  }
}

class Cat extends Animal {
  Cat(super.age, super.color);

  void meow() {
    print('Cat says Meow!');
  }
}

class Dog extends Animal {
  String commands;
  Dog(super.age, super.color, this.commands);

  void bark() {
    print('Dog says Woof!');
  }

  @override
  String info() {
    return '${super.info()} COMMANDS: $commands';
  }
}

class FightingDog extends Dog {
  int wins;
  FightingDog(super.age, super.color, super.commands, this.wins);

  void fight() {
    print('Fighting dog is fighting!');
  }

  @override
  String info() {
    return '${super.info()} WINS: $wins';
  }
}
