import UIKit


// MARK: - 1.  Хранить информацию о студентах: Для каждого студента необходимо хранить следующую информацию:
//    *   Имя (String)
//    *   Возраст (Int)
//    *   Оценки по предметам (Dictionary, где ключ - название предмета (String), значение - оценка (Int))
//    *   Набор (Set) посещенных факультативов (String)
//
//    Используйте кортеж для представления данных об одном студенте: (name: String, age: Int, grades: [String: Double], optionalSubjects: Set<String>)
//


typealias Student = (name: String, age: Int, grades: [String: Int], optionalSubjects: Set<String>)




// MARK: - 2.  Создать массив студентов: Создайте массив, содержащий данные о нескольких студентах (минимум 5).

let students: [Student] = [
    ("Олег Пупков", 20, ["Математика": 4, "Физика": 4, "Химия": 5], ["Биология", "География"]),
    ("Роман Босяков", 21, ["Математика": 4, "Физика": 5], ["История", "География"]),
    ("Елена Поклонская", 19, ["Математика": 3, "Химия": 3], ["Биология", "История"]),
    ("Глафира Великолепная", 22, ["Физика": 5, "Химия": 5], ["География"]),
    ("Вадим Кульков", 21, ["Математика": 5, "Физика": 4, "Химия": 3], ["Биология", "История", "География", "Спортивное ориентирование"])
]
//
// MARK: - 3.  Реализовать функции для обработки данных:
//    *   calculateAverageGrade(student: Student) -> Double?: Функция должна принимать кортеж студента и возвращать его средний балл по всем предметам. Если у студента нет оценок, функция должна вернуть nil.
//
//    *   findStudentsByAge(students: [Student], age: Int) -> [Student]: Функция должна принимать массив студентов и возраст, и возвращать новый массив, содержащий только студентов указанного возраста. Используйте функцию высшего порядка filter.
//
//    *   getTopStudents(students: [Student], top: Int) -> [(name: String, averageGrade: Double)]: Функция должна принимать массив студентов и количество "top", и возвращать массив кортежей (name: String, averageGrade: Double), содержащий информацию о "top" лучших студентах по среднему баллу.  Используйте функции высшего порядка map, filter, sorted и prefix. Если для каких-то студентов не удалось вычислить средний балл (отсутствуют оценки) - их учитывать не нужно.
//
//    *   getUniqueOptionalSubjects(students: [Student]) -> Set<String>:  Функция должна принимать массив студентов и возвращать множество, содержащее все уникальные названия факультативов, которые посещают студенты из массива. Используйте функцию высшего порядка reduce или flatMap.

func calculateAverageGrade(student: Student) -> Double? {
    let grades = student.grades.values
    if !grades.isEmpty {
        return Double(grades.reduce(0, +)) / Double(grades.count)
    }
       return nil
}

func findStudentsByAge(students: [Student], age: Int) -> [Student] {
    return students.filter { $0.age == age }
}

func getTopStudents(students: [Student], top: Int) -> [(name: String, averageGrade: Double)] {
    let studentsGrades = students
        .compactMap { student -> (name: String, averageGrade: Double)? in
            guard let averageGrade = calculateAverageGrade(student: student) else { return nil }
            return (student.name, averageGrade)
        }
        return studentsGrades
        .sorted { $0.averageGrade > $1.averageGrade }
        .prefix(top).map { $0 }
}

func getUniqueOptionalSubjects(students: [Student]) -> Set<String> {
    return students.reduce(into: Set<String>()) { result, student in
            result.formUnion(student.optionalSubjects)
        }
}
//Бонус:
//•  Реализуйте функцию, которая будет находить студента с самым большим количеством посещаемых факультативов.
func findStudentWithMostOptionalSubjects(students: [Student]) -> Student? {
    return students.max { $0.optionalSubjects.count < $1.optionalSubjects.count }
}

// MARK: - 4.  Вывести результаты: Выведите на консоль:

// Вывод информации о всех студентах
students.forEach { student in
    let averageGrade = calculateAverageGrade(student: student) ?? 0.0
    print("Имя: \(student.name), Возраст: \(student.age), Средний балл: \(averageGrade), Факультативы: \(student.optionalSubjects)")
}

// Вывод списка студентов определенного возраста
let age = 21
print("\nСтуденты возраста \(age):")
findStudentsByAge(students: students, age: age).forEach { print($0.name) }

// Вывод списка топ-3 лучших студентов
print("\nТоп-3 студента:")
getTopStudents(students: students, top: 3).forEach { print("\($0.name): \($0.averageGrade)") }

// Вывод списка всех уникальных факультативов
print("\nУникальные факультативы:")
getUniqueOptionalSubjects(students: students).forEach { print($0) }

// Бонус: Вывод студента с наибольшим количеством факультативов
if let student = findStudentWithMostOptionalSubjects(students: students) {
    print("\nСтудент с наибольшим количеством факультативов: \(student.name) с \(student.optionalSubjects.count) факультативами")
}
