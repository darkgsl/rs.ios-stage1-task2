#import "Blocks.h"

@implementation Blocks

- (instancetype) init {
    self = [super init];
    if (self) {
        
        self.blockA = ^(NSArray * array) {
            self.arr = [NSArray arrayWithArray:array];
        };
        
        self.blockB = ^(Class class) {
            
            NSMutableArray *commonArray =  [NSMutableArray new];
            //make common array
            for (NSObject *myObject in self.arr) {
                if ([myObject isKindOfClass:class]) {
                    [commonArray addObject:myObject];
                }
            }
            
            if ([[class description] isEqualToString:@"NSString"]) {
                
                self.blockC([commonArray componentsJoinedByString:@""]);
                
            } else if ([[class description] isEqualToString:@"NSNumber"]) {
                int sum = 0;
                for (NSNumber *num in commonArray) {
                    sum += [num intValue];
                }
                self.blockC( [NSNumber numberWithInt:sum]);
                
            } else if ([[class description] isEqualToString:@"NSDate"]) {
                 
                NSDate *laterDate = [commonArray firstObject];
                for (NSDate *date in commonArray) {
                    if ([laterDate laterDate:date] != laterDate) {
                        laterDate = date;
                    }
                }
                
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"dd.MM.yyyy";
                
                self.blockC( [formatter stringFromDate:laterDate]);
            }
        };


        self.blockC = ^(NSObject  *result){
            
        };
    }
    return self;
}


@end

