print('Сколько элементов будет в массиве?')
n = int(input())
massiv = []
print('Введите элементы массива в разные строки')

for i in range(n):
    new_el = int(input())
    massiv.append(new_el)

max_el = massiv[0]
max_el_ind = 0
min_el = massiv[0]
min_el_ind = 0

for i in range(n):
    if massiv[i] > max_el:
        max_el = massiv[i]
        max_el_ind = i
    if massiv[i] < min_el:
        min_el = massiv[i]
        min_el_ind = i

summa = 0

if max_el_ind > min_el_ind:
    start_ind = min_el_ind + 1
    end_ind = max_el_ind
else:
    start_ind = max_el_ind + 1
    end_ind = min_el_ind


if start_ind < end_ind:
    for i in range(start_ind, end_ind):
        summa = summa + massiv[i]
    print('Сумма элементов между min и max: ', summa)
else:
    print('Между min и max нет элементов')
