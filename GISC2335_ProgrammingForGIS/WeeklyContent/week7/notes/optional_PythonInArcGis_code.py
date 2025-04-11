# coding: utf-8
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week7\data\Ex06\Copy.gdb"
fclist = arcpy.ListFeatureClasses()
print(fclist)
# ['amtrak_stations', 'cities', 'counties', 'new_mexico', 'railroads']
fclist[0]
# 'amtrak_stations'
fclist[-1]
# 'railroads'
fclist[1:3]
# ['cities', 'counties']
fclist[2:]
# ['counties', 'new_mexico', 'railroads']
cities = ["Alameda", "Brazos", "Chimayo", "Dulce"]
len(cities)
# 4
del cities[2]
print(cities)
# ['Alameda', 'Brazos', 'Dulce']
cities.sort()
print(cities)
# ['Alameda', 'Brazos', 'Dulce']
cities.sort(reverse = True)print(cities)
# ﻿  File "<string>", line 1
#     cities.sort(reverse = True)print(cities)
#                                ^^^^^
# ﻿SyntaxError: invalid syntax
cities.sort(reverse = True)
print(cities)
# ['Dulce', 'Brazos', 'Alameda']
"zuni" in cities
# False
cities.append("Zuni")
print(cities)
# ['Dulce', 'Brazos', 'Alameda', 'Zuni']
cities.insert(0, "Espanola")
print(cities)
# ['Espanola', 'Dulce', 'Brazos', 'Alameda', 'Zuni']
countylookup = {"Alameda": "Bernalillo County", "Brazos": "Rio Arriba County", "Chimayo": "Santa Fe County"}
countylookup["Brazos"]
# 'Rio Arriba County'
countylookup["Santa Fe County"]
# ﻿Traceback (most recent call last):
# ﻿  File "<string>", line 1, in <module>
# ﻿KeyError: 'Santa Fe County'
len(countylookup)
# 3
list(countylookup.keys())
# ['Alameda', 'Brazos', 'Chimayo']
list(countylookup.values())
# ['Bernalillo County', 'Rio Arriba County', 'Santa Fe County']
