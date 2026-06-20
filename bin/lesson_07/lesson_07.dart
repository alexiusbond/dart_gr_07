import 'animals.dart';
import 'transports.dart';
import 'interfaces.dart';
import 'mixins.dart';

void main() {
  Cat cat = Cat(2, 'black');
  cat.makeSound();

  Snake snake = Snake(1, 'green');
  snake.makeSound();

  Car car = Car();

  Animal parrot = Parrot(5, 'red');

  List<Drawable> drawables = [cat, car, parrot, snake, Plane()];
  for (var element in drawables) {
    drawAllVariants(element);
    if (element is Animal) {
      Animal a = element as Animal;
      a.makeSound();
    }
    if (element is Playable) {
      (element as Playable).play();
    }    
    if (element is Fly) {
      (element as Fly).fly(element.runtimeType.toString());
    }
  }

  print('END OF PROGRAM');
}

void drawAllVariants(Drawable d) {
  d.draw();
  print(d.draw3D('plastic'));
}
