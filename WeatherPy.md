

```python
!pip install citipy
```

    Collecting citipy
      Downloading https://files.pythonhosted.org/packages/3b/d0/59721d0f3954781488aac17ee4a40412d0a3547e98bb16377a09c39a2807/citipy-0.0.5.tar.gz (557kB)
    Collecting kdtree>=0.12 (from citipy)
      Downloading https://files.pythonhosted.org/packages/00/3d/bd727d025b1706798aae14da3f69fc7d5a8639dc9e0eba37c7dcd43eb03e/kdtree-0.16-py2.py3-none-any.whl
    Building wheels for collected packages: citipy
      Running setup.py bdist_wheel for citipy: started
      Running setup.py bdist_wheel for citipy: finished with status 'done'
      Stored in directory: C:\Users\ELIZA\AppData\Local\pip\Cache\wheels\6f\07\0d\0392639cf1c10376f59decd06775c0e085ca2458c6036c1028
    Successfully built citipy
    Installing collected packages: kdtree, citipy
    Successfully installed citipy-0.0.5 kdtree-0.16
    

    You are using pip version 9.0.1, however version 10.0.1 is available.
    You should consider upgrading via the 'python -m pip install --upgrade pip' command.
    


```python
#Dependencies
import pandas as pd
import random
from citipy import citipy
import json
import requests as req
from datetime import datetime
import matplotlib.pyplot as plt
import seaborn
import numpy as np
import api_keys
```


```python
# Create an empty DataFrame to store city information
cities = []
count = 0

# Randomly generate list of 600 cities around the world
while count <= 500:
    lat = random.randint(-90,90)
    lon = random.randint(-180,180)
    
    # If the nerest city is duplicate, it does not append to "cities" DataFrame
    if citipy.nearest_city(lat, lon) not in cities:
        cities.append(citipy.nearest_city(lat, lon))
        count += 1

# Print out list of cities and country code
num_of_cities = len(cities)
print(num_of_cities)

```

    501
    


```python

# Create an empty DataFrame to store JSON response
weather_data = []

# Save config information
url = 'http://api.openweathermap.org/data/2.5/weather'
params = {'appid': api_key,
          'q': '',
          'units': 'imperial'}
```


