import Foundation

func solution(_ dirs:String) -> Int {

    var hor = Array(repeating:Array(repeating:false,count:10),count:11)
    var ver = Array(repeating:Array(repeating:false,count:11),count:10)
    var cPoint = (0,0)
    var U = (0,1)
    var D = (0,-1)
    var L = (-1,0)
    var R = (1,0)
    var isPassed = true
    var count = 0
    var nPoint = (0,0)
    var isToggled = false
    for d in dirs{
        isToggled = false
        switch d{
        case "U": 
            nPoint = (cPoint.0+U.0,cPoint.1+U.1)
            if(-5...5 ~= nPoint.0 && -5...5 ~= nPoint.1 ){
                isPassed = ver[4-cPoint.1][5+cPoint.0]
                ver[4-cPoint.1][5+cPoint.0] = true
                cPoint = nPoint
                isToggled = true
            }
        case "D":
            nPoint = (cPoint.0+D.0,cPoint.1+D.1)
            if(-5...5 ~= nPoint.0 && -5...5 ~= nPoint.1){
                isPassed = ver[5-cPoint.1][5+cPoint.0]
                ver[5-cPoint.1][5+cPoint.0] = true
                cPoint = nPoint
                isToggled = true
            }
            
            
        case "L":
            nPoint = (cPoint.0+L.0,cPoint.1+L.1)
            if(-5...5 ~= nPoint.0 && -5...5 ~= nPoint.1){
                isPassed = hor[5-cPoint.1][cPoint.0+4]
                hor[5-cPoint.1][cPoint.0+4] = true
                cPoint = nPoint
                isToggled = true
            }
        case "R":
            nPoint = (cPoint.0+R.0,cPoint.1+R.1)
            if(-5...5 ~= nPoint.0 && -5...5 ~= nPoint.1){
                isPassed = hor[5-cPoint.1][cPoint.0+5]
                hor[5-cPoint.1][cPoint.0+5] = true
                cPoint = nPoint
                isToggled = true
            }
        default:
            break
        }
        if isPassed == false && isToggled == true{count += 1}
    }
    return count
}

//up
            //       (2,4)
            //             (-1,2)
            //       (3,4)
            //             (-1,1)
            //                   (4,4)
            //             (-1,0)

//             (0,0)(1,0)(2,0)(3,0)
//                (6,6)(6,7)(6,8)