from math import log10, cos, sin, tan

print('Введите x: ')
x = float(input())

if x < 0:
    if (-7 <= x) and (x < 0):
        if x > 0 and sin(x) != 0:
            y = log10(x) * cos(2 * x) + log10(x) / sin(x)
            print(f'{y:.2f}')
        else:
            print('y не существует')
    else:
        y = 2 - cos(2 * x)
        print(f'{y:.2f}')
else:
    if x != 0 and tan(x) != 0:
        y = (x ** 3 / x ** (1 / 3)) * (x / tan(x))
        print(f'{y:.2f}')
    else:
        print('y не существует')

