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
        addGradesOfStudent()

    case "4":
        deleteGradesOfStudent()
        
    case "5":
        checkGradesOfStudent()
        
    default:
        print(systemMessage.needReEnter)
    }
}
