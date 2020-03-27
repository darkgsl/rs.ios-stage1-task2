#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    //make single string
    NSString *str = [NSString stringWithFormat:@"%@-%@-%@", day, month, year];  //@"15-3-2020";
    
    //Take date from string
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd-MM-yyyy";
    
    NSDate *date = [formatter dateFromString:str];
    

    formatter.dateFormat = @"d MMMM, EEEE";
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"ru_Ru"];
    
    //take string from date
    NSString *dateString = [formatter stringFromDate:date];
    if (dateString==nil) {
        return @"Такого дня не существует";
    } else {
        return dateString;
    }

    
}

@end
