import { router } from '@kit.ArkUI';

@Entry
@Component
struct LoginPage {
  @State username: string = '';
  @State password: string = '';
  @State errorMsg: string = '';

  // 前端校验逻辑
  validate(): boolean {
    if (this.username.trim() === '') {
      this.errorMsg = '请输入用户名';
      return false;
    }
    if (this.username.trim().length < 3) {
      this.errorMsg = '用户名至少3个字符';
      return false;
    }
    if (this.password === '') {
      this.errorMsg = '请输入密码';
      return false;
    }
    if (this.password.length < 6) {
      this.errorMsg = '密码至少6位';
      return false;
    }
    this.errorMsg = '';
    return true;
  }

  build() {
    Column() {
      // 标题
      Text('登录')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 120, bottom: 40 })

      // 用户名输入框
      TextInput({ placeholder: '请输入用户名', text: this.username })
        .type(InputType.Normal)
        .width('80%')
        .height(48)
        .margin({ bottom: 16 })
        .onChange((value: string) => {
          this.username = value;
          this.errorMsg = '';
        })

      // 密码输入框
      TextInput({ placeholder: '请输入密码', text: this.password })
        .type(InputType.Password)
        .width('80%')
        .height(48)
        .margin({ bottom: 8 })
        .onChange((value: string) => {
          this.password = value;
          this.errorMsg = '';
        })

      // 错误提示
      Text(this.errorMsg)
        .fontSize(14)
        .fontColor('#E74C3C')
        .height(24)
        .margin({ bottom: 8 })

      // 登录按钮
      Button('登录')
        .width('80%')
        .height(44)
        .fontSize(18)
        .margin({ top: 16 })
        .onClick(() => {
          if (this.validate()) {
            router.pushUrl({ url: 'pages/home/index' });
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}
