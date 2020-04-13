#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
   // NSString *string = @"5";
    NSString *minus = [number substringWithRange:NSMakeRange(0, 1)];
    if([minus isEqualToString:@"-"]){
        return nil;
    }
    NSMutableArray *array = [NSMutableArray new];
    NSMutableArray *arrayTwo = [NSMutableArray new];
    
    NSArray *one = @[@2,@3];
    NSArray *two = @[@1,@5,@3];
    NSArray *three = @[@2,@6];
    NSArray *four = @[@1,@5,@7];
    NSArray *five = @[@2,@4,@6,@8];
    NSArray *six = @[@3,@5,@9];
    NSArray *seven = @[@4,@8];
    NSArray *eight = @[@5,@7,@9,@0];
    NSArray *nine = @[@6,@8];
    NSArray *zero = @[@8];
    
    for (int i = 0; i < number.length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *symbol = [number substringWithRange:range];
        [array addObject:symbol];
    }
    
    for (int i = 0; i < array.count; i++) {
        int element = [(NSNumber*)array[i] intValue];
        switch (element) {
            case 0: [self completed:zero string:number arrayNumberTwo:arrayTwo i:i]; break;
            case 1:[self completed:one string:number arrayNumberTwo:arrayTwo i:i]; break;
            case 2: [self completed:two string:number arrayNumberTwo:arrayTwo i:i]; break;
            case 3: [self completed:three string:number arrayNumberTwo:arrayTwo i:i]; break;
            case 4: [self completed:four string:number arrayNumberTwo:arrayTwo i:i]; break;
            case 5: [self completed:five string:number arrayNumberTwo:arrayTwo i:i]; break;
            case 6: [self completed:six string:number arrayNumberTwo:arrayTwo i:i]; break;
            case 7: [self completed:seven string:number arrayNumberTwo:arrayTwo i:i]; break;
            case 8:[self completed:eight string:number arrayNumberTwo:arrayTwo i:i];break;
            case 9:[self completed:nine string:number arrayNumberTwo:arrayTwo i:i]; break;
            default:
                break;
        }
    }
    
    return arrayTwo;
}


-(void)completed:(NSArray*)numberArray string:(NSString*)temp arrayNumberTwo:(NSMutableArray*)arrayTwo i:(int)i {
    for (NSNumber *num in numberArray){
        NSRange range = NSMakeRange(i, 1);
        NSString *stringNew = [temp stringByReplacingCharactersInRange:range withString:num.stringValue];
        [arrayTwo addObject:stringNew];
    }
}
@end
