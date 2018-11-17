Feature: FizzBuzz
  FizzBuzzを出してくれるアプリ

  Scenario: Fizzを出す
    Given FizzBuzzアプリが立ち上げ
    When 3を入力した
    Then Fizzと表示された