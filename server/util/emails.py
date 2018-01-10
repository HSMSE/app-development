from bs4 import BeautifulSoup
import requests
import sys

url = 'http://www.hsmse.org/faculty/faculty-contact-information/'
html = requests.get(url).text
soup = BeautifulSoup(html, 'html.parser')

soup = soup.find(id="col1")

a = []
for link in soup.find_all('a'):
    print(link.text.strip().lower())
