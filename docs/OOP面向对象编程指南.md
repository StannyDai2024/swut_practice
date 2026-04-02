# ArkTS 面向对象编程入门

## 1. 什么是面向对象？

面向对象（OOP）是一种编程思想，核心是把事物抽象成"对象"，每个对象拥有自己的**属性**（数据）和**方法**（行为）。

**好处：**
- 代码组织清晰，容易理解
- 复用性强，方便维护
- 适合描述复杂业务逻辑

---

## 2. 创建对象的两种方式

### 2.1 直接创建对象

```typescript
let person = {
  name: "张三",
  age: 18,
  speak: () => {
    console.log("你好");
  }
};

console.log(person.name);  // 访问属性
person.speak();            // 调用方法
```

### 2.2 通过类创建对象

```typescript
class Person {
  name: string;
  age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  speak() {
    console.log("你好");
  }
}

let person = new Person("张三", 18);
person.speak();
```

> **推荐**：使用类的方式，更规范、易维护。

---

## 3. 实例成员

实例成员是对象实例独有的属性和方法，通过 `this` 访问。

```typescript
class Person {
  name: string;      // 实例属性
  age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  greet() {          // 实例方法
    console.log(`我是${this.name}`);
  }
}

let p1 = new Person("张三", 18);
let p2 = new Person("李四", 20);

p1.greet();  // 我是张三
p2.greet();  // 我是李四
```

---

## 4. 静态成员

静态成员属于类本身，而不是某个对象。用 `static` 关键字声明。

```typescript
class MathUtil {
  static PI = 3.14159;

  static add(a: number, b: number) {
    return a + b;
  }
}

console.log(MathUtil.PI);     // 3.14159
console.log(MathUtil.add(1, 2)); // 3

// 静态成员无需创建对象即可访问
```

**使用场景**：工具类（如 `MathUtil`）、配置常量、计数器等。

---

## 5. 引用传递

对象是引用类型，赋值给变量时传递的是内存地址。

```typescript
let obj1 = { name: "张三" };
let obj2 = obj1;      // obj2 指向同一个对象

obj2.name = "李四";

console.log(obj1.name); // 李四（obj1 也被改了）
```

> **注意**：修改 `obj2` 会影响 `obj1`，因为它们指向同一块内存。

---

## 6. 构造方法 constructor

constructor 是类初始化时自动调用的特殊方法。

```typescript
class Dog {
  name: string;

  constructor(name: string) {
    console.log("狗狗创建了");
    this.name = name;
  }
}

let dog = new Dog("旺财");  // 输出: 狗狗创建了
```

---

## 7. 类的继承

继承让子类复用父类的属性和方法。

```typescript
class Animal {
  name: string;

  constructor(name: string) {
    this.name = name;
  }

  eat() {
    console.log(`${this.name}在吃饭`);
  }
}

class Cat extends Animal {
  gender: boolean;
  constructor(name: string, gender: boolean) {
    super(name);  // 子类调用父类构造器
    this.gender = gender;
  }

  meow() {
    console.log(`${this.name}在喵喵叫`);
  }
}

let cat = new Cat("咪咪");
cat.eat();   // 继承自 Animal
cat.meow();  // 自己的方法
```

---

## 8. 访问修饰符

| 修饰符 | 含义 | 访问范围 |
|--------|------|----------|
| `public` | 公开 | 任意位置（默认） |
| `private` | 私有 | 仅本类内部 |
| `protected` | 受保护 | 本类 + 子类 |

```typescript
class Person {
  public name: string;     // 公开
  private age: number;     // 私有，外部无法访问
  protected id: string;    // 受保护，子类可用

  constructor(name: string, age: number, id: string) {
    this.name = name;
    this.age = age;
    this.id = id;
  }
}

class Student extends Person {
  constructor(name: string, age: number, id: string) {
    super(name, age, id);
    console.log(this.id);   // 可以访问 protected
  }
}

let p = new Person("张三", 18, "001");
console.log(p.name);  // 张三（公开属性，可以访问）
// console.log(p.age);  // 报错！私有属性无法外部访问
// console.log(p.id);   // 报错！受保护属性无法外部访问
```

---

## 9. super 关键字

super 用于在子类中调用父类的成员。

```typescript
class Vehicle {
  run() {
    console.log("行驶中");
  }
}

class Car extends Vehicle {
  run() {
    super.run();  // 先调用父类的 run
    console.log("汽车在公路上行驶");
  }
}

new Car().run();
// 输出:
// 行驶中
// 汽车在公路上行驶
```

---

## 10. 多态

子类可以重写父类的方法，表现出不同的行为。

```typescript
class Shape {
  getArea(): number {
    return 0;
  }
}

class Circle extends Shape {
  radius: number;

  constructor(radius: number) {
    super();
    this.radius = radius;
  }

  getArea(): number {  // 重写父类方法
    return Math.PI * this.radius * this.radius;
  }
}

class Rectangle extends Shape {
  width: number;
  height: number;

  constructor(width: number, height: number) {
    super();
    this.width = width;
    this.height = height;
  }

  getArea(): number {  // 重写父类方法
    return this.width * this.height;
  }
}

let shapes: Shape[] = [new Circle(5), new Rectangle(4, 6)];
shapes.forEach(s => console.log(s.getArea()));
// 输出: 78.54 和 24
```

---

## 11. instanceof 类型判断

用 `instanceof` 判断对象是否是某个类的实例。

```typescript
class Dog {}
class Cat {}

let dog = new Dog();

console.log(dog instanceof Dog);  // true
console.log(dog instanceof Cat);  // false
```

---

## 12. getter / setter 访问器

用 get/set 关键字定义计算属性，控制属性的读写行为。

```typescript
class Person {
  private _age: number = 0;

  get age(): number {
    return this._age;
  }

  set age(value: number) {
    if (value > 0 && value < 150) {
      this._age = value;
    }
  }
}

let p = new Person();
p.age = 20;       // 调用 set
console.log(p.age); // 20  调用 get
```

---

## 13. 抽象类

抽象类不能直接实例化，用于定义公共接口让子类继承。

```typescript
abstract class Shape {
  abstract getArea(): number;  // 抽象方法，子类必须实现
}

class Square extends Shape {
  side: number;

  constructor(side: number) {
    super();
    this.side = side;
  }

  getArea(): number {
    return this.side * this.side;
  }
}

// let shape = new Shape();  // 报错！抽象类不能直接实例化
let square = new Square(5);
console.log(square.getArea()); // 25
```

---

## 总结

| 概念 | 关键字 | 作用 |
|------|--------|------|
| 类 | `class` | 对象的模板 |
| 构造器 | `constructor` | 初始化对象 |
| 继承 | `extends` | 子类复用父类 |
| 访问控制 | `public/private/protected` | 控制成员可见性 |
| 静态成员 | `static` | 类级别的成员 |
| super | `super` | 调用父类成员 |
| 多态 | 方法重写 | 子类自定义行为 |
| 抽象类 | `abstract` | 定义公共接口 |
