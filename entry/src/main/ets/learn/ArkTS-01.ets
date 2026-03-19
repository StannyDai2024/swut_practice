/**
 * ArkTS 基础语法 —— 课堂教学代码
 *
 * 📌 使用方式：
 *   1. 页面中 import { runLesson01 } from '../learn/ArkTS-01'
 *   2. 在 aboutToAppear() 中调用 runLesson01()
 *   3. 打开 HiLog 控制台，搜索 "ArkTS-01" 查看输出
 *
 * 📌 目录：
 * 1. 变量声明（let）
 * 2. 常量声明（const）
 * 3. 数据类型
 *    a. 简单数据类型：string / number / bigint / NaN / undefined / null / boolean
 *    b. 引用数据类型：object / array / function
 *    c. 特殊数据类型：enum / void / never / any(禁用) / unknown(禁用)
 *    d. 类型判断：typeof / instanceof
 * 4. 运算符
 *    a. 算术运算符（取模 / 幂运算 / 自增自减）
 *    b. 字符串运算符
 *    c. 赋值运算符
 *    d. 比较运算符
 *    e. 逻辑运算符
 *    f. 三元运算符
 *    g. 运算符优先级
 */

// ========== 需要在函数外部声明的类型 ==========

interface StudentInfo {
  name: string;
  age: number;
  score: number;
  house?: string; // 可选属性
}

enum Season {
  Spring,    // 默认值 0
  Summer,    // 1
  Autumn,    // 2
  Winter,   // 3
}

enum HttpMethod {
  GET = 'GET',
  POST = 'POST',
  PUT = 'PUT',
  DELETE = 'DELETE'
}

class Animal {
  name: string = '';
}

class Dog extends Animal {}

function addNumbers(a: number, b: number): number {
  return a + b;
}

function sayHello(name: string): void {
  console.log(`[ArkTS-01] 你好，${name}！`);
}

const TAG = '[ArkTS-01]';

// ========== 教学主函数 ==========

