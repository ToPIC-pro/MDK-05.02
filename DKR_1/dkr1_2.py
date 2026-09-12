from math import log10, cos, sin, tan

print('y на участке [-9;2] с шагом 0.1: ')

for x in range(-90, 20):
    x = x / 10
    if x < 0:
        if (-7 <= x) and (x < 0):
            if x > 0 and sin(x) != 0:
                y = log10(x) * cos(2 * x) + log10(x) / sin(x)
                print('При x =', x, 'y равен ', f'{y:.2f}')
            else:
                print('При x =', x, 'y не существует')
        else:
            y = 2 - cos(2 * x)
            print('При x=', x, 'y равен ', f'{y:.2f}')
    else:
        if x != 0 and tan(x) != 0:
            y = (x ** 3 / x ** (1 / 3)) * (x / tan(x))
            print('При x =', x, 'y равен ', f'{y:.2f}')
        else:
            print('При x =', x, 'y не существует')