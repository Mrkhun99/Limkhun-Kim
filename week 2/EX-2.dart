class BankAccount {
  int _id;
  String _name;
  double _balance = 0;

  BankAccount({required int id, required String name})
      : _id = id,
        _name = name;

  int get id => _id;

  String get name => _name;

  double get balance => _balance;

  void _ensureSufficientBalance(double amount) {
    if (amount > _balance) {
      throw Exception('Not Enough balance');
    }
  }

  void withdraw(double amount) {
    _ensureSufficientBalance(amount);
    _balance -= amount;
  }

  void credit(double amount) {
    _balance += amount;
  }
}

class Bank {
  String _name;
  List<BankAccount> _accounts = [];

  Bank({required String name}) : _name = name;

  String get name => _name;

  void _checkDuplicateAccountId(int id) {
    for (var account in _accounts) {
      if (account.id == id) {
        throw Exception('Account with ID $id already exists!');
      }
    }
  }

  BankAccount createAccount(int id, String name) {
    _checkDuplicateAccountId(id); 
    BankAccount newAccount = BankAccount(id: id, name: name);
    _accounts.add(newAccount);
    return newAccount;
  }

  List<BankAccount> get accounts => _accounts;
}

void main() {
  print("ABA Bank Information: ");
  print("===============================================================");
  Bank myBank = Bank(name: "ABA Bank");

  BankAccount User_account = myBank.createAccount(1, 'User');
  BankAccount LimKhun = myBank.createAccount(2, 'Limkhun');

  User_account.credit(100);
  print('User ${User_account.name}\'s balance: \$${User_account.balance}');
  User_account.withdraw(50);
  print('User ${User_account.name}\'s balance: \$${User_account.balance}');
  print('User ${LimKhun.name}\'s balance: \$${LimKhun.balance}');

  try {
    User_account.withdraw(75);
  } catch (e) {
    print(e);
  }

  try {
    myBank.createAccount(3, 'Duplicate User');
    myBank.createAccount(2, 'Duplicate User');
  } catch (e) {
    print(e);
  }
}