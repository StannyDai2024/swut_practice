import { router } from '@kit.ArkUI';

/**
 * Demo 目录页
 * 点击对应课程跳转到示例页面
 */

@Entry
@Component
struct DemoIndex {
  build() {
    Column({ space: 16 }) {
      Text('ArkUI 教学示例')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 60, bottom: 20 })

      Button('第一课：基础布局')
        .width('80%').height(48).fontSize(16)
        .backgroundColor('#007AFF')
        .onClick(() => {
          router.pushUrl({ url: 'pages/demo/LayoutDemo' });
        })

      Button('第二课：基础样式')
        .width('80%').height(48).fontSize(16)
        .backgroundColor('#34C759')
        .onClick(() => {
          router.pushUrl({ url: 'pages/demo/StyleDemo' });
        })

      Button('第三课：常用组件')
        .width('80%').height(48).fontSize(16)
        .backgroundColor('#FF9500')
        .onClick(() => {
          router.pushUrl({ url: 'pages/demo/ComponentDemo' });
        })
    }
    .width('100%')
    .height('100%')
  }
}
