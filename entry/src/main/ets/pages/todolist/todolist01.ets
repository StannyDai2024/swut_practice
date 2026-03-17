// 第一步：构建基础 UI

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 30 }) {
      Text('质量管理').fontSize(40)

      Row({ space: '30' }) {
        Text('完成进度')

        Stack() {
          Row() {
            Text('1')
            Text('/5')
          }

          Progress({
            value: 1,
            total: 5,
            style: ProgressStyle.Ring
          })
        }
      }

      Divider()
      Column() {
        // 问题清单
        Text('问题清单：').fontSize(20).margin({ bottom: 15 })

        Row({ space: 20 }) {
          Text('问题1')
          Text('状态：已完成')
        }

        Row({ space: 20 }) {
          Text('问题2')
          Text('状态：已完成')
        }

        Row({ space: 20 }) {
          Text('问题3')
          Text('状态：已完成')
        }
      }.width('100%').alignItems(HorizontalAlign.Start)

      //  添加按钮
      Button('添加任务')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding({ left: 20 })
  }
}