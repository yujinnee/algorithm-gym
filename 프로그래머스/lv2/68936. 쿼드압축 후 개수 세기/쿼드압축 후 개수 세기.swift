import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    var arr = arr
    var zeroCount = 0
    var oneCount = 0

    let start = (row:0,col:0)
    let finish = (row:arr.count-1,col:arr[0].count-1)
    zip(start,finish, &arr,&zeroCount,&oneCount)
    return [zeroCount,oneCount]
}

func zip(_ start: (row:Int,col:Int),_ finish: (row:Int,col:Int), _ arr: inout [[Int]],_ zeroCount: inout Int,_ oneCount: inout Int){
    var size = (finish.row-start.row)+1
   if(start.row==finish.row&&start.col==finish.col){
        if(arr[start.row][start.col]==0){
            zeroCount += 1
        }else{
            oneCount += 1
        }
       return
   }else{
       var set = Set<Int>()
       var zeroNum = 0
       var oneNum = 0

       for i in start.row...finish.row{
           for j in start.col...finish.col{
              
               set.insert(arr[i][j])
           }
       }
       if (set.count == 1){
           if(set.contains(1)){
               oneCount += 1
           }else{
               zeroCount+=1
           }
       }else{
           var startRow = start.row
           var startCol = start.col
           var halfRow = (start.row+finish.row)/2
           var halfCol = (start.col+finish.col)/2
           var finishRow = finish.row
           var finishCol = finish.col
           var newSize = size/2
           zip((startRow,startCol),(startRow+newSize-1,startCol+newSize-1),&arr,&zeroCount,&oneCount)
           zip((startRow,startCol+newSize),(startRow+newSize-1,finishCol),&arr,&zeroCount,&oneCount)
           zip((startRow+newSize,startCol),(finishRow,startCol+newSize-1),&arr,&zeroCount,&oneCount)
           zip((startRow+newSize,startCol+newSize),(finishRow,finishCol),&arr,&zeroCount,&oneCount)
       }
   }
}
