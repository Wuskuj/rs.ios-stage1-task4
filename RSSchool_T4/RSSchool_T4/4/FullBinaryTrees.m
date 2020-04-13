#import "FullBinaryTrees.h"
#import "CreateTrees.h"


@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count {
    NSArray *nodes = [CreateTrees createAllBinaryTrees:count];
    NSString *finalResult = [CreateTrees stringFromNodes:nodes count:count];
    return finalResult;
}

@end
