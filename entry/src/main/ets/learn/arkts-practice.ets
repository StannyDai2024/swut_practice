// 循环输出1-100
for (let i = 0; i < 100; i++) {
  console.log('',i)
}

let n = 0;
while (n <= 100) {
  if (n % 2 === 0) {
    break;
  }
  console.log("", n)
  n++;
}

do {
  console.log(`${n}`);
  n++;
} while (n < 100)

// 数组定义

let fruits: string[] = ['apple', 'banana', 'watermelon']
fruits[3] = 'strawberry';
fruits[10] = 'cherry';
console.log('', fruits.length, fruits[8], fruits[7])



let fruits11: Array<string | number> = ['apple', 'banana', 'watermelon', 222]

let scorces: Array<number>  = [1,2,4,55]

enum Colors {
  Red = 'red',
  Yellow = 'yellow',
  Blue = 'blue',
}

Colors.Red

function add (a: number, b: number): number {
  return a + b;
}

let add2 = (a: number, b: number): number => {
  return a + b
}

// const num: number = parseInt(str)

