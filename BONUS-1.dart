enum Direction { north, east, south, west }

void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction
  //turn right function
  void right() {
    switch (direction) {
      case Direction.north:
        direction = Direction.east;
        break;
      case Direction.east:
        direction = Direction.south;
        break;
      case Direction.south:
        direction = Direction.west;
        break;
      case Direction.west:
        direction = Direction.north;
        break;
    }
  }

  //turn left function
  void left() {
    switch (direction) {
      case Direction.north:
        direction = Direction.west;
        break;
      case Direction.east:
        direction = Direction.north;
        break;
      case Direction.south:
        direction = Direction.east;
        break;
      case Direction.west:
        direction = Direction.south;
        break;
    }
  }

  //advance function
  void advance() {
    switch (direction) {
      case Direction.north:
        y += 1;
        break;
      case Direction.east:
        x += 1;
        break;
      case Direction.south:
        y -= 1;
        break;
      case Direction.west:
        x -= 1;
        break;
    }
  }

  //execute the instruction
  List<String> move = instructions.split('');

  move.forEach((char) {
    switch (char) {
      case 'R':
        right();
        break;
      case 'L':
        left();
        break;
      case 'A':
        advance();
        break;
    }
  });

  // Print the final position and direction
  print("Final position: ($x, $y)");
  print("Facing: ${direction.name}");
}
