//
//  ChannelManageVC.m
//  Renaissance
//
//  Created by Albus on 2019/2/6.
//  Copyright © 2019 Albus. All rights reserved.
//

#import "ChannelManageVC.h"
#import "AddChannelVC.h"
#import "ChannelCell.h"

@interface ChannelManageVC ()

@end

@implementation ChannelManageVC {
    UILabel *txtOfNoData;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Renaissance";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addChannel)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    txtOfNoData = [UILabel quickLabelWithFont:[UIFont systemFontOfSize:24] textColor:HexColor(@"B0B0B0") parentView:self.tableView];
    txtOfNoData.textAlignment = NSTextAlignmentCenter;
    txtOfNoData.text = @"No Channel.\nTry to add a RSS Channel.";
    txtOfNoData.frame = CGRectMake(0, 0, ScreenW, self.view.frame.size.height - Height_NavBar);
    
    [self.tableView registerClass:[ChannelCell class] forCellReuseIdentifier:@"ChannelCellIdentifier"];
}

#pragma mark action

- (void)addChannel {
    AddChannelVC *vcToAddChannel = [[AddChannelVC alloc] init];
    ASNavigationController *nav = [[ASNavigationController alloc] initWithRootViewController:vcToAddChannel];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

#pragma mark UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 93;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChannelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChannelCellIdentifier" forIndexPath:indexPath];
    [cell resetSubviews];
    [cell showGrayLine:(indexPath.row != 9)];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