```python
for index, city in enumerate(cities):
    params['q'] = city.city_name + ',' + city.country_code
    print("Processing record " + str(index + 1) + " of " + str(num_of_cities) + " | " + city.city_name)
    print(url + "?units=" + params['units'] + "&APPID=" + params['appid'] + "&q=" + city.city_name.replace(" ", "%20") + ',' + city.country_code)
    response = req.get(url, params=params).json()
    weather_data.append(response)
```

    Processing record 1 of 501 | sidi ali
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sidi%20ali,dz
    Processing record 2 of 501 | khatanga
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=khatanga,ru
    Processing record 3 of 501 | porto novo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=porto%20novo,cv
    Processing record 4 of 501 | vestbygda
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=vestbygda,no
    Processing record 5 of 501 | nizhneyansk
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=nizhneyansk,ru
    Processing record 6 of 501 | filingue
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=filingue,ne
    Processing record 7 of 501 | nanortalik
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=nanortalik,gl
    Processing record 8 of 501 | camacha
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=camacha,pt
    Processing record 9 of 501 | batagay-alyta
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=batagay-alyta,ru
    Processing record 10 of 501 | butaritari
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=butaritari,ki
    Processing record 11 of 501 | east london
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=east%20london,za
    Processing record 12 of 501 | busselton
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=busselton,au
    Processing record 13 of 501 | castro
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=castro,cl
    Processing record 14 of 501 | egvekinot
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=egvekinot,ru
    Processing record 15 of 501 | airai
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=airai,pw
    Processing record 16 of 501 | berlevag
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=berlevag,no
    Processing record 17 of 501 | touzim
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=touzim,cz
    Processing record 18 of 501 | ushuaia
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ushuaia,ar
    Processing record 19 of 501 | coos bay
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=coos%20bay,us
    Processing record 20 of 501 | arkansas city
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=arkansas%20city,us
    Processing record 21 of 501 | qaanaaq
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=qaanaaq,gl
    Processing record 22 of 501 | bolgar
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bolgar,ru
    Processing record 23 of 501 | cidreira
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=cidreira,br
    Processing record 24 of 501 | belushya guba
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=belushya%20guba,ru
    Processing record 25 of 501 | tsihombe
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tsihombe,mg
    Processing record 26 of 501 | atuona
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=atuona,pf
    Processing record 27 of 501 | kobayashi
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kobayashi,jp
    Processing record 28 of 501 | moyo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=moyo,ug
    Processing record 29 of 501 | saint george
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=saint%20george,us
    Processing record 30 of 501 | ascension
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ascension,bo
    Processing record 31 of 501 | jamestown
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=jamestown,sh
    Processing record 32 of 501 | rikitea
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=rikitea,pf
    Processing record 33 of 501 | katrineholm
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=katrineholm,se
    Processing record 34 of 501 | punta arenas
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=punta%20arenas,cl
    Processing record 35 of 501 | tasiilaq
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tasiilaq,gl
    Processing record 36 of 501 | burns lake
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=burns%20lake,ca
    Processing record 37 of 501 | carnarvon
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=carnarvon,au
    Processing record 38 of 501 | hobart
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=hobart,au
    Processing record 39 of 501 | tambura
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tambura,sd
    Processing record 40 of 501 | alamosa
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=alamosa,us
    Processing record 41 of 501 | tuatapere
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tuatapere,nz
    Processing record 42 of 501 | helong
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=helong,cn
    Processing record 43 of 501 | coquimbo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=coquimbo,cl
    Processing record 44 of 501 | krasnovka
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=krasnovka,ru
    Processing record 45 of 501 | ngukurr
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ngukurr,au
    Processing record 46 of 501 | kapaa
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kapaa,us
    Processing record 47 of 501 | barrow
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=barrow,us
    Processing record 48 of 501 | waipawa
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=waipawa,nz
    Processing record 49 of 501 | medicine hat
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=medicine%20hat,ca
    Processing record 50 of 501 | tateyama
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tateyama,jp
    Processing record 51 of 501 | bredasdorp
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bredasdorp,za
    Processing record 52 of 501 | port alfred
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=port%20alfred,za
    Processing record 53 of 501 | lebu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=lebu,cl
    Processing record 54 of 501 | barentsburg
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=barentsburg,sj
    Processing record 55 of 501 | pasni
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=pasni,pk
    Processing record 56 of 501 | newport
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=newport,us
    Processing record 57 of 501 | constitucion
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=constitucion,mx
    Processing record 58 of 501 | vaini
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=vaini,to
    Processing record 59 of 501 | cleveland
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=cleveland,us
    Processing record 60 of 501 | upernavik
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=upernavik,gl
    Processing record 61 of 501 | malakal
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=malakal,sd
    Processing record 62 of 501 | ayagoz
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ayagoz,kz
    Processing record 63 of 501 | namatanai
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=namatanai,pg
    Processing record 64 of 501 | seoul
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=seoul,kr
    Processing record 65 of 501 | narsaq
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=narsaq,gl
    Processing record 66 of 501 | omboue
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=omboue,ga
    Processing record 67 of 501 | tunceli
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tunceli,tr
    Processing record 68 of 501 | kumluca
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kumluca,tr
    Processing record 69 of 501 | ceyhan
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ceyhan,tr
    Processing record 70 of 501 | tanabe
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tanabe,jp
    Processing record 71 of 501 | inhambane
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=inhambane,mz
    Processing record 72 of 501 | san cristobal
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=san%20cristobal,ec
    Processing record 73 of 501 | katsuura
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=katsuura,jp
    Processing record 74 of 501 | yellowknife
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=yellowknife,ca
    Processing record 75 of 501 | orangeburg
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=orangeburg,us
    Processing record 76 of 501 | huaiyuan
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=huaiyuan,cn
    Processing record 77 of 501 | sao felix do xingu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sao%20felix%20do%20xingu,br
    Processing record 78 of 501 | muroto
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=muroto,jp
    Processing record 79 of 501 | cayenne
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=cayenne,gf
    Processing record 80 of 501 | saldanha
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=saldanha,za
    Processing record 81 of 501 | hermanus
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=hermanus,za
    Processing record 82 of 501 | bluff
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bluff,nz
    Processing record 83 of 501 | saint-philippe
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=saint-philippe,re
    Processing record 84 of 501 | salalah
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=salalah,om
    Processing record 85 of 501 | pangnirtung
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=pangnirtung,ca
    Processing record 86 of 501 | mataura
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=mataura,pf
    Processing record 87 of 501 | the valley
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=the%20valley,ai
    Processing record 88 of 501 | mersing
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=mersing,my
    Processing record 89 of 501 | sao filipe
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sao%20filipe,cv
    Processing record 90 of 501 | taolanaro
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=taolanaro,mg
    Processing record 91 of 501 | tarakan
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tarakan,id
    Processing record 92 of 501 | provideniya
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=provideniya,ru
    Processing record 93 of 501 | esperance
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=esperance,au
    Processing record 94 of 501 | marsh harbour
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=marsh%20harbour,bs
    Processing record 95 of 501 | jinchang
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=jinchang,cn
    Processing record 96 of 501 | utiroa
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=utiroa,ki
    Processing record 97 of 501 | vao
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=vao,nc
    Processing record 98 of 501 | ngunguru
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ngunguru,nz
    Processing record 99 of 501 | okhotsk
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=okhotsk,ru
    Processing record 100 of 501 | lorengau
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=lorengau,pg
    Processing record 101 of 501 | ust-omchug
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ust-omchug,ru
    Processing record 102 of 501 | namibe
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=namibe,ao
    Processing record 103 of 501 | tuktoyaktuk
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tuktoyaktuk,ca
    Processing record 104 of 501 | salinopolis
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=salinopolis,br
    Processing record 105 of 501 | gambela
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=gambela,et
    Processing record 106 of 501 | igarka
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=igarka,ru
    Processing record 107 of 501 | skorodnoye
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=skorodnoye,ru
    Processing record 108 of 501 | cabo san lucas
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=cabo%20san%20lucas,mx
    Processing record 109 of 501 | albany
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=albany,au
    Processing record 110 of 501 | lakes entrance
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=lakes%20entrance,au
    Processing record 111 of 501 | fortuna
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=fortuna,us
    Processing record 112 of 501 | goundam
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=goundam,ml
    Processing record 113 of 501 | cayambe
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=cayambe,ec
    Processing record 114 of 501 | saint george
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=saint%20george,bm
    Processing record 115 of 501 | porbandar
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=porbandar,in
    Processing record 116 of 501 | lavrentiya
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=lavrentiya,ru
    Processing record 117 of 501 | longyearbyen
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=longyearbyen,sj
    Processing record 118 of 501 | great yarmouth
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=great%20yarmouth,gb
    Processing record 119 of 501 | praia da vitoria
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=praia%20da%20vitoria,pt
    Processing record 120 of 501 | ijaki
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ijaki,ki
    Processing record 121 of 501 | abu dhabi
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=abu%20dhabi,ae
    Processing record 122 of 501 | ponta do sol
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ponta%20do%20sol,cv
    Processing record 123 of 501 | sault sainte marie
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sault%20sainte%20marie,ca
    Processing record 124 of 501 | sentyabrskiy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sentyabrskiy,ru
    Processing record 125 of 501 | port blair
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=port%20blair,in
    Processing record 126 of 501 | chapada dos guimaraes
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=chapada%20dos%20guimaraes,br
    Processing record 127 of 501 | valparaiso
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=valparaiso,cl
    Processing record 128 of 501 | zabol
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=zabol,ir
    Processing record 129 of 501 | san quintin
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=san%20quintin,mx
    Processing record 130 of 501 | amderma
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=amderma,ru
    Processing record 131 of 501 | quesnel
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=quesnel,ca
    Processing record 132 of 501 | saint-augustin
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=saint-augustin,ca
    Processing record 133 of 501 | chuy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=chuy,uy
    Processing record 134 of 501 | vaitupu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=vaitupu,wf
    Processing record 135 of 501 | mogadishu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=mogadishu,so
    Processing record 136 of 501 | coruripe
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=coruripe,br
    Processing record 137 of 501 | kodiak
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kodiak,us
    Processing record 138 of 501 | rungata
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=rungata,ki
    Processing record 139 of 501 | haines junction
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=haines%20junction,ca
    Processing record 140 of 501 | santiago de cao
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=santiago%20de%20cao,pe
    Processing record 141 of 501 | aykhal
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=aykhal,ru
    Processing record 142 of 501 | shimoda
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=shimoda,jp
    Processing record 143 of 501 | saskylakh
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=saskylakh,ru
    Processing record 144 of 501 | novobelokatay
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=novobelokatay,ru
    Processing record 145 of 501 | banyo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=banyo,cm
    Processing record 146 of 501 | new norfolk
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=new%20norfolk,au
    Processing record 147 of 501 | hervey bay
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=hervey%20bay,au
    Processing record 148 of 501 | camana
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=camana,pe
    Processing record 149 of 501 | cape town
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=cape%20town,za
    Processing record 150 of 501 | tarnow
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tarnow,pl
    Processing record 151 of 501 | broome
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=broome,au
    Processing record 152 of 501 | bilibino
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bilibino,ru
    Processing record 153 of 501 | codrington
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=codrington,ag
    Processing record 154 of 501 | klaksvik
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=klaksvik,fo
    Processing record 155 of 501 | adrar
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=adrar,dz
    Processing record 156 of 501 | boulder
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=boulder,us
    Processing record 157 of 501 | srednekolymsk
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=srednekolymsk,ru
    Processing record 158 of 501 | port elizabeth
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=port%20elizabeth,za
    Processing record 159 of 501 | mar del plata
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=mar%20del%20plata,ar
    Processing record 160 of 501 | koumac
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=koumac,nc
    Processing record 161 of 501 | georgetown
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=georgetown,sh
    Processing record 162 of 501 | nikolskoye
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=nikolskoye,ru
    Processing record 163 of 501 | alofi
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=alofi,nu
    Processing record 164 of 501 | port augusta
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=port%20augusta,au
    Processing record 165 of 501 | mahebourg
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=mahebourg,mu
    Processing record 166 of 501 | asau
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=asau,tv
    Processing record 167 of 501 | hofn
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=hofn,is
    Processing record 168 of 501 | meyungs
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=meyungs,pw
    Processing record 169 of 501 | silver city
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=silver%20city,us
    Processing record 170 of 501 | victoria
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=victoria,sc
    Processing record 171 of 501 | port hawkesbury
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=port%20hawkesbury,ca
    Processing record 172 of 501 | sorong
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sorong,id
    Processing record 173 of 501 | baghdad
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=baghdad,iq
    Processing record 174 of 501 | thunder bay
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=thunder%20bay,ca
    Processing record 175 of 501 | khonuu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=khonuu,ru
    Processing record 176 of 501 | culpeper
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=culpeper,us
    Processing record 177 of 501 | bethel
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bethel,us
    Processing record 178 of 501 | derventa
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=derventa,ba
    Processing record 179 of 501 | chimore
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=chimore,bo
    Processing record 180 of 501 | kasungu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kasungu,mw
    Processing record 181 of 501 | sao joao da barra
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sao%20joao%20da%20barra,br
    Processing record 182 of 501 | torbay
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=torbay,ca
    Processing record 183 of 501 | bambous virieux
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bambous%20virieux,mu
    Processing record 184 of 501 | tukrah
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tukrah,ly
    Processing record 185 of 501 | thompson
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=thompson,ca
    Processing record 186 of 501 | mayo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=mayo,ca
    Processing record 187 of 501 | parambu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=parambu,br
    Processing record 188 of 501 | alotau
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=alotau,pg
    Processing record 189 of 501 | upington
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=upington,za
    Processing record 190 of 501 | pevek
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=pevek,ru
    Processing record 191 of 501 | wilmington
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=wilmington,us
    Processing record 192 of 501 | high level
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=high%20level,ca
    Processing record 193 of 501 | paracatu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=paracatu,br
    Processing record 194 of 501 | sistranda
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sistranda,no
    Processing record 195 of 501 | grindavik
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=grindavik,is
    Processing record 196 of 501 | grand river south east
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=grand%20river%20south%20east,mu
    Processing record 197 of 501 | ostrovnoy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ostrovnoy,ru
    Processing record 198 of 501 | kanigoro
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kanigoro,id
    Processing record 199 of 501 | yerbogachen
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=yerbogachen,ru
    Processing record 200 of 501 | nalut
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=nalut,ly
    Processing record 201 of 501 | dawei
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=dawei,mm
    Processing record 202 of 501 | westport
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=westport,ie
    Processing record 203 of 501 | college
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=college,us
    Processing record 204 of 501 | itarema
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=itarema,br
    Processing record 205 of 501 | blagoyevo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=blagoyevo,ru
    Processing record 206 of 501 | hilo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=hilo,us
    Processing record 207 of 501 | vila velha
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=vila%20velha,br
    Processing record 208 of 501 | tessalit
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tessalit,ml
    Processing record 209 of 501 | hasaki
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=hasaki,jp
    Processing record 210 of 501 | port hardy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=port%20hardy,ca
    Processing record 211 of 501 | awbari
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=awbari,ly
    Processing record 212 of 501 | visby
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=visby,se
    Processing record 213 of 501 | goya
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=goya,ar
    Processing record 214 of 501 | bengkulu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bengkulu,id
    Processing record 215 of 501 | acajutla
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=acajutla,sv
    Processing record 216 of 501 | kasama
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kasama,zm
    Processing record 217 of 501 | gobabis
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=gobabis,na
    Processing record 218 of 501 | te anau
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=te%20anau,nz
    Processing record 219 of 501 | arraial do cabo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=arraial%20do%20cabo,br
    Processing record 220 of 501 | baruun-urt
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=baruun-urt,mn
    Processing record 221 of 501 | kaitangata
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kaitangata,nz
    Processing record 222 of 501 | vadso
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=vadso,no
    Processing record 223 of 501 | sur
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sur,om
    Processing record 224 of 501 | avarua
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=avarua,ck
    Processing record 225 of 501 | mrirt
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=mrirt,ma
    Processing record 226 of 501 | ust-koksa
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ust-koksa,ru
    Processing record 227 of 501 | salym
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=salym,ru
    Processing record 228 of 501 | bozovici
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bozovici,ro
    Processing record 229 of 501 | eyl
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=eyl,so
    Processing record 230 of 501 | dubenskiy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=dubenskiy,ru
    Processing record 231 of 501 | hithadhoo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=hithadhoo,mv
    Processing record 232 of 501 | yaan
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=yaan,cn
    Processing record 233 of 501 | puerto madryn
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=puerto%20madryn,ar
    Processing record 234 of 501 | danilovka
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=danilovka,ru
    Processing record 235 of 501 | caraquet
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=caraquet,ca
    Processing record 236 of 501 | cherskiy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=cherskiy,ru
    Processing record 237 of 501 | husavik
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=husavik,is
    Processing record 238 of 501 | taksimo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=taksimo,ru
    Processing record 239 of 501 | bonavista
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bonavista,ca
    Processing record 240 of 501 | nemuro
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=nemuro,jp
    Processing record 241 of 501 | puerto ayora
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=puerto%20ayora,ec
    Processing record 242 of 501 | tagusao
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tagusao,ph
    Processing record 243 of 501 | dikson
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=dikson,ru
    Processing record 244 of 501 | faro
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=faro,pt
    Processing record 245 of 501 | ordubad
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ordubad,az
    Processing record 246 of 501 | seka
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=seka,th
    Processing record 247 of 501 | ilulissat
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ilulissat,gl
    Processing record 248 of 501 | abu samrah
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=abu%20samrah,qa
    Processing record 249 of 501 | kahului
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kahului,us
    Processing record 250 of 501 | marawi
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=marawi,sd
    Processing record 251 of 501 | sulina
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sulina,ro
    Processing record 252 of 501 | vardo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=vardo,no
    Processing record 253 of 501 | illoqqortoormiut
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=illoqqortoormiut,gl
    Processing record 254 of 501 | bako
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bako,et
    Processing record 255 of 501 | severo-kurilsk
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=severo-kurilsk,ru
    Processing record 256 of 501 | ahipara
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ahipara,nz
    Processing record 257 of 501 | ivankiv
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ivankiv,ua
    Processing record 258 of 501 | bowen
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bowen,au
    Processing record 259 of 501 | acuna
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=acuna,mx
    Processing record 260 of 501 | gorno-chuyskiy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=gorno-chuyskiy,ru
    Processing record 261 of 501 | proti
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=proti,gr
    Processing record 262 of 501 | turbat
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=turbat,pk
    Processing record 263 of 501 | chokurdakh
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=chokurdakh,ru
    Processing record 264 of 501 | sorvag
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sorvag,fo
    Processing record 265 of 501 | okha
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=okha,ru
    Processing record 266 of 501 | iqaluit
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=iqaluit,ca
    Processing record 267 of 501 | manuk mangkaw
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=manuk%20mangkaw,ph
    Processing record 268 of 501 | belaya gora
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=belaya%20gora,ru
    Processing record 269 of 501 | santa cruz
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=santa%20cruz,cr
    Processing record 270 of 501 | zyryanka
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=zyryanka,ru
    Processing record 271 of 501 | galesong
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=galesong,id
    Processing record 272 of 501 | rosarito
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=rosarito,mx
    Processing record 273 of 501 | kamenskoye
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kamenskoye,ru
    Processing record 274 of 501 | vostok
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=vostok,ru
    Processing record 275 of 501 | mount isa
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=mount%20isa,au
    Processing record 276 of 501 | comodoro rivadavia
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=comodoro%20rivadavia,ar
    Processing record 277 of 501 | acarau
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=acarau,br
    Processing record 278 of 501 | deputatskiy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=deputatskiy,ru
    Processing record 279 of 501 | flinders
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=flinders,au
    Processing record 280 of 501 | nanchong
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=nanchong,cn
    Processing record 281 of 501 | sinnamary
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sinnamary,gf
    Processing record 282 of 501 | lompoc
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=lompoc,us
    Processing record 283 of 501 | vestmannaeyjar
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=vestmannaeyjar,is
    Processing record 284 of 501 | kannauj
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kannauj,in
    Processing record 285 of 501 | saurimo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=saurimo,ao
    Processing record 286 of 501 | emba
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=emba,kz
    Processing record 287 of 501 | faanui
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=faanui,pf
    Processing record 288 of 501 | acapulco
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=acapulco,mx
    Processing record 289 of 501 | komsomolskiy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=komsomolskiy,ru
    Processing record 290 of 501 | quang ngai
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=quang%20ngai,vn
    Processing record 291 of 501 | pilar
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=pilar,py
    Processing record 292 of 501 | dzilam gonzalez
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=dzilam%20gonzalez,mx
    Processing record 293 of 501 | kondinskoye
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kondinskoye,ru
    Processing record 294 of 501 | thinadhoo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=thinadhoo,mv
    Processing record 295 of 501 | waitati
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=waitati,nz
    Processing record 296 of 501 | ayutla
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ayutla,mx
    Processing record 297 of 501 | shubarkuduk
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=shubarkuduk,kz
    Processing record 298 of 501 | satitoa
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=satitoa,ws
    Processing record 299 of 501 | kankan
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kankan,gn
    Processing record 300 of 501 | lagoa
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=lagoa,pt
    Processing record 301 of 501 | padang
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=padang,id
    Processing record 302 of 501 | isangel
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=isangel,vu
    Processing record 303 of 501 | maningrida
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=maningrida,au
    Processing record 304 of 501 | plettenberg bay
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=plettenberg%20bay,za
    Processing record 305 of 501 | taoudenni
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=taoudenni,ml
    Processing record 306 of 501 | russell
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=russell,nz
    Processing record 307 of 501 | scarborough
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=scarborough,tt
    Processing record 308 of 501 | duluth
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=duluth,us
    Processing record 309 of 501 | hinton
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=hinton,ca
    Processing record 310 of 501 | shagonar
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=shagonar,ru
    Processing record 311 of 501 | zaysan
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=zaysan,kz
    Processing record 312 of 501 | semey
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=semey,kz
    Processing record 313 of 501 | kruisfontein
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kruisfontein,za
    Processing record 314 of 501 | guiratinga
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=guiratinga,br
    Processing record 315 of 501 | rio gallegos
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=rio%20gallegos,ar
    Processing record 316 of 501 | attawapiskat
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=attawapiskat,ca
    Processing record 317 of 501 | yulara
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=yulara,au
    Processing record 318 of 501 | xicotencatl
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=xicotencatl,mx
    Processing record 319 of 501 | rawson
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=rawson,ar
    Processing record 320 of 501 | geraldton
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=geraldton,au
    Processing record 321 of 501 | faya
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=faya,td
    Processing record 322 of 501 | talaya
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=talaya,ru
    Processing record 323 of 501 | vila franca do campo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=vila%20franca%20do%20campo,pt
    Processing record 324 of 501 | killarney
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=killarney,ca
    Processing record 325 of 501 | ron phibun
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ron%20phibun,th
    Processing record 326 of 501 | gat
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=gat,ly
    Processing record 327 of 501 | tiksi
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tiksi,ru
    Processing record 328 of 501 | cabra
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=cabra,ph
    Processing record 329 of 501 | hambantota
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=hambantota,lk
    Processing record 330 of 501 | anchorage
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=anchorage,us
    Processing record 331 of 501 | zhitikara
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=zhitikara,kz
    Processing record 332 of 501 | veraval
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=veraval,in
    Processing record 333 of 501 | fort nelson
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=fort%20nelson,ca
    Processing record 334 of 501 | aklavik
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=aklavik,ca
    Processing record 335 of 501 | louisbourg
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=louisbourg,ca
    Processing record 336 of 501 | warqla
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=warqla,dz
    Processing record 337 of 501 | vigrestad
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=vigrestad,no
    Processing record 338 of 501 | leningradskiy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=leningradskiy,ru
    Processing record 339 of 501 | kavieng
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kavieng,pg
    Processing record 340 of 501 | kalabo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kalabo,zm
    Processing record 341 of 501 | kandrian
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kandrian,pg
    Processing record 342 of 501 | nara
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=nara,ml
    Processing record 343 of 501 | mao
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=mao,td
    Processing record 344 of 501 | pitimbu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=pitimbu,br
    Processing record 345 of 501 | kawalu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kawalu,id
    Processing record 346 of 501 | zhaotong
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=zhaotong,cn
    Processing record 347 of 501 | baculin
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=baculin,ph
    Processing record 348 of 501 | naze
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=naze,jp
    Processing record 349 of 501 | pisco
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=pisco,pe
    Processing record 350 of 501 | dumas
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=dumas,us
    Processing record 351 of 501 | chingola
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=chingola,zm
    Processing record 352 of 501 | shenkursk
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=shenkursk,ru
    Processing record 353 of 501 | sitka
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sitka,us
    Processing record 354 of 501 | buala
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=buala,sb
    Processing record 355 of 501 | yeppoon
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=yeppoon,au
    Processing record 356 of 501 | skjervoy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=skjervoy,no
    Processing record 357 of 501 | nnewi
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=nnewi,ng
    Processing record 358 of 501 | kalaleh
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kalaleh,ir
    Processing record 359 of 501 | sioux lookout
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sioux%20lookout,ca
    Processing record 360 of 501 | ancud
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ancud,cl
    Processing record 361 of 501 | doha
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=doha,kw
    Processing record 362 of 501 | ketchikan
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ketchikan,us
    Processing record 363 of 501 | lenger
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=lenger,kz
    Processing record 364 of 501 | samusu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=samusu,ws
    Processing record 365 of 501 | tawnat
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tawnat,ma
    Processing record 366 of 501 | yumen
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=yumen,cn
    Processing record 367 of 501 | kavaratti
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kavaratti,in
    Processing record 368 of 501 | mys shmidta
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=mys%20shmidta,ru
    Processing record 369 of 501 | rio grande
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=rio%20grande,br
    Processing record 370 of 501 | lewistown
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=lewistown,us
    Processing record 371 of 501 | bubaque
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bubaque,gw
    Processing record 372 of 501 | hamilton
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=hamilton,bm
    Processing record 373 of 501 | tabiauea
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tabiauea,ki
    Processing record 374 of 501 | sabha
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sabha,jo
    Processing record 375 of 501 | altamont
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=altamont,us
    Processing record 376 of 501 | bambanglipuro
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bambanglipuro,id
    Processing record 377 of 501 | khuzhir
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=khuzhir,ru
    Processing record 378 of 501 | ponta do sol
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ponta%20do%20sol,pt
    Processing record 379 of 501 | ambilobe
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ambilobe,mg
    Processing record 380 of 501 | palmeiras de goias
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=palmeiras%20de%20goias,br
    Processing record 381 of 501 | koslan
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=koslan,ru
    Processing record 382 of 501 | otradnoye
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=otradnoye,ru
    Processing record 383 of 501 | naron
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=naron,es
    Processing record 384 of 501 | omsukchan
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=omsukchan,ru
    Processing record 385 of 501 | walvis bay
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=walvis%20bay,na
    Processing record 386 of 501 | batemans bay
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=batemans%20bay,au
    Processing record 387 of 501 | nsunga
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=nsunga,tz
    Processing record 388 of 501 | plouzane
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=plouzane,fr
    Processing record 389 of 501 | volokolamsk
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=volokolamsk,ru
    Processing record 390 of 501 | channagiri
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=channagiri,in
    Processing record 391 of 501 | rapid valley
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=rapid%20valley,us
    Processing record 392 of 501 | portsmouth
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=portsmouth,us
    Processing record 393 of 501 | udachnyy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=udachnyy,ru
    Processing record 394 of 501 | mount gambier
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=mount%20gambier,au
    Processing record 395 of 501 | tolbazy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tolbazy,ru
    Processing record 396 of 501 | maloh
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=maloh,ph
    Processing record 397 of 501 | souillac
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=souillac,mu
    Processing record 398 of 501 | sept-iles
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sept-iles,ca
    Processing record 399 of 501 | katobu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=katobu,id
    Processing record 400 of 501 | tres arroyos
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tres%20arroyos,ar
    Processing record 401 of 501 | tynda
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tynda,ru
    Processing record 402 of 501 | banda
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=banda,in
    Processing record 403 of 501 | port townsend
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=port%20townsend,us
    Processing record 404 of 501 | half moon bay
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=half%20moon%20bay,us
    Processing record 405 of 501 | morlaix
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=morlaix,fr
    Processing record 406 of 501 | tigzirt
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tigzirt,dz
    Processing record 407 of 501 | vanavara
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=vanavara,ru
    Processing record 408 of 501 | marcona
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=marcona,pe
    Processing record 409 of 501 | dibaya
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=dibaya,cd
    Processing record 410 of 501 | bilma
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bilma,ne
    Processing record 411 of 501 | tilichiki
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tilichiki,ru
    Processing record 412 of 501 | tongzi
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tongzi,cn
    Processing record 413 of 501 | kalemie
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kalemie,cd
    Processing record 414 of 501 | samarai
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=samarai,pg
    Processing record 415 of 501 | avera
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=avera,pf
    Processing record 416 of 501 | fare
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=fare,pf
    Processing record 417 of 501 | humaita
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=humaita,py
    Processing record 418 of 501 | port-gentil
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=port-gentil,ga
    Processing record 419 of 501 | sobolevo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sobolevo,ru
    Processing record 420 of 501 | beringovskiy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=beringovskiy,ru
    Processing record 421 of 501 | ampanihy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ampanihy,mg
    Processing record 422 of 501 | tumannyy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tumannyy,ru
    Processing record 423 of 501 | lianran
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=lianran,cn
    Processing record 424 of 501 | morro da fumaca
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=morro%20da%20fumaca,br
    Processing record 425 of 501 | porto velho
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=porto%20velho,br
    Processing record 426 of 501 | pointe michel
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=pointe%20michel,dm
    Processing record 427 of 501 | petropavlovsk-kamchatskiy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=petropavlovsk-kamchatskiy,ru
    Processing record 428 of 501 | zig
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=zig,az
    Processing record 429 of 501 | marzuq
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=marzuq,ly
    Processing record 430 of 501 | kahone
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=kahone,sn
    Processing record 431 of 501 | ponnampet
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=ponnampet,in
    Processing record 432 of 501 | chapais
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=chapais,ca
    Processing record 433 of 501 | puerto carreno
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=puerto%20carreno,co
    Processing record 434 of 501 | richards bay
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=richards%20bay,za
    Processing record 435 of 501 | port lincoln
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=port%20lincoln,au
    Processing record 436 of 501 | east wenatchee bench
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=east%20wenatchee%20bench,us
    Processing record 437 of 501 | neuquen
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=neuquen,ar
    Processing record 438 of 501 | findochty
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=findochty,gb
    Processing record 439 of 501 | neyshabur
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=neyshabur,ir
    Processing record 440 of 501 | syasstroy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=syasstroy,ru
    Processing record 441 of 501 | arvika
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=arvika,se
    Processing record 442 of 501 | marrakesh
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=marrakesh,ma
    Processing record 443 of 501 | mahibadhoo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=mahibadhoo,mv
    Processing record 444 of 501 | batticaloa
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=batticaloa,lk
    Processing record 445 of 501 | touros
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=touros,br
    Processing record 446 of 501 | coolum beach
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=coolum%20beach,au
    Processing record 447 of 501 | nyuksenitsa
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=nyuksenitsa,ru
    Processing record 448 of 501 | sakakah
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sakakah,sa
    Processing record 449 of 501 | dunmore town
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=dunmore%20town,bs
    Processing record 450 of 501 | buluang
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=buluang,ph
    Processing record 451 of 501 | bonthe
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bonthe,sl
    Processing record 452 of 501 | north bend
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=north%20bend,us
    Processing record 453 of 501 | barcelos
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=barcelos,br
    Processing record 454 of 501 | alyangula
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=alyangula,au
    Processing record 455 of 501 | alice springs
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=alice%20springs,au
    Processing record 456 of 501 | andenes
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=andenes,no
    Processing record 457 of 501 | machala
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=machala,ec
    Processing record 458 of 501 | bokspits
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=bokspits,bw
    Processing record 459 of 501 | dingle
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=dingle,ie
    Processing record 460 of 501 | honiara
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=honiara,sb
    Processing record 461 of 501 | falealupo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=falealupo,ws
    Processing record 462 of 501 | la ronge
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=la%20ronge,ca
    Processing record 463 of 501 | maniitsoq
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=maniitsoq,gl
    Processing record 464 of 501 | goderich
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=goderich,sl
    Processing record 465 of 501 | inverell
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=inverell,au
    Processing record 466 of 501 | forrest city
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=forrest%20city,us
    Processing record 467 of 501 | araguaina
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=araguaina,br
    Processing record 468 of 501 | uwayl
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=uwayl,sd
    Processing record 469 of 501 | dukat
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=dukat,ru
    Processing record 470 of 501 | umzimvubu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=umzimvubu,za
    Processing record 471 of 501 | karaul
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=karaul,ru
    Processing record 472 of 501 | georgetown
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=georgetown,gy
    Processing record 473 of 501 | tshane
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=tshane,bw
    Processing record 474 of 501 | morondava
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=morondava,mg
    Processing record 475 of 501 | nampa
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=nampa,us
    Processing record 476 of 501 | palabuhanratu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=palabuhanratu,id
    Processing record 477 of 501 | buraydah
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=buraydah,sa
    Processing record 478 of 501 | windsor
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=windsor,ca
    Processing record 479 of 501 | sanghar
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sanghar,pk
    Processing record 480 of 501 | mayumba
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=mayumba,ga
    Processing record 481 of 501 | san jeronimo
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=san%20jeronimo,mx
    Processing record 482 of 501 | roebourne
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=roebourne,au
    Processing record 483 of 501 | grand gaube
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=grand%20gaube,mu
    Processing record 484 of 501 | barra do garcas
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=barra%20do%20garcas,br
    Processing record 485 of 501 | fairbanks
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=fairbanks,us
    Processing record 486 of 501 | gazanjyk
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=gazanjyk,tm
    Processing record 487 of 501 | oranjemund
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=oranjemund,na
    Processing record 488 of 501 | glubokoe
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=glubokoe,kz
    Processing record 489 of 501 | santa comba
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=santa%20comba,es
    Processing record 490 of 501 | jorpeland
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=jorpeland,no
    Processing record 491 of 501 | lujan
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=lujan,ar
    Processing record 492 of 501 | beyneu
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=beyneu,kz
    Processing record 493 of 501 | cam ranh
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=cam%20ranh,vn
    Processing record 494 of 501 | rairangpur
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=rairangpur,in
    Processing record 495 of 501 | lexington
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=lexington,us
    Processing record 496 of 501 | svetlyy
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=svetlyy,ru
    Processing record 497 of 501 | araouane
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=araouane,ml
    Processing record 498 of 501 | celestun
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=celestun,mx
    Processing record 499 of 501 | sisimiut
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=sisimiut,gl
    Processing record 500 of 501 | san patricio
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=san%20patricio,mx
    Processing record 501 of 501 | chifeng
    http://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=a1c8f8cd7a84e8443ff2e8d63d4d96a4&q=chifeng,cn
    


