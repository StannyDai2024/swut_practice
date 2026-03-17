/**
 * 第三课：常用 UI 组件
 *
 * ArkUI 中最常用的基础组件：
 * - Text：文本显示
 * - Button：按钮
 * - TextInput：输入框
 * - Toggle：开关/复选
 * - Progress：进度条
 * - Slider：滑块
 * - Radio：单选
 * - Divider：分割线
 */

@Entry
@Component
struct ComponentDemo {
  @State inputValue: string = '';
  @State toggleOn: boolean = false;
  @State sliderValue: number = 40;
  @State clickCount: number = 0;

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('第三课：常用组件')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .textAlign(TextAlign.Center)
          .margin({ top: 16 })

        // ========== 1. Button 按钮 ==========
        Text('1. Button 按钮')
          .fontSize(18).fontWeight(FontWeight.Bold).width('90%')

        Column({ space: 12 }) {
          // 普通按钮
          Button('普通按钮')
            .width('100%').height(40).fontSize(16)

          // 带点击事件
          Button(`点击了 ${this.clickCount} 次`)
            .width('100%').height(40).fontSize(16)
            .backgroundColor('#34C759')
            .onClick(() => {
              this.clickCount++;
            })

          // 不同类型
          Row({ space: 8 }) {
            Button('强调', { type: ButtonType.Capsule })
              .fontSize(14).height(36)
              .backgroundColor('#007AFF')
            Button('普通', { type: ButtonType.Normal })
              .fontSize(14).height(36).borderRadius(6)
              .backgroundColor('#FF9500')
            Button('圆形', { type: ButtonType.Circle })
              .fontSize(12).width(50).height(50)
              .backgroundColor('#AF52DE')
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)
        }
        .width('90%').padding(12)
        .backgroundColor('#F5F5F5').borderRadius(8)

        // ========== 2. TextInput 输入框 ==========
        Text('2. TextInput 输入框')
          .fontSize(18).fontWeight(FontWeight.Bold).width('90%')

        Column({ space: 12 }) {
          TextInput({ placeholder: '请输入内容', text: this.inputValue })
            .width('100%').height(44)
            .onChange((value: string) => {
              this.inputValue = value;
            })

          Text(`当前输入：${this.inputValue || '（空）'}`)
            .fontSize(14).fontColor('#666666')

          // 密码输入框
          TextInput({ placeholder: '密码输入框' })
            .type(InputType.Password)
            .width('100%').height(44)

          // 数字输入框
          TextInput({ placeholder: '数字输入框' })
            .type(InputType.Number)
            .width('100%').height(44)
        }
        .width('90%').padding(12)
        .backgroundColor('#F5F5F5').borderRadius(8)
        .alignItems(HorizontalAlign.Start)

        // ========== 3. Toggle 开关 ==========
        Text('3. Toggle 开关')
          .fontSize(18).fontWeight(FontWeight.Bold).width('90%')

        Column({ space: 12 }) {
          Row() {
            Text('开启通知').fontSize(16)
            Blank()
            Toggle({ type: ToggleType.Switch, isOn: this.toggleOn })
              .onChange((isOn: boolean) => {
                this.toggleOn = isOn;
              })
          }
          .width('100%')

          Text(`当前状态：${this.toggleOn ? '已开启' : '已关闭'}`)
            .fontSize(14)
            .fontColor(this.toggleOn ? '#34C759' : '#999999')
        }
        .width('90%').padding(12)
        .backgroundColor('#F5F5F5').borderRadius(8)
        .alignItems(HorizontalAlign.Start)

        // ========== 4. Progress 进度条 ==========
        Text('4. Progress 进度条')
          .fontSize(18).fontWeight(FontWeight.Bold).width('90%')

        Column({ space: 12 }) {
          // 线性进度条
          Text('线性进度条 (70%)').fontSize(14).fontColor('#666666')
          Progress({ value: 70, total: 100, type: ProgressType.Linear })
            .width('100%')
            .color('#007AFF')

          // 环形进度条
          Text('环形进度条 (60%)').fontSize(14).fontColor('#666666')
          Progress({ value: 60, total: 100, type: ProgressType.Ring })
            .width(80).height(80)
            .color('#34C759')
        }
        .width('90%').padding(12)
        .backgroundColor('#F5F5F5').borderRadius(8)
        .alignItems(HorizontalAlign.Start)

        // ========== 5. Slider 滑块 ==========
        Text('5. Slider 滑块')
          .fontSize(18).fontWeight(FontWeight.Bold).width('90%')

        Column({ space: 8 }) {
          Slider({ value: this.sliderValue, min: 0, max: 100 })
            .width('100%')
            .blockColor('#007AFF')
            .trackColor('#E0E0E0')
            .selectedColor('#007AFF')
            .onChange((value: number) => {
              this.sliderValue = Math.round(value);
            })

          Text(`当前值：${this.sliderValue}`)
            .fontSize(14).fontColor('#666666')
        }
        .width('90%').padding(12)
        .backgroundColor('#F5F5F5').borderRadius(8)
        .alignItems(HorizontalAlign.Start)

        // ========== 6. Divider 分割线 ==========
        Text('6. Divider 分割线')
          .fontSize(18).fontWeight(FontWeight.Bold).width('90%')

        Column({ space: 8 }) {
          Text('上方内容').fontSize(14)
          Divider().color('#E0E0E0')
          Text('下方内容').fontSize(14)
          Divider().color('#007AFF').strokeWidth(2)
          Text('更下方内容').fontSize(14)
        }
        .width('90%').padding(12)
        .backgroundColor('#F5F5F5').borderRadius(8)
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .padding({ bottom: 40 })
    }
    .width('100%')
    .height('100%')
  }
}
