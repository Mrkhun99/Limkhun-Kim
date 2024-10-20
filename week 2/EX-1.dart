enum Skill { FLUTTER, DART, HTML, Laravel, Javascript, Css, Java}

class Address{
  String _street;
  String _city;
  String _zipcode;

  Address(this._street, this._city, this._zipcode);

  get getstreet => _street;
  get getcity => _city;
  get getzipcode => _zipcode;

  @override
  String toString() {
    return '(Street: $_street, City: $_city, Zip Code: $_zipcode)';
}
}


class Employee {
  String _name;
  double _baseSalary; // should not be artribute can be static or const outside employee
  int _yearofexperience;
  Address _address;
  String _position;
  List<Skill> _skills;


  Employee(this._name, this._baseSalary, this._yearofexperience, this._skills, this._address, this._position);

  get getname => _name;
  get getbaseSalary => _baseSalary;
  get yearofexperience => _yearofexperience;
  get name => _name;
  get baseSalary => _baseSalary;
  get yearOfExperience => _yearofexperience;
  get skill => _skills;
  get address => _address;

  Employee.mobileDeveloper(
      String _name, double _baseSalary, int _yearOfExperience, Address _address)
      : this(_name, _baseSalary, _yearOfExperience, [Skill.FLUTTER] , _address,
            'Mobile Development');
  Employee.webDeveloper(
      String _name, double _baseSalary, int _yearOfExperience, Address _address)
      : this(_name, _baseSalary, _yearOfExperience, [Skill.Laravel] , _address,
            'Web Development');

  void addSkill(Skill newSkill) {
    this.skill.add(newSkill);
  }

  


double compute() {
    double total_salary = _baseSalary;

    total_salary += (_yearofexperience * 20);
    for (Skill skill in skill) {
      switch (skill) {
        case Skill.DART:
          total_salary += 500;
          break;
        case Skill.FLUTTER:
          total_salary += 100;
          break;
        case Skill.HTML:
          total_salary += 200;
          break;
        default:
          total_salary += 500;
      }
    }
       return total_salary;
  }




  void printDetails() {
    String Skills =
        skill.map((skill) => skill.toString().split('.').last).join(', ');
    print(
        'Employee: $_name,\n Base Salary: \$${_baseSalary},\n Year Of Experience: ${_yearofexperience} year(s),\n Skills: $Skills,\n Address: ${_address}, Total Salary: \$${compute()}\n');
  }
}








void main() {
Address address = Address("Street.CADT12", "Phnom Penh", "11111");

  Employee employee = Employee("User0", 400, 1, [ Skill.FLUTTER ], address, "Mobile Developer");
  Employee emp1 = Employee.mobileDeveloper('User1', 5000, 2, Address("St.cadt10", "SiemReap", "7789"));
  Employee emp2 = Employee.webDeveloper('User2', 40000, 5, address);
  employee.printDetails();
  emp1.printDetails();
  emp2.printDetails();
  employee.addSkill(Skill.DART);
  employee.printDetails();

}

