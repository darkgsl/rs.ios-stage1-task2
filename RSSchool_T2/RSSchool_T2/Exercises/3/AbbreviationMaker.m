#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSMutableString *strForCompare = [NSMutableString new];
    
    NSUInteger count = [a length];
    for (int i = 0; i < count; i += 1) {
        
        NSRange range = NSMakeRange(i, 1);
        
        if (range.location == NSNotFound) {
            NSLog(@"Something is wrong with range");
        }
        

        //make string for compare
        NSString * ch = [[a substringWithRange:range] uppercaseString];
        if ([b containsString:ch]) {
            [strForCompare appendString:ch];
        }

    }
    if ([b isEqualToString:strForCompare]) {
        return @"YES";
    } else {
        return @"NO";
    }

}
@end
