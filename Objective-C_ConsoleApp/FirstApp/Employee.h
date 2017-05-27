//
//  Employee.h
//  FirstApp
//
//  Created by Bhatt, Rushi on 5/23/17.
//  Copyright © 2017 rushi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocol1.h"

@interface Employee : NSObject <Protocol1>

@property NSString *name;
@property NSDate *hireDate;
@property int eid;
@property (readonly) NSDecimalNumber *salary;



//methods
-(void) someMethod;
//Method with one parameter
-(int) timesTen: (int) number;
//Method with multiple parameter
-(int) addNumber: (int) a toNumber:(int) b;

//custom initilizers
-(id)initWithEid:(int)num;

@end
