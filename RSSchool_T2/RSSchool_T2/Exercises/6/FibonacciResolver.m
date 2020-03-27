#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    
    NSMutableArray *result = [NSMutableArray array];
    //create sequence
    NSMutableArray *fibSeries =  [NSMutableArray array];
    
    [fibSeries addObject:[NSNumber numberWithInt:0]];
    [fibSeries addObject:[NSNumber numberWithInt:1]];
    
    int previousValue = 0;
    int currentValue = 1;
    int nextValue = 0;
    
    do {
        nextValue = previousValue + currentValue;
        [fibSeries addObject:[NSNumber numberWithInt:nextValue]];
        previousValue = currentValue;
        currentValue =nextValue;
        
    } while (nextValue < [number intValue]);
    
    for (int i=1; i < fibSeries.count; i += 1) {
        
        int value = [fibSeries[i] intValue ] * [fibSeries [i - 1] intValue];
        if (value > [number intValue]) {
            [result addObject:fibSeries[i-1]];
            [result addObject:fibSeries[i]];
            
            [result addObject:[NSNumber numberWithInt:0]];
            break;
        } else if (value == [number intValue]) {
            [result addObject:fibSeries[i-1]];
            [result addObject:fibSeries[i]];
            
            [result addObject:[NSNumber numberWithInt:1]];
            break;
        }
        
    }
    
    return result;
}
@end
