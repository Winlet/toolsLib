# 描述
个人一些工具库的封装

# 概览：主要内容如下：
## 水波视图 
    >1. 初始化view
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 245)];
    headerView.backgroundColor = [UIColor colorWithRed:229/255.f green:0/255.f blue:17/255.f alpha:1];
    [self.view addSubview:headerView];
    self.waveView = [WaveView addToView:headerView withFrame:CGRectMake(0, CGRectGetHeight(headerView.frame) - 4.5, CGRectGetWidth(headerView.frame), 5)];
    >2.动画
    [self.waveView wave];

## 卡片式带阴影tableview
    >1.初始化
    RMGroupShadowTableView *table  = [[RMGroupShadowTableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    table.groupShadowDelegate = self.tableViewUI;
    table.groupShadowDataSource = self.tableViewUI;
    //    table.contentInset = UIEdgeInsetsMake(150, 0, 0, 0);
    //    table.showSeparator = NO;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:table];
    >2.ViewModel tableViewUI
    self.tableViewUI = [[ShadowTableViewUI alloc]init];
    /* 数据为NSString则传递NSString数组  @[@"1",@"2",@"3",@"asdfareg"];
        否则传递NSDictionary数组*/
    self.tableViewUI.dataArray = @[@{@"1":@"123"},@{@"2":@"asd"},@{@"3":@"asdfareg"}];
    self.tableViewUI.heightForRow = 52;
    >3.tableViewUI的代理方法可修改cell和相应点击
    
## 选择器视图
    1.自定义信息,具体查看相应key值
    NSDictionary *dic = @{ZJPickerViewPropertyIsScrollToSelectedRowKey:@"YES",
    ZJPickerViewPropertyTipLabelTextKey:@"2016,5,1",
    };
    2.self.dataArray 数据列表 Array[
                Dictionary{
                Array[
                    Dictionary{
                    Array[...]:Key
                    }
                ]:Key
                }
    ]
    [ZJPickerView zj_showWithDataList:self.dataArray propertyDict:dic completion:^(NSString * _Nullable selectContent) {
    NSArray *selectStrings = [selectContent componentsSeparatedByString:@","];
    NSString * result= [selectStrings componentsJoinedByString:@"-"];
    NSLog(@"%@",result);
    }];
    
# 文件结构
>1. toolsLib  源文件文件夹
>2. lib  最终静态库通用文件文件夹

# 编译方式
先编译toolsLib release下 arm64 armv7 armv7s x86_64 版本
在编译pickup 最终在lib下生成通用版本
pickup通过shell脚本打包,可自行修改.
