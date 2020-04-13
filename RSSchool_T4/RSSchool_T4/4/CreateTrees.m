//
//  CreateTrees.m
//  RSSchool_T4
//
//  Created by Филипп on 4/13/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import "CreateTrees.h"

@interface Node : NSObject

@property (nonatomic, strong) Node *left;
@property (nonatomic, strong) Node *right;

@end

@implementation Node

@end

@implementation CreateTrees

+ (NSArray *)createAllBinaryTrees:(NSInteger)count {
    NSMutableArray *trees = [NSMutableArray new];
    if (count % 2 == 0) {
        return trees;
    }
    if (count == 1) {
        Node *currentNode = [Node new];
        [trees addObject:currentNode];
        return trees;
    }
    for (int i = 1; i < count;) {
        for (Node *left in [self createAllBinaryTrees:i]) {
            for (Node *right in [self createAllBinaryTrees:count - i - 1]) {
                Node *root = [Node new];
                root.left = left;
                root.right = right;
                [trees addObject:root];
            }
        }
        i += 2;
    }
    return trees;
}

+ (NSString *)stringFromNodes:(NSArray *)arrayNodes count:(NSInteger)count {
    if (count == 1) {
        return @"[[0]]";
    }
    NSMutableString *resultNew = [NSMutableString stringWithString:@"["];
    for (Node *node in arrayNodes) {
        NSInteger oneNode = 1;
        NSInteger countOfNodes = 0;
        NSMutableString *string = [NSMutableString stringWithString:@"["];
        NSMutableString *finalString = [NSMutableString stringWithString:@"0,"];
        NSMutableArray *massiveNodes = [NSMutableArray arrayWithObject:node];
       
       
        for (NSInteger i = countOfNodes; i < count; i++) {
            Node *nodeNow = [massiveNodes firstObject];
            [massiveNodes removeObjectAtIndex:0];
            if (nodeNow.left && nodeNow.right) {
                [finalString appendString:@"0,0,"];
                [massiveNodes addObject:nodeNow.left];
                [massiveNodes addObject:nodeNow.right];
                oneNode += 2;
            } else {
                if (oneNode < count) {
                    [finalString appendString:@"null,null,"];
                }
            }
        }
        NSInteger location = finalString.length - 1;
        [finalString deleteCharactersInRange:NSMakeRange(location, 1)];
        [string appendString:finalString];
        Node *lastObj = massiveNodes.lastObject;
        if ([node isEqual:lastObj]) {
            [string appendString:@"]"];
        }else {
            [string appendString:@"],"];
        }
        [resultNew appendString:string];
    }
    
    [resultNew appendString:@"]"];
    return resultNew;
}

@end
