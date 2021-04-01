'''
Обзор алгоритма сорировки вставками:
    * Сложность: O(n^2) / лучшее время O(n). Лучшее время будет тогда, когда массив уже отсортирован;
    * Устойчивость (стабильность): Устойчивая;
    * Тип (категория): Вставками;
    * Потребление памяти: Не требует дополнительной памяти.

Принцип работы: Из массива последовательно берётся каждый элемент, корме первого (index == 0). Этот элемент вставляется
в отсортированную часть массива. В самом начале сортировки первый элемент массива считается отсортированным.
Далее, мы берём второй элемент и проверям куда его вставить в отсорированную часть, после цепочуи сравнений с
отсорированной частью, она увеличивается на 1 элемент. И таким методом, мы проходимся по всем элементам.
'''

# Генерация массива
import random

size = 20
mass = [i for i in range(size)]
random.shuffle(mass)


# РЕАЛИЗАЦИЯ 1

def insertion_sort(array):
    for i in range(1, len(array)):
        item_to_insert = array[i]
        j = i - 1

        while j >= 0 and array[j] > item_to_insert:
            array[j + 1] = array[j]
            j -= 1
        # Вставляем элемент
        array[j + 1] = item_to_insert

# python -m timeit -n 1000 "import insert" "insert.insertion_sort(insert.mass)"
# 1000 loops, best of 5: 4.45 usec per loop