export function runLesson01(): void {

  // ============================================================
  // 1. 变量声明（let）
  // ============================================================
  // let 声明的变量可以重新赋值

  let studentName: string = '张三';
  let age: number = 20;
  let isStudent: boolean = true;
  let str: string | number = 'string'
  str = 100;


  console.log(`${TAG} --- 1. 变量声明（let） ---`);
  console.log(`${TAG} studentName = ${studentName}`);  // 张三
  console.log(`${TAG} age = ${age}`);                  // 20
  console.log(`${TAG} isStudent = ${isStudent}`);      // true

  // 重新赋值
  studentName = '李四';
  age = 21;
  console.log(`${TAG} 修改后 studentName = ${studentName}`);  // 李四
  console.log(`${TAG} 修改后 age = ${age}`);                  // 21


  // ============================================================
  // 2. 常量声明（const）
  // ============================================================
  // const 声明后不能重新赋值

  const PI: number = 3.14159;
  const APP_NAME: string = '我的应用';
  const MAX_COUNT = 100;


  console.log(`${TAG} --- 2. 常量声明（const） ---`);
  console.log(`${TAG} PI = ${PI}`);
  console.log(`${TAG} APP_NAME = ${APP_NAME}`);
  console.log(`${TAG} MAX_COUNT = ${MAX_COUNT}`);
  // ❌ PI = 3.0  // 取消注释会编译报错：Cannot assign to 'PI'


  // ============================================================
  // 3. ArkTS 中的数据类型
  // ============================================================

  // ---------- 3a. 简单数据类型 ----------

  console.log(`${TAG} --- 3a. 简单数据类型 ---`);

  // ① string 字符串
  let str1: string = '单引号字符串';
  let str2: string = "双引号字符串";
  let str3: string = `模板字符串，1 + 1 = ${1 + 1}`;  // 反引号，可嵌入 ${表达式}
  console.log(`${TAG} str1 = ${str1}`);
  console.log(`${TAG} str2 = ${str2}`);
  console.log(`${TAG} str3 = ${str3}`);

  // ② number 数字（整数和小数都是 number）
  let integer: number = 42;
  let float: number = 3.14;
  let negative: number = -10;
  let hex: number = 0xFF;  // 十六进制，值为 255
  console.log(`${TAG} integer=${integer}, float=${float}, negative=${negative}, hex=${hex}`);

  // ③ bigint 大整数（超大数字，后面加 n）
  // let big: bigint = 9007199254740991n
  // 注意：bigint 和 number 不能直接混合运算

  // ④ NaN（Not a Number）
  let nanResult: number = Number('abc');  // 非数字字符串转 number → NaN
  console.log(`${TAG} Number('abc') = ${nanResult}`);           // NaN
  console.log(`${TAG} Number.isNaN(nanResult) = ${Number.isNaN(nanResult)}`);  // true
  // ⚠️ NaN !== NaN，不能用 === 判断，必须用 Number.isNaN()

  // ⑤ undefined —— 声明了变量但没有赋值
  let notAssigned: string | undefined = undefined;
  console.log(`${TAG} notAssigned = ${notAssigned}`);  // undefined

  // ⑥ null —— 主动设置为"空"
  let empty: string | null = null;
  console.log(`${TAG} empty = ${empty}`);  // null
  // undefined = "忘了给值"，null = "我故意设为空的"

  // ⑦ boolean 布尔值（只有 true 和 false）
  let isOpen: boolean = true;
  let isFinished: boolean = false;
  console.log(`${TAG} isOpen=${isOpen}, isFinished=${isFinished}`);


  // ---------- 3b. 引用数据类型 ----------

  console.log(`${TAG} --- 3b. 引用数据类型 ---`);

  // ① object 对象（ArkTS 推荐用 interface 定义结构）
  let stu: StudentInfo = { name: '张三', age: 20, score: 95 };
  console.log(`${TAG} 学生：${stu.name}，年龄：${stu.age}，成绩：${stu.score}`);
  stu.score = 100;
  console.log(`${TAG} 修改成绩后：${stu.score}`);

  // ② array 数组
  let nums: number[] = [1, 2, 3, 4, 5];
  // let nums: Array<number> = [1]
  let names: Array<string> = ['张三', '李四', '王五'];
  console.log(`${TAG} nums = [${nums}]`);
  console.log(`${TAG} nums[0] = ${nums[0]}`);         // 下标从 0 开始
  console.log(`${TAG} nums.length = ${nums.length}`);  // 数组长度
  nums.push(6);
  console.log(`${TAG} push(6) 后：[${nums}]`);
  let last = nums.pop();
  console.log(`${TAG} pop() 后：[${nums}]，删除的是 ${last}`);

  // ③ function 函数
  // 箭头函数

  let multiply = (x: number, y: number): number => x * y;
  let square = (n: number): number => n * n;
  console.log(`${TAG} addNumbers(3,5) = ${addNumbers(3, 5)}`);
  console.log(`${TAG} multiply(4,6) = ${multiply(4, 6)}`);
  console.log(`${TAG} square(9) = ${square(9)}`);


  // ---------- 3c. 特殊数据类型 ----------

  console.log(`${TAG} --- 3c. 特殊数据类型 ---`);

  // ① enum 枚举
  let currentSeason: Season = Season.Summer;
  let method: HttpMethod = HttpMethod.POST;
  console.log(`${TAG} Season.Summer = ${currentSeason}`);  // 1
  console.log(`${TAG} HttpMethod.POST = ${method}`);        // "POST"

  // ② void —— 函数没有返回值
  sayHello('同学们');

  // ③ never —— 函数永远不会正常返回（抛异常 / 死循环）
  // throwError('出错了')  // ← 取消注释可演示

  // ④ any / ⑤ unknown —— ⚠️ ArkTS 中禁用！
  // any 跳过类型检查（不安全），unknown 使用前必须检查
  // ArkTS 要求明确类型声明


  // ---------- 3d. 如何判断数据类型？ ----------

  console.log(`${TAG} --- 3d. 类型判断 ---`);

  // ① typeof —— 判断简单数据类型，返回字符串
  console.log(`${TAG} typeof 42 = ${typeof 42}`);               // "number"
  console.log(`${TAG} typeof 'hello' = ${typeof 'hello'}`);      // "string"
  console.log(`${TAG} typeof true = ${typeof true}`);             // "boolean"
  console.log(`${TAG} typeof undefined = ${typeof undefined}`);   // "undefined"
  // typeof 的局限：typeof null → "object"（历史遗留 bug）

  // ② instanceof —— 判断引用类型
  let today = new Date();
  console.log(`${TAG} today instanceof Date = ${today instanceof Date}`);  // true
  let dog = new Dog();
  console.log(`${TAG} dog instanceof Dog = ${dog instanceof Dog}`);         // true
  console.log(`${TAG} dog instanceof Animal = ${dog instanceof Animal}`);   // true（继承）


  // ============================================================
  // 4. 运算符
  // ============================================================

  // ---------- 4a. 算术运算符 ----------

  console.log(`${TAG} --- 4a. 算术运算符 ---`);

  // 基本四则运算
  console.log(`${TAG} 10 + 3 = ${10 + 3}`);   // 13
  console.log(`${TAG} 10 - 3 = ${10 - 3}`);   // 7
  console.log(`${TAG} 10 * 3 = ${10 * 3}`);   // 30
  console.log(`${TAG} 10 / 3 = ${10 / 3}`);   // 3.3333...

  // ① 取模 %（求余数）
  console.log(`${TAG} 10 % 3 = ${10 % 3}`);   // 1（10÷3=3余1）
  console.log(`${TAG} 7 % 2 = ${7 % 2}`);     // 1（奇数）
  console.log(`${TAG} 8 % 2 = ${8 % 2}`);     // 0（偶数）
  // 💡 判断奇偶：n % 2 === 0 就是偶数

  // ② 幂运算 **
  console.log(`${TAG} 2 ** 3 = ${2 ** 3}`);   // 8（2的3次方）
  console.log(`${TAG} 3 ** 2 = ${3 ** 2}`);   // 9

  // ③ 自增 / 自减（重点区分前置和后置！）
  let a: number = 5;

  // 后置 a++：先用原值，再 +1
  let b: number = a++;
  console.log(`${TAG} 后置 a++：b=${b}, a=${a}`);  // b=5, a=6

  // 前置 ++a：先 +1，再用新值
  let c: number = ++a;
  console.log(`${TAG} 前置 ++a：c=${c}, a=${a}`);  // c=7, a=7

  // 自减同理
  let d: number = a--;   // 后置：d=7, a变6
  let e: number = --a;   // 前置：a先变5, e=5
  console.log(`${TAG} 后置 a--：d=${d}`);
  console.log(`${TAG} 前置 --a：e=${e}, a=${a}`);


  // ---------- 4b. 字符串运算符 ----------

  console.log(`${TAG} --- 4b. 字符串运算符 ---`);

  // ① 字符串 + 字符串 = 拼接
  let greeting: string = 'Hello' + ' ' + 'World';
  console.log(`${TAG} 'Hello' + ' World' = ${greeting}`);

  // ② 字符串 + 数字 = 拼接（数字自动转字符串）
  let result1: string = '22' + 1;    // ⚠️ "221"，不是 23！
  let result2: string = 'age: ' + 20;
  console.log(`${TAG} '22' + 1 = ${result1}`);      // "221"
  console.log(`${TAG} 'age: ' + 20 = ${result2}`);  // "age: 20"

  // ③ 字符串转数字的正确方式
  let numFromStr: number = Number('22');
  let parsed: number = parseInt('22');
  console.log(`${TAG} Number('22') = ${numFromStr}`);   // 22
  console.log(`${TAG} parseInt('22') = ${parsed}`);     // 22


  // ---------- 4c. 赋值运算符 ----------

  console.log(`${TAG} --- 4c. 赋值运算符 ---`);

  let x: number = 10;
  console.log(`${TAG} 初始 x = ${x}`);

  x += 5;    // x = x + 5
  console.log(`${TAG} x += 5 → ${x}`);   // 15
  x -= 3;    // x = x - 3
  console.log(`${TAG} x -= 3 → ${x}`);   // 12
  x *= 2;    // x = x * 2
  console.log(`${TAG} x *= 2 → ${x}`);   // 24
  x /= 4;    // x = x / 4
  console.log(`${TAG} x /= 4 → ${x}`);   // 6
  x %= 4;    // x = x % 4
  console.log(`${TAG} x %= 4 → ${x}`);   // 2
  x **= 3;   // x = x ** 3
  console.log(`${TAG} x **= 3 → ${x}`);  // 8


  // ---------- 4d. 比较运算符 ----------

  console.log(`${TAG} --- 4d. 比较运算符 ---`);

  // 返回 boolean
  let n1: number = 5;
  let n2: number = 3;
  let n3: number = 5;

  console.log(`${TAG} 5 > 3  = ${n1 > n2}`);     // true
  console.log(`${TAG} 3 < 5  = ${n2 < n1}`);     // true
  console.log(`${TAG} 5 >= 5 = ${n1 >= n3}`);    // true
  console.log(`${TAG} 3 <= 5 = ${n2 <= n1}`);    // true
  console.log(`${TAG} 5 === 5 = ${n1 === n3}`);  // true（严格等于）
  console.log(`${TAG} 5 !== 3 = ${n1 !== n2}`);  // true（严格不等）
  // ⚠️ ArkTS 中只用 === 和 !==，不要用 == 和 !=


  // ---------- 4e. 逻辑运算符 ----------

  console.log(`${TAG} --- 4e. 逻辑运算符 ---`);

  // && 逻辑与：两边都 true 才 true
  console.log(`${TAG} true && true = ${true && true}`);     // true
  console.log(`${TAG} true && false = ${true && false}`);   // false

  // || 逻辑或：有一边 true 就 true
  console.log(`${TAG} false || true = ${false || true}`);   // true
  console.log(`${TAG} false || false = ${false || false}`); // false

  // ! 逻辑非：取反
  console.log(`${TAG} !true = ${!true}`);    // false
  console.log(`${TAG} !false = ${!false}`);  // true

  // 💡 实际应用
  let score: number = 85;
  let attendance: boolean = true;
  let canPass: boolean = score >= 60 && attendance;
  console.log(`${TAG} 成绩${score}，出勤${attendance}，能否通过：${canPass}`);


  // ---------- 4f. 三元运算符 ----------

  console.log(`${TAG} --- 4f. 三元运算符 ---`);

  // 语法：条件 ? 值1 : 值2
  let testScore: number = 85;
  let level: string = testScore >= 60 ? '及格' : '不及格';
  console.log(`${TAG} ${testScore}分 → ${level}`);  // 及格

  let testScore2: number = 40;
  let level2: string = testScore2 >= 60 ? '及格' : '不及格';
  console.log(`${TAG} ${testScore2}分 → ${level2}`);  // 不及格

  // 嵌套三元（不建议太多层）
  let grade: string = testScore >= 90 ? '优秀'
    : testScore >= 80 ? '良好'
      : testScore >= 60 ? '及格'
        : '不及格';
  console.log(`${TAG} ${testScore}分 → 等级：${grade}`);  // 良好


  // ---------- 4g. 运算符优先级 ----------

  console.log(`${TAG} --- 4g. 运算符优先级（从高到低） ---`);
  // 1.  ()        括号（最高）
  // 2.  ++ --     自增自减
  // 3.  !         逻辑非
  // 4.  **        幂运算
  // 5.  * / %     乘 除 取模
  // 6.  + -       加 减
  // 7.  > < >= <= 比较
  // 8.  === !==   相等判断
  // 9.  &&        逻辑与
  // 10. ||        逻辑或
  // 11. ?:        三元运算符
  // 12. = += -=   赋值（最低）

  console.log(`${TAG} 2 + 3 * 4 = ${2 + 3 * 4}`);       // 14（先乘后加）
  console.log(`${TAG} (2 + 3) * 4 = ${(2 + 3) * 4}`);   // 20（括号优先）

  let r1: boolean = true || (false && false);
  console.log(`${TAG} true || false && false = ${r1}`);  // true（&& 优先于 ||）

  let r2: boolean = (true || false) && false;
  console.log(`${TAG} (true || false) && false = ${r2}`);  // false

  // 💡 记不住优先级？多用括号 () 就对了！

  console.log(`${TAG} ===== 全部演示完毕 =====`);
}
