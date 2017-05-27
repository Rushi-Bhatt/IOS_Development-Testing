//
//  NSString+FormattingOptions.m
//  FirstApp
//
//  Created by Bhatt, Rushi on 5/24/17.
//  Copyright © 2017 rushi. All rights reserved.
//

#import "NSString+FormattingOptions.h"

@implementation NSString (FormattingOptions)
-(NSString *)convertWhiteSpece{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    
}
@end
