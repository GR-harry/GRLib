//
//  KVOMutableArray.m
//  SMSGroup
//
//  Created by GR on 15/5/27.
//  Copyright (c) 2015年 GR. All rights reserved.
//

#import "KVOMutableArray.h"

@interface KVOMutableArray ()

@property (nonatomic, strong)NSMutableArray *array;

@end

@implementation KVOMutableArray

#pragma mark -
#pragma mark Public

- (void)kvo_addObject:(id)object {
    
    [[self mutableArrayValueForKey:@"array"] addObject:object];
}

- (void)kvo_removeObject:(id)object {
    
    [[self mutableArrayValueForKey:@"array"] removeObject:object];
}

- (void)kvo_removeAllObjects {
    
    [[self mutableArrayValueForKey:@"array"] removeAllObjects];
}

- (void)kvo_addObjectsFromArray:(NSArray *)array {
    
    [[self mutableArrayValueForKey:@"array"] addObjectsFromArray:array];
}

- (id)kvo_objectAtIndex:(NSInteger)index {
    
    return [self.array objectAtIndex:index];
}

#pragma mark -
#pragma mark Private

- (instancetype)init {
    if (self = [super init]) {
        self.array = [NSMutableArray array];
    }
    return self;
}

- (NSUInteger)countOfArray {
    
    return self.array.count;
}

- (id)objectInArrayAtIndex:(NSUInteger)index {
    
    return [self.array objectAtIndex:index];
}

- (void)insertObject:(id)object inArrayAtIndex:(NSUInteger)index {
    
    [self.array insertObject:object atIndex:index];
    if (self.kvo_block) {
        self.kvo_block(self.array.count, YES, object);
    }
}

- (void)removeObjectFromArrayAtIndex:(NSUInteger)index {
    
    id obj = self.array[index];
    [self.array removeObjectAtIndex:index];
    if (self.kvo_block) {
        self.kvo_block(self.array.count, NO, obj);
    }
}

- (void)replaceObjectInArrayAtIndex:(NSUInteger)index withObject:(id)object {
    
    [self.array replaceObjectAtIndex:index withObject:object];
}
@end
