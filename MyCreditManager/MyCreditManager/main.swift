//
//  main.swift
//  MyCreditManager
//
//  Created by 지준용 on 2022/11/18.
//

import Foundation

enum Require {
    static let mainQuestion = "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
    static let firstQuestion = "추가할 학생의 이름을 입력해주세요."
    static let secondQuestion = "삭제할 학생의 이름을 알려주세요."
    static let thirdQuestion = "성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요. \n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다."
    static let fourthQuestion = "성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift"
    static let fifthQuestion = "평점을 알고싶은 학생의 이름을 입력해주세요."
    static let error = "입력이 잘못되었습니다. 다시 확인해주세요."
}

var dictionary: [String: [String: String]] = [:]

while true {
    print(Require.mainQuestion)
    let numInput = readLine()!

    switch numInput {
    case "1":
        print(Require.firstQuestion)
        let student = readLine()!

        if student.isEmpty {
            print(Require.error)
        } else if dictionary.keys.contains(student) {
            print("\(student)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        } else {
            dictionary[student] = [:]
            print("\(student) 학생을 추가했습니다.")
        }
        
    case "2":
        print(Require.secondQuestion)
        let student = readLine()!
        
        if student.isEmpty {
            print(Require.error)
        } else if dictionary.keys.contains(student) {
            dictionary.removeValue(forKey: student)
            print("\(student) 학생을 삭제하였습니다.")
        } else {
            print("\(student) 학생을 찾지 못했습니다.")
        }
        
    case "3":
        print(Require.thirdQuestion)
        let input = readLine()!
        let gradeArray = input.split(separator: " ").map{ String($0) }
        
        if gradeArray.count != 3 {
            print(Require.error)
        } else {
            dictionary[gradeArray[0]]?.updateValue(gradeArray[2], forKey: gradeArray[1])
            print("\(gradeArray[0]) 학생의 \(gradeArray[1]) 과목이 \(gradeArray[2])로 추가(변경)되었습니다.")
        }
        
    case "4":
        print(Require.fourthQuestion)
        let input = readLine()!
        let inputArray = input.split(separator: " ").map{ String($0) }
        
        if inputArray.count != 2 {
            print(Require.error)
        } else if !dictionary.keys.contains(inputArray[0]) {
            print("\(inputArray[0]) 학생을 찾지 못했습니다.")
        } else {
            dictionary[inputArray[0]]?.removeValue(forKey: inputArray[1])
            print("\(inputArray[0]) 학생의 \(inputArray[1]) 과목의 성적이 삭제되었습니다.")
        }
        
    case "5":
        print(Require.fifthQuestion)
        let student = readLine()!
        var sum = 0.0
        
        if student.isEmpty {
            print(Require.error)
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
                    print(Require.error)
                }
                print("\(subject): \(grade)")
            }
            print("평점: \(round(Float(sum) / Float(dictionary[student]!.count) * 100) / 100)")
        }
        
    case "X":
        print("삭제할 학생의 이름을 알려주세요.")
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}
