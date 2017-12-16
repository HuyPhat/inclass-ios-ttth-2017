//
//  ContentManager.h
//  SingletonDemo
//
//  Created by TNKHANH on 12/12/17.
//  Copyright © 2017 TNKHANH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentManager : NSObject {
    int saveValue;
}

+(ContentManager *)shareManager;
-(void)saveValue:(int)value;
-(int)getValue;

@end
