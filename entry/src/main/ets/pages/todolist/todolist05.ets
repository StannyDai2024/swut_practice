// 完成UI的美化
// 增加输入框，添加待办事项
// 增加完成状态，已完成的事项显示删除线
// 增加删除功能

/**
 * 第五步：UI美化 + 输入框添加 + 完成状态删除线 + 删除功能
 */

interface Todo {
  name: string;
  completed: boolean;
}

@Entry
@Component
struct TodoList05 {
  @State @Watch('onDataChange') todoList: Todo[] = [
    { name: '学习 ArkTS 基础语法', completed: true },
    { name: '完成 TodoList 练习', completed: false },
    { name: '阅读鸿蒙开发文档', completed: false }
  ];
  @State completedNum: number = this.todoList.filter(item => item.completed).length;
  @State totalNum: number = this.todoList.length;
  @State inputText: string = '';

  onDataChange() {
    this.completedNum = this.todoList.filter(item => item.completed).length;
    this.totalNum = this.todoList.length;
  }

  build() {
    Column() {
      // ========== 顶部标题栏 ==========
      Text('待办清单')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333333')
        .width('100%')
        .textAlign(TextAlign.Center)
        .padding({ top: 20, bottom: 16 });

      // ========== 进度区域 ==========
      Row() {
        Column({ space: 4 }) {
          Text('完成进度')
            .fontSize(14)
            .fontColor('#999999');
          Text(`${this.completedNum} / ${this.totalNum}`)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor('#007AFF');
        }
        .alignItems(HorizontalAlign.Start);

        Stack() {
          Progress({
            value: this.completedNum,
            total: this.totalNum > 0 ? this.totalNum : 1,
            style: ProgressStyle.Ring
          })
            .width(56)
            .height(56)
            .color('#007AFF')
            .backgroundColor('#E8E8E8');

          Text(`${this.totalNum > 0 ? Math.round(this.completedNum / this.totalNum * 100) : 0}%`)
            .fontSize(12)
            .fontColor('#007AFF');
        }
      }
      .width('90%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding(16)
      .backgroundColor('#F8F8F8')
      .borderRadius(12)
      .margin({ bottom: 16 });

      // ========== 输入框 + 添加按钮 ==========
      Row({ space: 10 }) {
        TextInput({ placeholder: '输入新的待办事项...', text: this.inputText })
          .layoutWeight(1)
          .height(44)
          .fontSize(15)
          .backgroundColor('#F5F5F5')
          .borderRadius(10)
          .padding({ left: 12, right: 12 })
          .onChange((value: string) => {
            this.inputText = value;
          })
          .onSubmit(() => {
            this.addTodo();
          });

        Button('添加')
          .height(44)
          .fontSize(15)
          .fontColor(Color.White)
          .backgroundColor('#007AFF')
          .borderRadius(10)
          .onClick(() => {
            this.addTodo();
          });
      }
      .width('90%')
      .margin({ bottom: 16 });

      // ========== 待办列表 ==========
      List({ space: 10 }) {
        ForEach(this.todoList, (todo: Todo, index: number) => {
          ListItem() {
            Row() {
              // 左侧：勾选圆圈 + 文字
              Row({ space: 12 }) {
                // 完成状态圆圈
                Text(todo.completed ? '✓' : '')
                  .width(24)
                  .height(24)
                  .fontSize(14)
                  .fontColor(Color.White)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(todo.completed ? '#34C759' : Color.White)
                  .borderRadius(12)
                  .borderWidth(todo.completed ? 0 : 2)
                  .borderColor('#DDDDDD')
                  .onClick(() => {
                    this.toggleTodo(index);
                  });

                // 待办文字（已完成显示删除线）
                Text(todo.name)
                  .fontSize(16)
                  .fontColor(todo.completed ? '#BBBBBB' : '#333333')
                  .decoration({
                    type: todo.completed ? TextDecorationType.LineThrough : TextDecorationType.None,
                    color: '#BBBBBB'
                  })
                  .layoutWeight(1);
              }
              .layoutWeight(1);

              // 右侧：删除按钮
              Text('✕')
                .fontSize(18)
                .fontColor('#FF3B30')
                .width(32)
                .height(32)
                .textAlign(TextAlign.Center)
                .borderRadius(16)
                .backgroundColor('#FFF0F0')
                .onClick(() => {
                  this.deleteTodo(index);
                });
            }
            .width('100%')
            .padding(14)
            .backgroundColor(Color.White)
            .borderRadius(12)
            .shadow({
              radius: 4,
              color: '#0D000000',
              offsetX: 0,
              offsetY: 2
            });
          }
        })
      }
      .width('90%')
      .height('auto')
      .layoutWeight(1);

      // ========== 底部提示 ==========
      if (this.todoList.length === 0) {
        Text('暂无待办事项，添加一个吧')
          .fontSize(14)
          .fontColor('#CCCCCC')
          .margin({ top: 60 });
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
    .padding({ bottom: 20 });
  }

  // ========== 方法 ==========

  addTodo() {
    let trimmed: string = this.inputText.trim();
    if (trimmed.length === 0) {
      return;
    }
    this.todoList = [...this.todoList, { name: trimmed, completed: false }];
    this.inputText = '';
  }

  toggleTodo(index: number) {
    this.todoList = this.todoList.map((item: Todo, idx: number) => {
      if (idx === index) {
        let updated: Todo = { name: item.name, completed: !item.completed };
        return updated;
      }
      return item;
    });
  }

  deleteTodo(index: number) {
    this.todoList = this.todoList.filter((_item: Todo, idx: number) => idx !== index);
  }
}