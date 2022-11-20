//
//  main.swift
//  MyCreditManager
//
//  Created by 지준용 on 2022/11/18.
//

import Foundation

var dictionary: [String: [String: String]] = [:]

while true {
    print(systemMessage.wantToFunc)
    let selectedFunc = readLine()!

    if selectedFunc == "X" {
        print(systemMessage.endingProgram)
        break
    }
    
    switch selectedFunc {
    case "1":
        addStuduent()
        
    case "2":
        deleteStudent()
        
    case "3":
        addStudentInfo()

    case "4":
        deleteStudentInfo()
        
    case "5":
        checkGradeOfStudent()
        
    default:
        print(systemMessage.needReEnter)
    }
}
