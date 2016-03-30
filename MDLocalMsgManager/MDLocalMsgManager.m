//
//  MDLocalMsgManager.m
//  MovieDate
//
//  Created by 吴 吴 on 15/11/30.
//  Copyright © 2015年 上海佳黛品牌策划有限公司. All rights reserved.
//

#import "MDLocalMsgManager.h"

static MDLocalMsgManager *myManager = nil;
@implementation MDLocalMsgManager

+(MDLocalMsgManager *)sharedManager {
    @synchronized(self)
    {
        static dispatch_once_t pred;
        dispatch_once(&pred, ^{
            myManager = [[self alloc] init];
        });
    }
    return myManager;
}

- (id)init {
    self = [super init];
    if (self) {
        allLocalMsgArray = [NSMutableArray array];
    }
    return self;
}

- (NSMutableArray *)getAllLocalMsgArray {
    return allLocalMsgArray;
}

- (void)creatLocalMsgWithResult:(NSArray *)result{
    [allLocalMsgArray removeAllObjects];
    for (NSDictionary *tempDic in result) {
        MDLocalMsgManager *tempMsg = [MDLocalMsgManager new];
        tempMsg.msgContent = [tempDic objectForKey:@"content"];
        tempMsg.msgTime = [tempDic objectForKey:@"create_time"];
        tempMsg.msgId = [tempDic objectForKey:@"id"];
        tempMsg.msgImageUrl = [tempDic objectForKey:@"img"];
        tempMsg.msgP = [tempDic objectForKey:@"p"];
        tempMsg.msgStatus = [tempDic objectForKey:@"status"];
        tempMsg.msgTitle = [tempDic objectForKey:@"title"];
        tempMsg.msgType = [tempDic objectForKey:@"type"];
        tempMsg.msgUserId = [tempDic objectForKey:@"user_id"];
        tempMsg.msgClikUrl = [tempDic objectForKey:@"url"];
        [allLocalMsgArray addObject:tempMsg];
    }
}

- (void)updateDataWithModel:(MDLocalMsgManager *)model Index:(NSInteger)index {
    if (index>=allLocalMsgArray.count) {
        return;
    }
    [allLocalMsgArray replaceObjectAtIndex:index withObject:model];
    [self sortAllData];
}

- (void)sortAllData {
    NSMutableArray *array = [NSMutableArray arrayWithArray:allLocalMsgArray];
    NSMutableArray *haveReadArray = [NSMutableArray array];
    [allLocalMsgArray removeAllObjects];
    for (MDLocalMsgManager *temp in array) {
        if (temp.msgStatus.intValue != 1) {
            [allLocalMsgArray addObject:temp];
        }else{
            [haveReadArray addObject:temp];
        }
    }
    [allLocalMsgArray addObjectsFromArray:haveReadArray];
}

- (void)deleteDataWithModel:(MDLocalMsgManager *)model Index:(NSInteger)index {
    if (index>=allLocalMsgArray.count) {
        return;
    }
    [allLocalMsgArray removeObjectAtIndex:index];
}

- (NSInteger)getLocalNoReadCount {
    NSInteger count = 0;
    for (MDLocalMsgManager *temp in allLocalMsgArray) {
        if (temp.msgStatus.intValue != 1) {
            count+=1;
        }
    }
    return count;
}

- (void)logout {
    [allLocalMsgArray removeAllObjects];
}


@end
