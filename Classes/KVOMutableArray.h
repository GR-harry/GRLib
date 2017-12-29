//
//  KVOMutableArray.h
//  SMSGroup
//
//  Created by GR on 15/5/27.
//  Copyright (c) 2015年 GR. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  数组对象添加元素，或删除元素时的回调
 *
 *  @param coount   添加或删除后，数组元素的个数
 *  @param isAdding 是添加为YES，删除为NO
 *  @param obj      添加或删除的元素
 */
typedef void(^KVOChangeBlock)(NSInteger coount, BOOL isAdding, id obj);

@interface KVOMutableArray : NSObject

@property (nonatomic, copy)KVOChangeBlock kvo_block;

/**
 *  添加对象， 触发监听
 *
 *  @param object 对象
 */
- (void)kvo_addObject:(id)object;

/**
 *  删除对象， 触发监听
 *
 *  @param object 对象
 */
- (void)kvo_removeObject:(id)object;

/**
 *  删除所有对象， 触发监听
 */
- (void)kvo_removeAllObjects;

/**
 *  将数组中的所有对象添加进入， 触发监听
 *
 *  @param array 数组
 */
- (void)kvo_addObjectsFromArray:(NSArray *)array;

/**
 *  获取index位置的对象
 *
 *  @param index 位置
 *
 *  @return 对象
 */
- (id)kvo_objectAtIndex:(NSInteger)index;

@end
