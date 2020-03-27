#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {

    NSMutableString *result = [NSMutableString new];
    [result appendFormat:@""];
    
    //String to Int
    int hoursInt = [hours intValue];
    int minutesInt = [minutes intValue];
    
    
//TODO вынести аррээй в отдельный метод
//TODO часы в отдельный массив
//TODO check как выводится 24 formatt
    //fill dictionary with definition
    NSMutableArray *keys = [NSMutableArray array];
    for (int i = 1; i < 31; i += 1) {
        [keys addObject:[NSNumber numberWithInt:i]];
    }
    NSArray *object = @[ @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten", @"eleven", @"twelve", @"thirteen", @"fourteen", @"quarter", @"sixteen", @"seventeen", @"eighteen", @"nineteen", @"twenty", @"twenty one", @"twenty two", @"twenty three", @"twenty four", @"twenty five", @"twenty six", @"twenty seven", @"twenty eight", @"twenty nine", @"half" ];
    
    
    NSDictionary *definition = [NSDictionary dictionaryWithObjects:object forKeys:keys];
    
    
    if (minutesInt == 0) {

        [result appendFormat:@"%@", [definition objectForKey:[NSNumber numberWithInt: hoursInt]]];
        [result appendFormat:@" o' clock"];

    } else if (minutesInt >= 1 && minutesInt <= 30) {
        [result appendFormat:@"%@", [definition objectForKey:[NSNumber numberWithInt: minutesInt]]];
        
        if (minutesInt == 1) {
            [result appendFormat:@" minute past "];
        } else if  (minutesInt == 15 || minutesInt == 30){
            [result appendFormat:@" past "];
        } else {
            [result appendFormat:@" minutes past "];
        }
        [result appendFormat:@"%@", [definition objectForKey:[NSNumber numberWithInt: hoursInt]]];
        

        
    } else if (minutesInt > 30 && minutesInt <= 59) {
        int difference = 60 - minutesInt;
        [result appendFormat:@"%@", [definition objectForKey:[NSNumber numberWithInt: difference]]];
        
            if  (difference == 15 || difference == 30){
                   [result appendFormat:@" to "];
               } else {
                   [result appendFormat:@" minutes to "];
               }
        [result appendFormat:@"%@", [definition objectForKey:[NSNumber numberWithInt: hoursInt + 1]]];
        
    }
    
    
    return result;
}
@end
