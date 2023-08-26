class Person {

  String name;
  double weight;
  double height;

  Person(this.name, this.weight, this.height);

  @override
  String toString() {
    
    return """
            Name: ${name}
            Peso: ${weight}
            Altura: ${height}
           """;
  }
}
