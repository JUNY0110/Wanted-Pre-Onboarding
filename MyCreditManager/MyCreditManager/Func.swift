//
//  Func.swift
//  MyCreditManager
//
//  Created by 지준용 on 2022/11/20.
//

import Foundation

func addStuduent() {
    print(systemMessage.addStudent)
    let student = readLine()!

    if student.isEmpty {
        print(systemMessage.needRecheck)
    } else if dictionary.keys.contains(student) {
        print("\(student)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
    } else {
        dictionary[student] = [:]
        print("\(student) 학생을 추가했습니다.")
    }
}

func deleteStudent() {
    print(systemMessage.deleteStudent)
    let student = readLine()!
    
    if student.isEmpty {
        print(systemMessage.needRecheck)
    } else if dictionary.keys.contains(student) {
        dictionary.removeValue(forKey: student)
        print("\(student) 학생을 삭제하였습니다.")
    } else {
        print("\(student) 학생을 찾지 못했습니다.")
    }
    
}

func addGradesOfStudent() {
    print(systemMessage.addGradesOfStudent)
    let GradesOfStudent = readLine()!
    let studentInfoArray = GradesOfStudent.split(separator: " ").map{ String($0) }
    
    if studentInfoArray.count != 3 {
        print(systemMessage.needRecheck)
    } else {
        dictionary[studentInfoArray[0]]?.updateValue(studentInfoArray[2], forKey: studentInfoArray[1])
        print("\(studentInfoArray[0]) 학생의 \(studentInfoArray[1]) 과목이 \(studentInfoArray[2])로 추가(변경)되었습니다.")
    }
}

func deleteGradesOfStudent() {
    print(systemMessage.deleteGradesOfStudent)
    let studentInfo = readLine()!
    let studentInfoArray = studentInfo.split(separator: " ").map{ String($0) }
    
    if studentInfoArray.count != 2 {
        print(systemMessage.needRecheck)
    } else if !dictionary.keys.contains(studentInfoArray[0]) {
        print("\(studentInfoArray[0]) 학생을 찾지 못했습니다.")
    } else {
        dictionary[studentInfoArray[0]]?.removeValue(forKey: studentInfoArray[1])
        print("\(studentInfoArray[0]) 학생의 \(studentInfoArray[1]) 과목의 성적이 삭제되었습니다.")
    }
}

func checkGradeOfStudent() {
    print(systemMessage.gradesOfStudent)
    let student = readLine()!
    var sum = 0.0
    
    if student.isEmpty {
        print(systemMessage.needRecheck)
    } else if !dictionary.keys.contains(student) {
        print("\(student) 학생을 찾지 못했습니다.")
    } else {
        dictionary[student]!.forEach { (subject, grade) in
            switch grade {
            case "A+":
                sum += 4.5
            case "A":
                sum += 4.0
            case "B+":
                sum += 3.5
            case "B":
                sum += 3.0
            case "C+":
                sum += 2.5
            case "C":
                sum += 2.0
            case "D+":
                sum += 1.5
            case "D":
                sum += 1.0
            case "F":
                sum += 0.0
            default:
                print(systemMessage.needRecheck)
            }
            print("\(subject): \(grade)")
        }
        print("평점: \(round(Float(sum) / Float(dictionary[student]!.count) * 100) / 100)")
    }
}
