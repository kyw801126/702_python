"""
class Account 계좌를 만드세요

1. 속성값 :
    - 계좌번호(ano), 소유주(owner), 잔액(balance)
    - 단, 잔액은 0 이상이고 10,000,000원 이하여야 한다.
2. deposit method
    - amount를 매개변수로 받아 balance 더해준다.
    - 잔액은 10,000,000원을 초과 할수 없다.
3. withdraw method
    - amount 만큼의 금액을 balance에서 차감한다.
    - 잔액은 마이너스 금액이 될수 없다.
4. __str__ method
    - 계좌번호: 000, 소유주 :000, 잔액: 천단위 , 넣어 출력
"""
class Account:
  def __init__(self, balance, owner, ano):
    self.ano = ano
    self.owner = owner
    self.__balance = 0
    if 0 <= balance <= 1000000:
        self.__balance = balance
  def deposit(self, amount):
    if self.__balance + amount > 10000000:
        print("일천만원을 초과할 수 없습니다. ")
        return
    self.__balance += amount
  def withdraw(self, amount):
    if self.__balance < amount:
      print('잔액이 부족합니다.')
      return
    self.__balance -= amount
  # 계좌정보 확인
  def __str__(self):
    return (f'계좌번호 : {self.ano},'
            f'소유주  : {self.owner},'
            f'잔액  : {self.__balance: 10,d}')

if __name__ =="__main__":
    acc = Account(100000, "제임스",
                  "231101")
    print(acc)
    acc.deposit(200000)
    print(acc)
    acc.withdraw(400000) # 잔액이부족합니다.
    acc.withdraw(250000)
    print(acc) # 50000
