//
//  ContentManager.m
//  SingletonDemo
//
//  Created by TNKHANH on 12/12/17.
//  Copyright © 2017 TNKHANH. All rights reserved.
//

#import "ContentManager.h"

@implementation ContentManager

+(ContentManager *)shareManager {
    static ContentManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ContentManager alloc]init];
    });
    return manager;
}

-(void)saveValue:(int)value {
    saveValue = value;
}

-(int)getValue {
    return saveValue;
}

@end
