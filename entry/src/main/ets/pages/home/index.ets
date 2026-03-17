import { router } from '@kit.ArkUI';

@Entry
@Component
struct HomePage {
  @State currentIndex: number = 0;
  private tabController: TabsController = new TabsController();

  @Builder
  tabBarBuilder(title: string, index: number) {
    Column() {
      Text(title)
        .fontSize(14)
        .fontColor(this.currentIndex === index ? '#007AFF' : '#999999')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabController, index: this.currentIndex }) {
      TabContent() {
        Column() {
          Text('首页')
            .fontSize(20)
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }
      .tabBar(this.tabBarBuilder('首页', 0))

      TabContent() {
        Column() {
          Text('课程')
            .fontSize(20)
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }
      .tabBar(this.tabBarBuilder('课程', 1))

      TabContent() {
        Column() {
          Text('我的')
            .fontSize(20)
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }
      .tabBar(this.tabBarBuilder('我的', 2))
    }
    .barHeight(56)
    .onChange((index: number) => {
      this.currentIndex = index;
    })
    .width('100%')
    .height('100%')
  }
}
