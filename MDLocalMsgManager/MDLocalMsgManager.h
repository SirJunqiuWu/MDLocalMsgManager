//
//  MDLocalMsgManager.h
//  MovieDate
//
//  Created by 吴 吴 on 15/11/30.
//  Copyright © 2015年 上海佳黛品牌策划有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDLocalMsgManager : NSObject
{
    NSMutableArray *allLocalMsgArray;
}

@property (nonatomic,strong)NSString *msgContent;
@property (nonatomic,strong)NSString *msgTime;
@property (nonatomic,strong)NSString *msgId;
@property (nonatomic,strong)NSString *msgImageUrl;
@property (nonatomic,strong)NSString *msgP;
@property (nonatomic,strong)NSString *msgStatus;
@property (nonatomic,strong)NSString *msgTitle;
@property (nonatomic,strong)NSString *msgType;
@property (nonatomic,strong)NSString *msgUserId;
@property (nonatomic,strong)NSString *msgClikUrl;


/**
 *  单例
 *
 *  @return MDJPushMsgManager
 */
+(MDLocalMsgManager *)sharedManager;


/**
 *  获取存放所有消息的数组
 *
 *  @return NSMutableArray
 */
- (NSMutableArray *)getAllLocalMsgArray;


- (void)creatLocalMsgWithResult:(NSArray *)result;

- (void)updateDataWithModel:(MDLocalMsgManager *)model Index:(NSInteger)index;

- (void)deleteDataWithModel:(MDLocalMsgManager *)model Index:(NSInteger)index;

- (NSInteger)getLocalNoReadCount;

- (void)logout;

@end
