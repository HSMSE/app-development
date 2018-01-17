from bs4 import BeautifulSoup
import requests

for link in BeautifulSoup(requests.get('http://www.hsmse.org/faculty/faculty-contact-information/').text, 'html.parser').find(id="col1").find_all('a'): print(link.text.strip().lower())
