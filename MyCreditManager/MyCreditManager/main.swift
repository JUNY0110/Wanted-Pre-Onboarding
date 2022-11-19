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
    static let fourthQuestion = ""
    static let fifthQuestion = ""
    static let error = "입력이 잘못되었습니다. 다시 확인해주세요."
}

var inputArray: [String] = []
var gradeArray: [String] = []

while true {
    print(Require.mainQuestion)
    let numInput = readLine()!

    switch numInput {
    case "1":
        print(Require.firstQuestion)
        let student = readLine()!
        
        if student.isEmpty {
            print(Require.error)
        }
        !inputArray.contains(student) ? inputArray.append(student) : print("\(student)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        
    case "2":
        print(Require.secondQuestion)
        let student = readLine()!
        
        if student.isEmpty {
            print(Require.error)
        } else if inputArray.contains(student) {
            inputArray.remove(at: inputArray.firstIndex(of: student)!)
            print("\(student) 학생을 삭제하였습니다.")
        } else {
            print("\(student) 학생을 찾지 못했습니다.")
        }
        
    case "3":
        print(Require.thirdQuestion)
        let input = readLine()!
//        var gradeArray = input.split(separator: " ").map { String ($0) }
        
        if input.count == 0 || gradeArray.count != 3 {
            print(Require.error)
        } else if inputArray.contains(gradeArray[0]) {
            gradeArray.insert(gradeArray[2], at: 2)
            gradeArray.remove(at: 3)
            print("\(gradeArray[0]) 학생의 \(gradeArray[1]) 과목이 \(gradeArray[2])로 추가(변경)되었습니다.")
            print(gradeArray)
        }
        
    case "4":
        print("삭제할 학생의 이름을 알려주세요.")
    case "5":
        print("삭제할 학생의 이름을 알려주세요.")
    case "X":
        print("삭제할 학생의 이름을 알려주세요.")
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}
