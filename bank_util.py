import datetime as dt
from account import Account

# 입력 : 이름, 금액, 통장번호, 현재 시분초 6자리
# Account 불러와서 acc_list append
def create_account(acc_list):
    while True:
        try:
            cmd = input("이름 금액 >").split()
            name, amount = cmd[0], int(cmd[1])
        except:
            print("입력이 잘못 되었습니다.")
            continue
        if amount < 0 or amount > 10000000:
            print('금액이 잘못되었습니다.')
            continue
        break
    now = dt.datetime.now()
    ano = now.strftime('%H%M%S') #시간으로 계좌번호생성
    account = Account(amount, name, ano)
    acc_list.append(account)
#입력: 계좌번호, 금액

