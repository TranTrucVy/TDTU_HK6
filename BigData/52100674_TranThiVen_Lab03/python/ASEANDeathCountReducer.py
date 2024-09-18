import sys

current_country = None
total_deaths = 0

for line in sys.stdin:
    country, deaths = line.strip().split('\t')
    deaths = int(deaths)

    if current_country and current_country != country:
        print(f"{current_country}\t{total_deaths}")
        total_deaths = 0

    current_country = country
    total_deaths += deaths

if current_country:
    print(f"{current_country}\t{total_deaths}")