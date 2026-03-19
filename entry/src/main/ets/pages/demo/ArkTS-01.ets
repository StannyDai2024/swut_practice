/**
 * ArkTS 基础语法 —— 教学演示页面
 *
 * 进入此页面后，教学代码会自动运行
 * 打开 HiLog 控制台，搜索 "ArkTS-01" 查看输出
 */
import { runLesson01 } from '../../learn/ArkTS-01';

@Entry
@Component
struct ArkTS01 {

  aboutToAppear(): void {
    runLesson01();
  }

  build() {
    Column({ space: 20 }) {
      Text('ArkTS 基础语法')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      Text('教学代码已运行')
        .fontSize(16)
        .fontColor('#34C759')

      Text('请打开 HiLog 控制台\n搜索 "ArkTS-01" 查看输出')
        .fontSize(14)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .lineHeight(22)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
