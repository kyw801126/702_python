import requests
from bs4 import BeautifulSoup
url = 'https://crawlingstudy-dd3c9.web.app/01/'
response = requests.get(url)
soup = BeautifulSoup(response.text, 'html.parser')
key = []
value = []

for th in soup.find('table').find_all('th'):
    key.append(th.text)

for tr in soup.find('table').find('tbody').find_all('tr'):
    temp = []
    for i in tr.find_all('td'):
        temp.append(i.text)
    value.append(dict(zip(key, temp)))
print(value)