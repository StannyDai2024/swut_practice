/**
 * 第一课：基础布局组件
 *
 * ArkUI 中最常用的三种布局容器：
 * - Column：子元素纵向排列（从上到下）
 * - Row：子元素横向排列（从左到右）
 * - Stack：子元素层叠排列（后面的盖在前面的上面）
 *
 * 核心属性：
 * - justifyContent：主轴方向的对齐方式
 * - alignItems：交叉轴方向的对齐方式
 * - space：子元素之间的间距
 */

@Entry
@Component
struct LayoutDemo {
  build() {
    // 最外层用 Scroll 包裹，内容多时可以滚动
    Scroll() {
      Column({ space: 20 }) {
        // ========== 标题 ==========
        Text('第一课：基础布局')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .textAlign(TextAlign.Center)
          .margin({ top: 16 })

        // ========== 1. Column 纵向布局 ==========
        Text('1. Column — 纵向排列')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('90%')

        // Column 默认就是从上到下排列
        Column({ space: 8 }) {
          Text('第一行').fontSize(16).fontColor('#FFFFFF')
            .backgroundColor('#007AFF').padding(12).borderRadius(6)
          Text('第二行').fontSize(16).fontColor('#FFFFFF')
            .backgroundColor('#34C759').padding(12).borderRadius(6)
          Text('第三行').fontSize(16).fontColor('#FFFFFF')
            .backgroundColor('#FF9500').padding(12).borderRadius(6)
        }
        .width('90%')
        .padding(12)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .alignItems(HorizontalAlign.Center)

        // ========== 2. Row 横向布局 ==========
        Text('2. Row — 横向排列')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('90%')

        // Row 从左到右排列
        Row({ space: 8 }) {
          Text('左').fontSize(16).fontColor('#FFFFFF')
            .backgroundColor('#007AFF').padding(12).borderRadius(6)
          Text('中').fontSize(16).fontColor('#FFFFFF')
            .backgroundColor('#34C759').padding(12).borderRadius(6)
          Text('右').fontSize(16).fontColor('#FFFFFF')
            .backgroundColor('#FF9500').padding(12).borderRadius(6)
        }
        .width('90%')
        .padding(12)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .justifyContent(FlexAlign.Center)

        // ========== 3. Row 的对齐方式 ==========
        Text('3. Row 对齐方式演示')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('90%')

        // justifyContent: SpaceBetween — 两端对齐
        Text('SpaceBetween（两端对齐）')
          .fontSize(14)
          .fontColor('#666666')
          .width('90%')

        Row() {
          Text('A').fontSize(16).fontColor('#FFFFFF')
            .backgroundColor('#007AFF').padding(12).borderRadius(6)
          Text('B').fontSize(16).fontColor('#FFFFFF')
            .backgroundColor('#34C759').padding(12).borderRadius(6)
          Text('C').fontSize(16).fontColor('#FFFFFF')
            .backgroundColor('#FF9500').padding(12).borderRadius(6)
        }
        .width('90%')
        .padding(12)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .justifyContent(FlexAlign.SpaceBetween)

        // justifyContent: SpaceEvenly — 均匀分布
        Text('SpaceEvenly（均匀分布）')
          .fontSize(14)
          .fontColor('#666666')
          .width('90%')

        Row() {
          Text('A').fontSize(16).fontColor('#FFFFFF')
            .backgroundColor('#007AFF').padding(12).borderRadius(6)
          Text('B').fontSize(16).fontColor('#FFFFFF')
            .backgroundColor('#34C759').padding(12).borderRadius(6)
          Text('C').fontSize(16).fontColor('#FFFFFF')
            .backgroundColor('#FF9500').padding(12).borderRadius(6)
        }
        .width('90%')
        .padding(12)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .justifyContent(FlexAlign.SpaceEvenly)

        // ========== 4. Stack 层叠布局 ==========
        Text('4. Stack — 层叠排列')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('90%')

        // Stack 中后面的元素会盖在前面的上面
        Stack() {
          // 最底层：大方块
          Text('底层')
            .fontSize(14)
            .fontColor('#FFFFFF')
            .width(200)
            .height(120)
            .backgroundColor('#007AFF')
            .borderRadius(8)
            .textAlign(TextAlign.Center)

          // 中间层
          Text('中层')
            .fontSize(14)
            .fontColor('#FFFFFF')
            .width(140)
            .height(80)
            .backgroundColor('#34C759')
            .borderRadius(8)
            .textAlign(TextAlign.Center)

          // 最上层：小方块
          Text('顶层')
            .fontSize(14)
            .fontColor('#FFFFFF')
            .width(80)
            .height(40)
            .backgroundColor('#FF9500')
            .borderRadius(8)
            .textAlign(TextAlign.Center)
        }
        .width('90%')
        .height(140)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)

        // ========== 5. 嵌套布局 ==========
        Text('5. 嵌套布局（Row 里放 Column）')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('90%')

        Row({ space: 12 }) {
          Column({ space: 4 }) {
            Text('姓名').fontSize(12).fontColor('#999999')
            Text('张三').fontSize(16).fontWeight(FontWeight.Bold)
          }
          .alignItems(HorizontalAlign.Start)

          Column({ space: 4 }) {
            Text('班级').fontSize(12).fontColor('#999999')
            Text('计科2班').fontSize(16).fontWeight(FontWeight.Bold)
          }
          .alignItems(HorizontalAlign.Start)

          Column({ space: 4 }) {
            Text('学号').fontSize(12).fontColor('#999999')
            Text('2024001').fontSize(16).fontWeight(FontWeight.Bold)
          }
          .alignItems(HorizontalAlign.Start)
        }
        .width('90%')
        .padding(16)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .justifyContent(FlexAlign.SpaceEvenly)
      }
      .width('100%')
      .padding({ bottom: 40 })
    }
    .width('100%')
    .height('100%')
  }
}
