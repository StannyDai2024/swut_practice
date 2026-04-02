# ArkTS 基础语法教程

> 面向大三软件工程学生的 HarmonyOS 开发入门指南

---

## 目录

1. [条件语句](#1-条件语句)
2. [循环语句](#2-循环语句)
3. [函数定义](#3-函数定义)
4. [常用的内置函数](#4-常用的内置函数)
5. [变量作用域](#5-变量作用域)
6. [函数闭包](#6-函数闭包)

---

## 1. 条件语句

条件语句用于根据不同条件执行不同的代码逻辑。

### 1.1 if / else 语句

**基本语法：**

```typescript
if (条件) {
  // 条件为 true 时执行
} else {
  // 条件为 false 时执行
}
```

**示例：**

```typescript
let score: number = 85;

if (score >= 90) {
  console.log("优秀");
} else if (score >= 60) {
  console.log("及格");
} else {
  console.log("不及格");
}
```

---

### 1.2 switch / case 语句

适用于多条件分支判断：

```typescript
let grade: string = "A";

switch (grade) {
  case "A":
    console.log("90-100分");
    break;
  case "B":
    console.log("80-89分");
    break;
  case "C":
    console.log("70-79分");
    break;
  default:
    console.log("其他等级");
}
```

> ⚠️ **注意**：每个 case 后面要加 `break`，否则会继续执行下一个 case。

---

## 2. 循环语句

循环语句用于重复执行某段代码。

### 2.1 for 循环

```typescript
// 传统 for 循环
for (let i: number = 0; i < 5; i++) {
  console.log(`第 ${i + 1} 次循环`);
}

// for...of 循环（遍历数组）
let fruits: string[] = ["苹果", "香蕉", "橙子"];
for (let fruit of fruits) {
  console.log(fruit);
}
```

---

### 2.2 while 循环

```typescript
let count: number = 0;

while (count < 3) {
  console.log(`count = ${count}`);
  count++;
}
```

---

### 2.3 do...while 循环

**特点**：先执行一次，再判断条件。

```typescript
let num: number = 0;

do {
  console.log(`num = ${num}`);
  num++;
} while (num < 3);
```

---

### 2.4 continue 和 break

**continue**：跳过本次循环，继续下一次

```typescript
for (let i: number = 0; i < 5; i++) {
  if (i === 2) {
    continue; // 跳过 i === 2 的这次循环
  }
  console.log(`i = ${i}`);
}
// 输出: 0, 1, 3, 4
```

**break**：跳出整个循环

```typescript
for (let i: number = 0; i < 5; i++) {
  if (i === 3) {
    break; // 遇到 i === 3 时结束整个循环
  }
  console.log(`i = ${i}`);
}
// 输出: 0, 1, 2
```

---

## 3. 函数定义

### 3.1 function 声明方式

```typescript
// 基本语法
function 函数名(参数: 参数类型): 返回类型 {
  // 函数体
  return 结果;
}

// 示例
function add(a: number, b: number): number {
  return a + b;
}

console.log(add(3, 5)); // 输出: 8
```

---

### 3.2 箭头函数

箭头函数是函数的简写形式：

```typescript
// 完整写法
let add = (a: number, b: number): number => {
  return a + b;
};

// 简写（单行返回）
let add = (a: number, b: number): number => a + b;

// 无返回值
let sayHello = (name: string): void => {
  console.log(`你好, ${name}`);
};

// 无参数
let getRandom = (): number => Math.random();
```

---

## 4. 常用的内置函数

### 4.1 parseInt - 字符串转整数

```typescript
let str: string = "42";
let num: number = parseInt(str);
console.log(num); // 42

// 指定进制
let hex: number = parseInt("FF", 16); // 255
```

---

### 4.2 parseFloat - 字符串转小数

```typescript
let str: string = "3.14";
let num: number = parseFloat(str);
console.log(num); // 3.14
```

---

### 4.3 setTimeout - 延迟执行

**用法**：延迟一定毫秒后执行一次。

```typescript
// 2秒后打印
setTimeout(() => {
  console.log("2秒后执行");
}, 2000);

// 保存返回的定时器ID，可用于取消
let timerId: number = setTimeout(() => {
  console.log("延迟任务");
}, 1000);
```

---

### 4.4 clearTimeout - 取消延迟执行

```typescript
let timerId: number = setTimeout(() => {
  console.log("这个不会执行");
}, 5000);

// 取消定时器
clearTimeout(timerId);
```

---

### 4.5 setInterval - 定时重复执行

**用法**：每隔一定毫秒重复执行。

```typescript
// 每秒打印一次
let count: number = 0;
let intervalId: number = setInterval(() => {
  count++;
  console.log(`计数: ${count}`);
  if (count >= 5) {
    clearInterval(intervalId); // 5次后停止
  }
}, 1000);
```

---

### 4.6 clearInterval - 取消定时执行

```typescript
let intervalId: number = setInterval(() => {
  console.log("每秒执行");
}, 1000);

// 5秒后停止
setTimeout(() => {
  clearInterval(intervalId);
  console.log("停止");
}, 5000);
```

---

## 5. 变量作用域

作用域决定了变量的可见性和生命周期。

### 5.1 变量必须先声明才能使用

```typescript
// 正确：先声明后使用
let name: string = "张三";
console.log(name);

// 错误：未声明就使用（编译报错）
// console.log(age); // Error: Cannot find name 'age'
// let age: number = 20;
```

---

### 5.2 块级作用域 (let / const)

用 `let` 或 `const` 声明的变量只在其所在的花括号 `{}` 内有效：

```typescript
if (true) {
  let blockVar: string = "块内变量";
  console.log(blockVar); // 正常访问
}
// console.log(blockVar); // Error: 超出作用域，无法访问
```

---

### 5.3 函数作用域

在函数内部声明的变量，只在函数内部可见：

```typescript
function greet() {
  let greeting: string = "你好";
  console.log(greeting); // 正常访问
}

greet();
// console.log(greeting); // Error: 超出函数作用域
```

---

## 6. 函数闭包

闭包是指一个函数能够访问并操作其外部函数作用域中的变量。

### 6.1 什么是闭包

当内部函数引用了外部函数的变量，即使外部函数已经执行完毕，这些变量依然会被保留。

```typescript
function createCounter() {
  let count: number = 0; // 外部函数的变量

  return function(): number { // 返回内部函数（闭包）
    count++;
    return count;
  };
}

let counter = createCounter();
console.log(counter()); // 1
console.log(counter()); // 2
console.log(counter()); // 3
// count 变量被保留，不会被垃圾回收
```

---

### 6.2 闭包的实际应用

**用途1：创建私有变量**

```typescript
function createUser(name: string) {
  let _name: string = name; // 私有变量，外部无法直接访问

  return {
    getName: (): string => _name,
    setName: (newName: string): void => { _name = newName; }
  };
}

let user = createUser("张三");
console.log(user.getName()); // "张三"
user.setName("李四");
console.log(user.getName()); // "李四"
```

**用途2：函数工厂**

```typescript
function multiply(factor: number): (num: number) => number {
  return (num: number): number => num * factor;
}

let double = multiply(2);
let triple = multiply(3);

console.log(double(5));  // 10
console.log(triple(5));  // 15
```

---

### 6.3 注意事项

- 闭包会持有外部变量的引用，可能导致内存占用增加
- 避免在循环中创建闭包，可能会出现意外行为
- 如果必须要在循环中使用闭包，可以使用 `let` 声明循环变量来解决

---

## 总结

本教程涵盖了 ArkTS 基础语法的核心知识点：

1. **条件语句**：`if/else` 和 `switch/case` 用于分支逻辑
2. **循环语句**：`for`、`while`、`do...while` 以及 `continue/break` 控制循环流程
3. **函数定义**：传统 `function` 和箭头函数两种写法
4. **内置函数**：`parseInt`、`parseFloat`、`setTimeout`、`setInterval` 等
5. **变量作用域**：块级作用域和函数作用域的区别
6. **函数闭包**：理解闭包的概念和实际应用

---

> 💡 **建议**：同学们动手敲一遍每个示例，加深理解。
