# 描述
个人一些工具库的封装

# 概览：主要内容如下：
## 水波视图 
    初始化view
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 245)];
    headerView.backgroundColor = [UIColor colorWithRed:229/255.f green:0/255.f blue:17/255.f alpha:1];
    [self.view addSubview:headerView];
    self.waveView = [WaveView addToView:headerView withFrame:CGRectMake(0, CGRectGetHeight(headerView.frame) - 4.5, CGRectGetWidth(headerView.frame), 5)];
    动画
    [self.waveView wave];
    

# toolsLib
(源文件文件夹)


# lib 
(最终静态库通用文件文件夹)

# 编译方式
先编译toolsLib release下 arm64 armv7 armv7s x86_64 版本
在编译pickup 最终在lib下生成通用版本
pickup通过shell脚本打包,可自行修改.
