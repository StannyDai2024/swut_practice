/**
 * 第二步：状态抽离
 *
 * 涉及的状态变量：
 * 1. 问题列表
 * 2. 问题总数
 * 3. 已完成问题数
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
  private completedNum = this.todoList.filter((item => item.completed)).length;
  private totalNum = this.todoList.length;

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
          }
        })

      }.width('100%').alignItems(HorizontalAlign.Start)

      //  添加按钮
      Button('添加任务')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding({ left: 20 })
  }
}