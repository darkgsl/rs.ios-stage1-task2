#import "NSString+Transform.h"


@implementation NSString (Transform)

-(NSString*)transform {
    
    //create set for alphabet characters
    NSMutableArray *resultArray = [NSMutableArray array];
    NSMutableSet *alphabetSet = [NSMutableSet new];
    
    
    NSMutableCharacterSet *characterSet = [NSMutableCharacterSet new];
    [characterSet formUnionWithCharacterSet:NSCharacterSet.lowercaseLetterCharacterSet];
    [characterSet formUnionWithCharacterSet:NSCharacterSet.uppercaseLetterCharacterSet];
    
    
    NSMutableCharacterSet *vowelsSet = [NSMutableCharacterSet new];
    [vowelsSet addCharactersInString:@"aeiouyAEIOUY"];
    
    NSMutableCharacterSet *consonantsSet = [NSMutableCharacterSet new];
    [consonantsSet formUnionWithCharacterSet:NSCharacterSet.lowercaseLetterCharacterSet];
    [consonantsSet formUnionWithCharacterSet:NSCharacterSet.uppercaseLetterCharacterSet];
    [consonantsSet removeCharactersInString:@"aeiouyAEIOUY"];
    
    //consonants
    
    NSString *testString = self;
    
    
    //check isPangram
    //add to set only alphabet
    BOOL isPangram = NO;
    
    NSUInteger length = [testString length];
    for (int i = 0; i < length ; i += 1) {
        
        NSRange range = NSMakeRange(i, 1);
        
        if (range.location != NSNotFound) {
            NSString * str = [[testString substringWithRange:range] lowercaseString];
            unichar ch = [str characterAtIndex:0];
            
            if ([characterSet characterIsMember:ch]) {
                [alphabetSet addObject:str];
            }
        }
    }
    if (alphabetSet.count == 26)
        isPangram = true;
    
    //convert string to Array
    NSArray *array = [testString componentsSeparatedByString:@" "];
    
//TODO
   // if (isPangram) {
        for (NSString *str in array) {
            int countVowels = 0;
            NSMutableString * resultStr  = [NSMutableString new];
            for (int i = 0; i < [str length]; i += 1) {
                
                NSRange rangeCh =  NSMakeRange(i, 1);
                NSString * ch = [str substringWithRange:rangeCh];
                
                NSRange range;
                if (isPangram) {
                    range =  [ch rangeOfCharacterFromSet:vowelsSet];
                } else {
                    range =  [ch rangeOfCharacterFromSet:consonantsSet];
                }
                if (range.location != NSNotFound) {
                    countVowels += 1;
                    [resultStr appendString:[ch uppercaseString]];

                } else {
                    [resultStr appendString:ch];
                }
            }
            
            if (resultStr.length != 0) {
                
                [resultStr insertString:[NSString stringWithFormat:@"%i", countVowels]  atIndex:0];
                [resultArray addObject:resultStr];
            }
        }
//    } else {
//        //isPangram == false
//        for (NSString *str in array) {
//            int countConsonants = 0;
//            NSMutableString * resultStr  = [NSMutableString new];
//            for (int i = 0; i < [str length]; i += 1) {
//
//                NSRange rangeCh =  NSMakeRange(i, 1);
//                NSString * ch = [str substringWithRange:rangeCh];
//
//                NSRange range =   [ch rangeOfCharacterFromSet:consonantsSet];
//                if (range.location != NSNotFound) {
//                    countConsonants += 1;
//                    [resultStr appendString:[ch uppercaseString]];
//
//                } else {
//                    [resultStr appendString:ch];
//                }
//            }
//
//            if (resultStr.length != 0) {
//                [resultStr insertString:[NSString stringWithFormat:@"%i", countConsonants]  atIndex:0];
//                [resultArray addObject:resultStr];
//            }
//        }
//
//    }
    //sort array
    [resultArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *str1 = (NSString *) obj1;
        NSString *str2 = (NSString *) obj2;
        
        NSRange range = NSMakeRange(0,1);
        int str1Value = [[str1 substringWithRange:range] intValue];
        int str2Value = [[str2 substringWithRange:range] intValue];
        
        
        if (str1Value < str2Value)
            return NSOrderedAscending;
        else if (str1Value > str2Value)
            return NSOrderedDescending;
        else
            return NSOrderedSame;
    }];
    
    return [resultArray componentsJoinedByString:@" "];
}


@end
