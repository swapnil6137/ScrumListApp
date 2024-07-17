//
//  BinarySearch.swift
//  ScrumListApp
//
//  Created by Swapnil Shinde on 15/07/24.
//

import Foundation
//Logarithm Time: O(log n)
func binarySearch(_ array : [Int], _ target : Int) -> Int{
    
    var firstIndex = 0
    var lastIndex = array.count - 1
    
    while(firstIndex <= lastIndex){
        
        let middleIndex =  Int(floor(Double((firstIndex + lastIndex)/2)))
        
        if array[middleIndex] == target{
            return middleIndex
        }
        
        if array[middleIndex] > target{
            lastIndex = middleIndex - 1
        }else{
            firstIndex = middleIndex + 1
        }
        
    }
    
    return -1
    
}


/*
 Time Complexity: O(n2)
Space Complexity: O(1)
 */
func sortAcending(_ input : [Int]) -> [Int]{
    
    var input = input
    
    for i in 0..<input.count{
       for j in i..<input.count{
            if input[i] > input[j]{
                let temp = input[j]
                input[j] = input[i]
                input[i] = temp
            }
        }
    }
    
    return input
    
}

func sortDecending(_ input : [Int]) -> [Int]{
    
    var input = input
    
    for i in 0..<input.count{
       for j in i..<input.count{
            if input[i] < input[j]{
                let temp = input[j]
                input[j] = input[i]
                input[i] = temp
            }
        }
    }
    
    return input
    
}


func getFibonnaci(_ n : Int) -> Int{
    guard n > 1 else {
        return 1
    }
    
    return n * getFibonnaci(n-1)
    
}


let input = [2,1,1,1,1,5,5]
let output = [2,5,5,1,1,1,1]

func sortElementsByOccurences(_ input : [Int]) -> [Int]{
    
    var frequencyDict = [Int: Int]()
       
       // Calculate the frequency of each element
       for num in input {
           frequencyDict[num, default: 0] += 1
       }
    
    return []
}

extension String{
    subscript(at index : Int) -> Character? {
        return self[self.index(startIndex, offsetBy: index)]
    }
}
