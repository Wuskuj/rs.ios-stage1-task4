#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    if(number.intValue <= 4)
    {
        return nil;
        
    }else {
        long numberInt = number.intValue;
        long temp = numberInt * numberInt;
        NSMutableArray *finalArray = [self decompos:numberInt :temp];
        [finalArray removeLastObject];
        return finalArray;
    }
    
}

- (NSMutableArray *)decompos:(long)number :(long)remainder {
    if(remainder == 0) {
        NSNumber *res = [NSNumber numberWithLong:number];
        return [NSMutableArray arrayWithObject:res];
    }
    for(long i = number - 1; i > 0; i--){
        long resultValue = (remainder - (i * i));
        if(resultValue >= 0) {
            NSMutableArray *finalArray = [self decompos:i :resultValue];
            if(finalArray != nil) {
                NSNumber *element = [NSNumber numberWithLong:number];
                [finalArray addObject:element];
                return finalArray;
        }
        }
    }
    
    return nil;
}

@end
