print('Введите строку')
stroka = input()
print('Введите подстроку, которую нужно инверсировать')
substroka = input()
itog_stroka = ''
index = 0

i = 1
found = False
while i <= len(stroka):
    if (len(stroka) - i + 1) >= len(substroka):
        found = True
        for j in range(len(substroka)):
            if stroka[i + j - 1] != substroka[j]:
                found = False
                break
        if found:
            index = i
            break
    i = i + 1

if found:
    i = 1
    while i <= len(stroka):
        if i == index:
            for j in range(len(substroka)):
                itog_stroka += substroka[len(substroka) - j - 1]
            i += len(substroka)
        else:
            itog_stroka += stroka[i - 1]
            i += 1
    print(itog_stroka)
else:
    print('Данной подстроки нет в строке')