```python
city_data = []
cloudiness_data = []
country_data = []
date_data = []
humidity_data = []
lat_data = []
lng_data = []
max_temp_data = []
wind_speed_data = []
for data in weather_data:
    if data['cod'] == 200:
        city_data.append(data['name'])
        cloudiness_data.append(data['clouds']['all'])
        country_data.append(data['sys']['country'])
        date_data.append(data['dt'])
        humidity_data.append(data['main']['humidity'])
        lat_data.append(data['coord']['lat'])
        lng_data.append(data['coord']['lon'])
        max_temp_data.append(data['main']['temp_max'])
        wind_speed_data.append(data['wind']['speed'])

weather_dict = {"City": city_data,
                "Cloudiness": cloudiness_data,
                "Country": country_data,
                "Date": date_data,
                "Humidity": humidity_data,
                "Lat": lat_data,
                "Lng": lng_data,
                "Max Temp": max_temp_data,
                "Wind Speed": wind_speed_data}
weather_data_df = pd.DataFrame(weather_dict)
print(weather_data_df.head())
print()
print(weather_data_df.info())
print()
print("Number of cities with weather information: " + str(len(weather_data_df))) 
```

             City  Cloudiness Country        Date  Humidity    Lat     Lng  \
    0    Sidi Ali           0      DZ  1529963994        60  36.10    0.42   
    1    Khatanga          44      RU  1529963995        62  71.98  102.47   
    2  Porto Novo          20      CV  1529960400        78  17.02  -25.06   
    3    Filingue           8      NE  1529963995        59  14.35    3.32   
    4  Nanortalik          64      GL  1529963993       100  60.14  -45.24   
    
       Max Temp  Wind Speed  
    0     73.54        2.68  
    1     61.48       13.98  
    2     73.40       21.92  
    3     86.14        4.70  
    4     36.28       22.70  
    
    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 432 entries, 0 to 431
    Data columns (total 9 columns):
    City          432 non-null object
    Cloudiness    432 non-null int64
    Country       432 non-null object
    Date          432 non-null int64
    Humidity      432 non-null int64
    Lat           432 non-null float64
    Lng           432 non-null float64
    Max Temp      432 non-null float64
    Wind Speed    432 non-null float64
    dtypes: float64(4), int64(3), object(2)
    memory usage: 30.5+ KB
    None
    
    Number of cities with weather information: 432
    


