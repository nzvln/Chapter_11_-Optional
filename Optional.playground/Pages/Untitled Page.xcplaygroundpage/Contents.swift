import UIKit

var greeting = "Hello, playground"
/* Задание 5
 
 1) Создайте псевдоним типа String с именем Text
 2) Объявите три константы типа Text. Значения дух констант должны состоять только из цифр, а третьей – из букв и цифр
 3) С помощью оператора условия определите те константы, которые состоят только из цифр и выведите из на консоль */

typealias Text = String
let first: Text = "12"
let second: Text = "16"
let third: Text = "3 значение"
if let a = Int(first) {
    print(a)
}
if let b = Int(second) {
    print(b)
}
if let c = Int(third) {
        print(c)
}



/* Задание 6
 
 В задании используются результаты предыдущего задания
 1) Создайте псевдоним типа (numberOne: Text?, numberTwo: Text?) с именем TupleType.
 2) Создайте три переменные типа TupleType, содержащие следующие значения: ("190", "67"), ("100", nil), ("-65", "70").
 3) С помощью конструкции switch-case определите, какие из кортежей не содержат nil в своем составе и выведите значения их элементов на консоль*/
typealias TupleType = (numberOne: Text?, numberTwo: Text?)
var first1: TupleType = ("190","67")
var second2: TupleType = ("100", nil)
var third3: TupleType = ("-67", "70")
switch first1 {
case (let a, let b) where a != nil && b != nil:
print("\(a!),\(b!)")
default:
    break
}
switch second2 {
case (let a, let b) where a != nil && b != nil:
print("\(a!),\(b!)")
default:
    break
}
switch third3 {
case (let a, let b) where a != nil && b != nil:
print("\(a!),\(b!)")
default:
    break
}

/*  Задание 7
 Представьте, что вы являетесь преподавателем курсов по шахматам. Ваши занятия посещают ученики и в конце каждого занятия получаю оценку.
 1) Создайте словарь, который будет содержать информацию о ваших студентах и об их успехах.

 Тип данных словаря – [String: [String: UInt]]
 Индекс – это фамилия ученика.
 Значение – еще один словарь, содержащий информацию о дате занятия и полученной оценке.
 В вашем электронном журнале должна находиться информация о трех учениках, по две оценки для каждого. Фамилии и даты придумайте самостоятельно.
 2) Подсчитайте средний балл каждого студента, средний балл группы, и выведите информацию на консоль.*/
var school: [String:[String: UInt]] = [:]
school["Серегин"] = ["01.09.2021": 2, "01.10.2021": 5]
school["Завалий"] = ["01.09.2021": 5, "01.10.2021": 4]
school["Юрий"] = ["01.09.2021": 5, "01.10.2021": 3]
//2
//средняя оценка группы
var gradeAverageGroup:Float = 0
//количество оценок
var gradeCount = 0
//перебор всех студентов
for oneStudent in school {
    //средняя оценка студента
    var gradeAverageStudent: Float = 0
    //перебор всех занятий
    for lesson in oneStudent.value {
        gradeAverageStudent += Float(lesson.value)
        gradeAverageGroup += Float(lesson.value)
        gradeCount += 1
    }
    gradeAverageStudent /= Float(oneStudent.value.count)
    print("Студент \(oneStudent.key) имеет средний балл \(gradeAverageStudent)" )
}
gradeAverageGroup /= Float(gradeCount)
print("Группа студентов имеет средний балл \(gradeAverageGroup)")

/* Задание 8
 
 Основано на предыдущем задании
 Перед вам стоит задача внести в уже существующий словарь оценку за еще одно занятие для студента. Покажите, каким образом это можно сделать.*/
if var lessons = school["Усов"] {
    lessons["2019-02-05"] = 5
    school["Усов"] = lessons
}

/* Задание 9
 1) Создайте псевдоним Coordinates для типа кортежа (alpha: Character?, num: Int?). Данный тип будет описывать координаты шахматной фигуры на игровом поле. Если вместо элементов кортежа стоит nil, значит фигура не находится на игровом поле.
 2) Создайте псевдоним Chessman для типа словаря [String:Coordinates]. Данный тип описывает шахматную фигуру на игровом поле. В ключе словаря должно хранится имя фигуры, например "White King", а в значении – кортеж, указывающий на координаты фигуры на игровом поле.
 3) Создайте переменный словарь figures типа Chessman и добавьте в него три произвольные фигуры, одна из которых не должна иметь координат.
 4) Создайте цикл, которая обходит всех элементы словаря (все фигуры), и проверяет, убита ли очередная фигура (элемент словаря figures), далее выводит на консоль информацию либо о координатах фигуры, либо о ее отсутствии на игровом поле.*/
typealias Coordinates = (alpha: Character?, num: Int?)
typealias Chessman = [String:Coordinates]
var figures:Chessman = [:]
figures["White King"] = (alpha: "B", num: 1)
figures["White Queen"] = (alpha: nil, num: nil)
figures["Black King"] = (alpha: "F", num: 6)
for one in figures {
    if one.value.0 == nil && one.value.1 == nil {
        print("Фигура \(one.key) не на поле")
    }else{
        print("Фигура \(one.key) на поле")
    }
}
