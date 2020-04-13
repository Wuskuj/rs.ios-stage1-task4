#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    NSMutableArray *minusArray = [NSMutableArray new];
    NSMutableArray *plusArray = [NSMutableArray new];
    int resultOne = 0;
    int resultTwo = 0;
    int sumArray = 1;
    
    if (numberOfItems > array.count) {
        for (id num in array) {
            if([num isKindOfClass:[NSNumber class]]){
                NSNumber *number = (NSNumber*)num;
                int numberNew = number.intValue;
                sumArray *= numberNew;
            }
        }
        return sumArray;
    }
    
    for (id num in array) {
        if([num isKindOfClass:[NSNumber class]]){
            NSNumber *number = (NSNumber*)num;
            int numberNew = number.intValue;
            numberNew < 0 ? [minusArray addObject:number] : [plusArray addObject:number];
        }
    }
    
    int min = [[minusArray valueForKeyPath:@"@min.intValue"] intValue];
    int max = [[plusArray valueForKeyPath:@"@max.intValue"] intValue];
    
    int sum = 0;
    for (NSNumber *number in minusArray) {
        if (minusArray.count != 1) {
            if (number.intValue != min) {
                int newSum = min * number.intValue;
                if (newSum > sum) {
                    sum = newSum;
                }
            }
        }else {
            sum = min;
        }
        
    }
    
    if (numberOfItems == 3) {
        if (minusArray.count == 1 && plusArray.count == 1) {
            resultOne = sum * max;
            return resultOne;
        }
        resultOne = sum * max;
    }else {
        NSMutableArray *array = [NSMutableArray arrayWithArray:plusArray];
        [array removeObject:[NSNumber numberWithInt:max]];
        int maxNew = [[array valueForKeyPath:@"@max.intValue"] intValue];
        resultOne = sum * max * maxNew;
    }
    
    
    NSMutableArray *arrayPlus = [NSMutableArray arrayWithArray:plusArray];
    int compositionPlus = 0;
    int composition = 0;
    [arrayPlus removeObject:[NSNumber numberWithInt:max]];
    for (int i = 0; i < numberOfItems - 1; i++) {
        int maxNew = [[arrayPlus valueForKeyPath:@"@max.intValue"] intValue];
        composition = max * maxNew;
        max = composition;
        compositionPlus = max;
        [arrayPlus removeObject:[NSNumber numberWithInt:maxNew]];
    }
    
    resultTwo = compositionPlus;
    if (resultOne > resultTwo) {
        return resultOne;
    }
    return resultTwo;
}
@end
