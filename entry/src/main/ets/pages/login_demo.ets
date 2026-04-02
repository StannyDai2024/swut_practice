/**
 *
 */

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State username: string = '';
  @State password: string = '';
  @State errorMessage: string = '';


  // 校验通过返回 true，校验失败返回false
  validate(): boolean {

    // 用户名和密码怎么拿到呢
    if (this.username === 'admin' && this.password === '123456dp') {
      this.errorMessage = '';
      return true;
    } else {
      // 希望给用户一个提示： 请填写正确的用户名密码
      this.errorMessage = '请填写正确的用户名密码'
    }

    return false;
  }

  build() {
    Column({ space: '30'}) {
      Text('登录').fontSize(40).margin({top: 70})

      TextInput({
        text: '',
        placeholder: '请输入用户名'
      }).width('85%').onChange((val) => {
         this.username = val;
      })

      TextInput({
        text: '',
        placeholder: '请输入密码'
      }).width('85%').type(InputType.Password).onChange((val) => {
        this.password = val;
      })


      Text(this.errorMessage).fontColor('red')

      Button('登录').width('84%').onClick(() => {
        if (this.validate()) {

        }
      })
    }
    .width('100%')

  }
}