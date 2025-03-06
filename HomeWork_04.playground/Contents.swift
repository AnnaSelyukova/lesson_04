// MARK: 1. Написать функции, которая:
//- Будет просто выводить в консоль ”Hello, world!”.
//- Будет принимать аргумент “имя” и выводить в консоль “Hello, имя” (вызов функции должен быть следующим - printHi(“Misha”)).


func printHi() {
    print("Hello, world!")
}

func printHelloName(_ name: String = "Guest") {
    print("Hello, \(name)!")
}
printHelloName("Anna")

print("-----------------------")


// MARK: 2. Написать функцию, которая принимает две строки и возвращает сумму количества символов двух строк.

func countSymbolStrings(string1: String, string2: String) {
  let countStrings = string1.count + string2.count
    print("В строках всего \(countStrings) символов")
}

countSymbolStrings(string1: "Hello", string2: "World!")

print("-----------------------")


// MARK: 3. Написать функцию, которая выводит в консоль квадрат переданного числа.
func squareNumber(num: Int) -> Int {
    num * num
}


// MARK: 4. Создать функцию, которая принимает параметры и вычисляет площадь круга.

func areaOfTteCircle(radius: Double) -> Double {
    let pi = 3.14
    return pi * radius
}



// MARK: 5. Создать функцию, которая принимает логический тип “ночь ли сегодня” и возвращает строку с описанием времени суток. Можно делать с логическим типом, можно делать со временем.

// вариант 1
func dayOrNight(isNight: Bool) -> String {
    isNight ? "Сейчас ночь" : "Сейчас день"
}

dayOrNight(isNight: true)

// вариант 2

func dayOrNight(time: Int) -> String {
    let time = time
    switch time {
    case 6...24:
      return  "Сейчас день"
    case 0...5:
       return "Сейчас ночь"
    default:
       return "error"
    }
}

dayOrNight(time: 3)

//MARK: 6. Создать функцию, принимающую 1 аргумент — номер месяца (от 1 до 12), и возвращающую время года, которому этот месяц принадлежит (зима, весна, лето или осень).

func monthOfYear(numberOfMonth: Int) -> String {
    let monthOfYear = numberOfMonth

    switch monthOfYear {
    case 12, 1, 2:
        return "Зима"
    case 3...5:
        return "Весна"
    case 6...8:
        return "Лето"
    case 9...11:
        return "Осень"
   default:
        return "В году нет столько месяцев! Введите значение от 1 до 12"
    }
}

// MARK: 7. Разбить номер телефона на составляющие. Код страны, код оператора, сам номер.
//Используем функции строки: prefix, suffix. разобрала задачу частично
//

func differentNumberOfPhone(number: String) -> String {
    let numberPhone = number
    if numberPhone.count < 12 || numberPhone.count > 12 {
        print("Введите корректное значение номера телефона равное 12 символам в формате +7**********")
    }

    return "Код страны \(numberPhone.prefix(2)),  номер телефона \(numberPhone.suffix(7))"

}

let myNumberOfPhone = differentNumberOfPhone(number: "+79085678877")
print(myNumberOfPhone)

print("-----------------------")

//MARK: 8*. Создать функцию, принимающую 1 аргумент — число от 0 до 100, и возвращающую true, если оно простое, и false, если сложное. Рекомендую попробовать решать рекурсией, чтобы разобраться как она работает.

func evenOrOddNumber(number: Int) -> Bool {
    guard number >= 100 && number < 0 else
    { print("Число должно быть от 0 до 100.")
        return false }

    if number % 2 == 0 {
        return true
    } else {
        return false
    }
}
evenOrOddNumber(number: 100)


print("-----------------------")

// MARK: 9*. Создать функцию, которая считает факториал введённого числа.

func factorial(n: Int) {
let result = ((n - 1) * n)
    print(result)
}

factorial(n: 15)
print("-----------------------")



// MARK: 10*. Создать функцию, которая выводит все числа последовательности Фибоначчи до введённого индекса. Например fib(n:6) -> 0, 1, 1, 2, 3, 5, 8 * пока не разобралась*


//MARK: 11*. Создать функцию, которая считает сумму цифр четырехзначного числа,
//переданного в параметры функции (Int).

func sumOfDigits(number: Int) -> Int? {
    guard number >= 1000 && number <= 9999 else
    { print("Число должно быть четырехзначным.")
        return nil }
    let digitsString = String(number)
    var sum = 0

    for character in digitsString {
        if let digit = Int(String(character)) {
            sum += digit
        }
    }
    return sum
}

