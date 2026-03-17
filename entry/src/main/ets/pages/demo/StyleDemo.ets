/**
 * 第二课：基础样式写法
 *
 * ArkUI 中样式通过链式调用设置，常用样式包括：
 * - 尺寸：width / height / padding / margin
 * - 文字：fontSize / fontColor / fontWeight / textAlign
 * - 背景：backgroundColor / backgroundImage
 * - 边框：border / borderRadius / borderWidth / borderColor
 * - 其他：opacity / shadow / zIndex
 */

@Entry
@Component
struct StyleDemo {
  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('第二课：基础样式')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .textAlign(TextAlign.Center)
          .margin({ top: 16 })

        // ========== 1. 文字样式 ==========
        Text('1. 文字样式')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('90%')

        Column({ space: 8 }) {
          Text('默认文字')
          Text('fontSize(20)').fontSize(20)
          Text('fontColor 红色').fontSize(16).fontColor('#E74C3C')
          Text('fontWeight Bold').fontSize(16).fontWeight(FontWeight.Bold)
          Text('fontStyle 斜体').fontSize(16).fontStyle(FontStyle.Italic)
          Text('textAlign 居中').fontSize(16).width('100%').textAlign(TextAlign.Center)
            .backgroundColor('#F0F0F0').borderRadius(4).padding(4)
          Text('letterSpacing 字间距').fontSize(16).letterSpacing(4)
        }
        .width('90%')
        .padding(12)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .alignItems(HorizontalAlign.Start)

        // ========== 2. 尺寸与间距 ==========
        Text('2. 尺寸与间距（padding / margin）')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('90%')

        Column({ space: 8 }) {
          // padding 是内边距
          Text('padding(20) — 内边距')
            .fontSize(14)
            .backgroundColor('#007AFF')
            .fontColor('#FFFFFF')
            .padding(20)
            .borderRadius(6)

          // margin 是外边距
          Text('margin({ left: 40 }) — 左外边距')
            .fontSize(14)
            .backgroundColor('#34C759')
            .fontColor('#FFFFFF')
            .padding(8)
            .margin({ left: 40 })
            .borderRadius(6)

          // 百分比宽度
          Text(`width('60%')`).fontSize(14).fontColor('#FFFFFF')
            .backgroundColor('#FF9500').padding(8).borderRadius(6)
            .width('60%')

          // 固定宽高
          Text('100x50')
            .fontSize(14)
            .fontColor('#FFFFFF')
            .backgroundColor('#AF52DE')
            .width(100)
            .height(50)
            .textAlign(TextAlign.Center)
            .borderRadius(6)
        }
        .width('90%')
        .padding(12)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .alignItems(HorizontalAlign.Start)

        // ========== 3. 边框样式 ==========
        Text('3. 边框样式')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('90%')

        Column({ space: 12 }) {
          // 圆角
          Text('borderRadius(16)')
            .fontSize(14).padding(12)
            .borderWidth(2).borderColor('#007AFF').borderRadius(16)

          // 不同圆角
          Text('不同圆角值')
            .fontSize(14).padding(12)
            .borderWidth(2).borderColor('#34C759')
            .borderRadius({ topLeft: 0, topRight: 20, bottomLeft: 20, bottomRight: 0 })

          // 虚线边框
          Text('虚线边框')
            .fontSize(14).padding(12)
            .borderWidth(2).borderColor('#FF9500').borderStyle(BorderStyle.Dashed)
            .borderRadius(8)
        }
        .width('90%')
        .padding(12)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .alignItems(HorizontalAlign.Start)

        // ========== 4. 背景与透明度 ==========
        Text('4. 背景与透明度')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('90%')

        Column({ space: 12 }) {
          // 渐变色效果用多层叠加模拟
          Text('背景色')
            .fontSize(14).fontColor('#FFFFFF').padding(12).width('100%')
            .backgroundColor('#007AFF').borderRadius(8).textAlign(TextAlign.Center)

          // 透明度
          Row({ space: 8 }) {
            Text('100%')
              .fontSize(12).fontColor('#FFFFFF').padding(8)
              .backgroundColor('#E74C3C').borderRadius(6).opacity(1)
            Text('70%')
              .fontSize(12).fontColor('#FFFFFF').padding(8)
              .backgroundColor('#E74C3C').borderRadius(6).opacity(0.7)
            Text('40%')
              .fontSize(12).fontColor('#FFFFFF').padding(8)
              .backgroundColor('#E74C3C').borderRadius(6).opacity(0.4)
          }
        }
        .width('90%')
        .padding(12)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .alignItems(HorizontalAlign.Start)

        // ========== 5. 实战：卡片样式 ==========
        Text('5. 实战：卡片样式')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('90%')

        // 组合运用以上样式做一个卡片
        Column({ space: 8 }) {
          Text('ArkUI 样式入门')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
          Text('通过链式调用的方式给组件设置样式，简洁直观。常用的样式属性包括尺寸、颜色、边框、间距等。')
            .fontSize(14)
            .fontColor('#666666')
            .lineHeight(22)
          Text('2024-01-01')
            .fontSize(12)
            .fontColor('#999999')
        }
        .width('90%')
        .padding(16)
        .backgroundColor('#FFFFFF')
        .borderRadius(12)
        .border({ width: 1, color: '#E0E0E0' })
        .alignItems(HorizontalAlign.Start)
        .shadow({ radius: 4, color: '#1A000000', offsetX: 0, offsetY: 2 })
      }
      .width('100%')
      .padding({ bottom: 40 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
