//
//  CreateTrees.h
//  RSSchool_T4
//
//  Created by Филипп on 4/13/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreateTrees : NSObject
+ (NSArray *)createAllBinaryTrees:(NSInteger)count;
+ (NSString *)stringFromNodes:(NSArray *)arrayNodes count:(NSInteger)count;
@end