```python
# Convert formatted date
report_date = datetime.fromtimestamp(weather_data_df["Date"].min()).strftime('%m-%d-%y')

# Generate scatter plot for "City Latitude vs. Max Temperature" and save as an image
plt.figure(figsize=(8, 6), dpi=80)
plt.scatter(weather_data_df["Lat"], weather_data_df["Max Temp"], marker="o", edgecolor='b', s=15)

title = ("City Latitude vs. Max Temperature (" + str(report_date) + ")")
plt.title(title)
plt.ylabel("Max Temperature (F)")
plt.xlabel("Latitude")
plt.xlim(-90,90)
plt.ylim(-70,125)
plt.grid(True)

plt.savefig("C:/Users/ELIZA/Dropbox/Homework/CityLatitudeVsMaxTemperature.png")

plt.show()
```


![png](output_6_0.png)



```python
# Generate scatter plot for "City Latitude vs. Humidity" and save as an image
plt.figure(figsize=(8, 6), dpi=80)
plt.scatter(weather_data_df["Lat"], weather_data_df["Humidity"], marker="o", edgecolor='b', s=15)

title = ("City Latitude vs. Humidity (" + str(report_date) + ")")
plt.title(title)
plt.ylabel("Humidity (%)")
plt.xlabel("Latitude")
plt.xlim(-90,90)
plt.ylim(-10,110)
plt.grid(True)

plt.savefig("C:/Users/ELIZA/Dropbox/Homework/CityLatitudeVsHumidity.png")

plt.show()
```


