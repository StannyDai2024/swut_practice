/**
 * 第四步：完成联动
 *
 * 切换状态时，实现顶部的进度条自动更新
 */

interface Todo {
  name: string;
  completed: boolean;
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State todoList: Todo[] = [
    { name: '问题1', completed: true },
    { name: '问题2', completed: false },
    { name: '问题3', completed: false }
  ]
  @State completedNum: number = this.todoList.filter((item => item.completed)).length;
  @State totalNum: number = this.todoList.length;

  build() {
    Column({ space: 30 }) {
      Text('质量管理').fontSize(40)

      Row({ space: '30' }) {
        Text('完成进度')

        Stack() {
          Row() {
            Text(this.completedNum.toString())
            Text(`/${this.totalNum}`)
          }

          Progress({
            value: this.completedNum,
            total: this.totalNum,
            style: ProgressStyle.Ring
          })
        }
      }

      Divider()
      Column() {
        // 问题清单
        Text('问题清单：').fontSize(20).margin({ bottom: 15 })

        ForEach(this.todoList, (todo: Todo, index: number) => {
          Row({ space: 20 }) {
            Text(todo.name)
            Text(`状态：${todo.completed ? '已完成' : '未完成'}`)
              .onClick(() => {
                this.todoList = this.todoList.map((item, idx) => {
                  if (idx === index) {
                    item.completed = !item.completed;
                  }
                  return item;
                })
              })
          }
        })
      }.width('100%').alignItems(HorizontalAlign.Start)

      //  添加按钮
      Button('添加任务').onClick(() => {
        this.todoList.push({ name: '问题x', completed: false })
      })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding({ left: 20 })
  }
}