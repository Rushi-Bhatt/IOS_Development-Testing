//
//  Employee.m
//  FirstApp
//
//  Created by Bhatt, Rushi on 5/23/17.
//  Copyright © 2017 rushi. All rights reserved.
//

#import "Employee.h"
#import "Employee_Salary.h"

@implementation Employee

//dealloc method - will be called authomatically after ARC, you can customize it though
- (void)dealloc
{
    NSLog(@"The dealloc method called authomatically bvy ARC");
}

//Custom initializer for employee class
//- (id)init
//{
//    self = [super init];
//    if (self) {
//        //custom init
//        _name = @"Rushi";
//        _hireDate = [NSDate date];
//        _eid = 01;
//    }
//    return self;
//}

//We can optimize the code by reducing the same code
- (id)init
{
   
    self = [self initWithEid:01];
    return self;
}

//Cusotm initializer, has to be defined in the .h file
- (id)initWithEid:(int) empId
{
    self = [super init];
    if (self) {
        //custom init
        _name = @"Rushi";
        _hireDate = [NSDate date];
        _eid = empId;
    }
    return self;
}


-(NSString*) description{
    
    return @"The employee information";
}

-(void)someMethod{
    NSLog(@"Hellow world");
}

-(int)timesTen:(int)number{
    return number*10;
}

-(int)addNumber:(int)a toNumber:(int)b{
    return a+b;
}


//To confirm to the protocol Protocol1, we need to implement atleast the required methods of protocol1, else will show error
-(BOOL)emptyTrash{
    NSLog(@"Trash done");
    return 1;
}
-(void)cleanFloor{

    NSLog(@"Floor cleaned");
}

@end
