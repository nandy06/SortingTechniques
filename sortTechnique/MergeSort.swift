//
//  MergeSort.swift
//  sortTechnique
//
//  Created by nandini on 2/15/18.
//  Copyright © 2018 nandini. All rights reserved.
//

import Foundation

// Divide and Conquer algorithm.
class MergeSort {
    
    var arrayToSort  : [Int]
    init(arrayToSort : [Int]) {
        self.arrayToSort = arrayToSort
    }
    func mergeSort(low : Int , high : Int ){
        if low < high
        {
            // recursive divide the array
            let mid = (low + high) / 2
            mergeSort(low: low, high: mid)
            mergeSort(low: mid + 1 , high: high)
            merge(from: low, to: high , mid:  mid)
        }
      
    }
    
    func merge(from : Int , to : Int ,  mid: Int){
        var firstHalf =  Array.init(repeating: 0, count: (mid - from) + 1 )
        var secondHalf = Array.init(repeating: 0, count: (to - mid))
       // get data for first half
        for i in 0..<firstHalf.count{
          firstHalf[i] = arrayToSort[i]
        }
        //get data for second half
        let offset = mid + 1
        for i in 0..<secondHalf.count{
            secondHalf[i] = arrayToSort[i + offset ]
        }
        //sort first half
        var i = 0 , j = 0 , k = from
        while (i < firstHalf.count && j < secondHalf.count){
            if firstHalf[i] > secondHalf [j]{
                arrayToSort[k] = secondHalf[j]
                j += 1
            }
            else {
                arrayToSort[k] = firstHalf[i]
                i += 1
            }
            k += 1
        }
        
        // when first and second halfs are not equal add the remaining elements
        
        while ( i < firstHalf.count){
            arrayToSort[k ] = firstHalf [i ]
            k += 1
            i += 1
        }
        while (j < secondHalf.count) {
            arrayToSort[k ] = secondHalf [j ]
            k += 1
            j += 1
        }
    }
}
