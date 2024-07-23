// 1. square should be initialized as var
// 2. closing bracket was not present

def calcSumOfSquares(n: List[Int]): Int = {
  var sum = 0
  for (num <- n) {
    var square = num * num
    sum += square
  }
  sum
}