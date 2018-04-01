from __future__ import print_function
from bs4 import BeautifulSoup
import requests

for link in BeautifulSoup(requests.get('http://testsite.hsmse.org/about-us/faculty-staff/').text, 'html.parser').find(id="post-533").find_all('a'): print(link.text.strip().lower())
