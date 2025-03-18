import UIKit

// Домашнее задание:

// MARK: - 1. Разработка иерархии классов для геометрических фигур:
//  •  Создайте базовый класс Shape с общими свойствами (например, цвет) и методом calculateArea().

class Shape {
    let color: String

    init(color: String){
        self.color = color
    }
    func calculateArea() -> Double {
        return 0
    }

}

//  •  Создайте подклассы Circle, Rectangle, Triangle, наследующиеся от Shape.
//  •  Переопределите метод calculateArea() в каждом подклассе для вычисления площади соответствующей фигуры.
//  •  Добавьте свойства, специфичные для каждой фигуры (например, радиус для круга, длина и ширина для прямоугольника).
class Circle: Shape {
    let radius: Double

    init(radius: Double, color: String) {
        self.radius = radius
        super.init(color: color)
    }

    override func calculateArea() -> Double {
        return Double.pi * radius * radius
    }
}

class Rectangle: Shape {
    let length: Double
    let width: Double

    init(length: Double, width: Double, color: String) {
        self.length = length
        self.width = width
        super.init(color: color)
    }

    override func calculateArea() -> Double {
      return width * length
    }
}

class Triangle: Shape {
    let height: Double
    let base: Double

    init(height: Double, base: Double, color: String) {
        self.height = height
        self.base = base
        super.init(color: color)
    }

    override func calculateArea() -> Double {
        return 0.5 * height * base

    }
}

//  •  Создайте массив объектов типа Shape и выведите площадь каждой фигуры.
let shapes: [Shape] = [
    Circle(radius: 15, color: "Yellow"),
    Rectangle(length: 8, width: 7, color: "Green"),
    Triangle(height: 9, base: 20, color: "Red")
]
//MARK: - 2. Создание структуры для представления контакта в телефонной книге:
//  •  Создайте структуру Contact со свойствами:
//    *  firstName (String)
//    *  lastName (String)
//    *  phoneNumber (String)
//    *  email (String?) (опциональный email).
//  •  Создайте функцию, которая принимает массив структур Contact и строку для поиска. Функция должна возвращать новый массив Contact, содержащий только те контакты, у которых имя или фамилия содержат строку для поиска (без учета регистра).


struct Contact {
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let email: String?
}

    func contactSearch(_ contacts: [Contact], search: String) -> [Contact] {
        return contacts.filter { contact in
            // Поиск без учета регистра
            let fullName = "\(contact.firstName) \(contact.lastName)"
            return fullName.contains(search)
    }
}

let contacts = [
    Contact(firstName: "Иван", lastName: "Иванов", phoneNumber: "89079006677", email: "ivan-durachok@mail.ru"),
    Contact(firstName: "Анна", lastName: "Попова", phoneNumber: "89079006877", email: "popova_a@gmail.com"),
    Contact(firstName: "Василий", lastName: "Петухов", phoneNumber: "89079786677", email: "vasilek_petyshok@yandex.ru"),
    Contact(firstName: "Роман", lastName: "Кружков", phoneNumber: "89079005566", email: "romashka99@mail.ru"),
    Contact(firstName: "Ирина", lastName: "Лопухова", phoneNumber: "89079006657", email: nil)
]

let searchResult = contactSearch(contacts, search: "Пе")
print(searchResult)