![png](output_7_0.png)



```python
# Generate scatter plot for "City Latitude vs. Cloudiness" and save as an image
plt.figure(figsize=(8, 6), dpi=80)
plt.scatter(weather_data_df["Lat"], weather_data_df["Cloudiness"], marker="o", edgecolor='b', s=15)

title = ("City Latitude vs. Cloudiness (" + str(report_date) + ")")
plt.title(title)
plt.ylabel("Cloudiness (%)")
plt.xlabel("Latitude")
plt.xlim(-90,90)
plt.ylim(-10,110)
plt.grid(True)

plt.savefig("C:/Users/ELIZA/Dropbox/Homework/CityLatitudeVsCloudiness.png")

plt.show()
```


![png](output_8_0.png)



```python
# Generate scatter plot for "City Latitude vs. Wind Speed" and save as an image
plt.figure(figsize=(8, 6), dpi=80)
plt.scatter(weather_data_df["Lat"], weather_data_df["Wind Speed"], marker="o", edgecolor='b', s=15)

title = ("City Latitude vs. Wind Speed (" + str(report_date) + ")")
plt.title(title)
plt.ylabel("Wind Speed (mph)")
plt.xlabel("Latitude")
plt.xlim(-90,90)
plt.ylim(-5,40)
plt.grid(True)

plt.savefig("C:/Users/ELIZA/Dropbox/Homework/CityLatitudeVsWindSpeed.png")

plt.show()
```


![png](output_9_0.png)



```python
# Generate scatter plot for "City Latitude vs. Wind Speed" and save as an image
plt.figure(figsize=(8, 6), dpi=80)
plt.scatter(weather_data_df["Lat"], weather_data_df["Wind Speed"], marker="o", edgecolor='b', s=15)

title = ("City Latitude vs. Wind Speed (" + str(report_date) + ")")
plt.title(title)
plt.ylabel("Wind Speed (mph)")
plt.xlabel("Latitude")
plt.xlim(-90,90)
plt.ylim(-5,40)
plt.grid(True)

plt.savefig("C:/Users/ELIZA/Dropbox/Homework/CityLatitudeVsWindSpeed.png")

plt.show()

```


![png](output_10_0.png)

