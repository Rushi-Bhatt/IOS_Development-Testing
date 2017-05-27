//
//  main.m
//  FirstApp
//
//  Created by Bhatt, Rushi on 5/23/17.
//  Copyright © 2017 rushi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "NSString+FormattingOptions.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a=5;
        
        // insert code here...
        NSLog(@"Hello, World! %i",a);
        NSString *message = @"Whats up";
        NSString *newMessage = [message uppercaseString]; //instance method
        NSLog(@"The new message is %@",newMessage);
        
        NSDate *today = [NSDate date]; //class method
        NSLog(@"the date is %@",today);
        
        //creating object using alloc/init
        NSDate *date1 = [[NSDate alloc]init];
        
        //Specialised init
        NSDate *date2 = [[NSDate alloc] initWithTimeIntervalSince1970:22222];
        
        //Convenient methods
        NSDate *date3  = [NSDate date];
        
        //specialised Convenient mehthods
        NSDate *date4 = [NSDate dateWithTimeIntervalSince1970:2222];
        
        NSLog(@"The dates are %@ \n %@ \n %@ \n %@ \n",date1,date2,date3,date4);
        
        //Same for string
        //Using alloc/init way
        NSString *name = @"Rushi";
        NSString *str1 = [[NSString alloc]initWithFormat:@"the value is %@",name];
        
        //using convenient way
        //NSString *str2 = [NSString stringWithFormat:@"%The value is %@",name];
        
        NSLog(@"The strings are %@",str1);
        
        NSDate *today1 = [NSDate date];
        Employee *emp = [[Employee alloc]init]; //Normal Init
        NSLog(@"%@ %@ %i",[emp name],[emp hireDate],[emp eid]);
        
        Employee *emp1 = [[Employee alloc]initWithEid:200]; //customised Init
        NSLog(@"%@ %@ %i",[emp1 name],[emp1 hireDate],[emp1 eid]);
        
        [emp someMethod];
        [emp setName:@"Rushi"];
        [emp setHireDate:today1];
        [emp setEid:12];
    
        NSLog(@"%@ %@ %i",[emp name],[emp hireDate],[emp eid]);
        
        //description method  - customized
        NSLog(@"customized description method ::%@",emp);
        
        int times10 = [emp timesTen:10];
        NSLog(@"the result is: %i",times10);
        
        int addTo = [emp addNumber:12 toNumber:12];
        NSLog(@"the result is: %i",addTo);
        
        //Arrays and collections in  Objective C
        NSDate *myDate = [NSDate date];
        //Multiple types stored in the same array
        
        //long way
        NSArray *myArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",myDate, nil];
        NSLog(@"the element is %@",[myArray objectAtIndex:2]);
       
        //short way - //same function but different syntax
        NSArray *myArray1 = @[@"1",@"2",@"3",myDate];
        NSLog(@"the element is %@",myArray1[2]);
        
        
        
        //Mutable arrays - to add/remove elements - No short way, just long way is available
        NSMutableArray *myMutableArray = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",myDate, nil];
        NSString *newElem = @"NewlyAdded";
        
        [myMutableArray addObject:newElem];
        [myMutableArray removeObjectAtIndex:2];
        NSLog(@"the element is %@",myArray[2]);
        NSLog(@"the element is %@",myArray[5]);
        
        //Dictionaries in Objective C
        //Long way
        NSDictionary *myDict = [[NSDictionary alloc]initWithObjectsAndKeys:@"Florida",@"Fl",@"Arizona",@"Az",@"California",@"Ca",nil];  //commas and nil
        NSLog(@"The element is %@",[myDict objectForKey:@"Ca"]);
        
        //Shorter version
        NSDictionary *myDict1 = @{@"Az":@"Arizona",@"Ca":@"California",@"Fl":@"Florida"}; //semicolon and no nil
        NSLog(@"The element is %@",myDict1[@"Ca"]);
        
        //Mutable dictionaries
        NSMutableDictionary *myDict2 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"Florida",@"Fl",@"Arizona",@"Az",@"California",@"Ca",nil];  //commas and nil
        [myDict2 setObject:@"NorthCarolina" forKey:@"Nc"];
        NSLog(@"The element is %@",[myDict2 objectForKey:@"Nc"]);
        [myDict2 removeObjectForKey:@"Az"];
        NSLog(@"The element is %@",[myDict2 objectForKey:@"Az"]);

        //Fast enumeration using the forin loop
        NSFileManager *fm = [[NSFileManager alloc]init];
        NSString *path = @"/System/Library/Sounds";
        NSArray *files = [fm subpathsAtPath:path];
        
        for (NSString *fileName in files) {
            NSLog(@"%@ \t", fileName);
        }
        
        //Had we used dictionary, we would have gotten all the keys using  forin
        
        //File management
        NSFileManager *fileManager = [[NSFileManager alloc]init];
        NSString *filePath = @"/Users/rubhatt/Downloads/Site_POCs.docx";
        if([fileManager fileExistsAtPath:filePath]){
            NSLog(@"File Exist");
            NSDictionary *fileInfo = [fileManager attributesOfItemAtPath:filePath error:nil];
            for (NSString *key in fileInfo) {
                NSLog(@"%@ -----> %@",key,fileInfo[key]);
            }
        }
        else{
            NSLog(@"File Doesnt Exist");
            return 1;
        }
        
        //home directory
        NSString *home = NSHomeDirectory();
        NSLog(@"The home directory:%@",home);
        
        //desktop path
        //Mehtod 1 - not recommended
        NSString *desktop1 = [home stringByAppendingString:@"/Desktop"];
        NSLog(@"The desktop directory:%@",desktop1);
        //Method 2 -Recommended
        NSString *desktop = [home stringByAppendingPathComponent:@"Desktop"];
        NSLog(@"The desktop directory:%@",desktop);
        
        
        //Document directory URL
        NSURL *docDirectory = [fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        NSLog(@"The document directory:%@",docDirectory);
        
        //Read the content of file into a string
        //The file is located at documents/simple.odt
        NSURL *doc = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        
        //Reach to the file from document
        NSURL *file = [doc URLByAppendingPathComponent:@"simple.txt"];
        
        //load the file into the string
        if([[NSFileManager defaultManager] fileExistsAtPath:[file path]])
        {
            NSLog(@"The file exists");
            NSMutableString *fileContent  = [[NSMutableString alloc]initWithContentsOfURL:file encoding:NSUTF8StringEncoding error:nil];
            NSLog(@"the file content ---> %@",fileContent);
            
             //Write the content to the file
            [fileContent appendString:@"Newly Added Content to the file"];
            NSURL *newFile = [doc URLByAppendingPathComponent:@"newSimple.txt"];
            [fileContent writeToURL:newFile atomically:YES encoding:NSUTF8StringEncoding error:nil];
            NSLog(@"Write Complete..check newSimple.txt");
            
        }
        else
        {
            NSLog(@"File Doesnt Exist");
            return 1;
        }
        
        //Category - Adding new method to NSString class
        NSString *mess = @"I am Khan and I am a terrorist";
        NSString *newMess= [mess convertWhiteSpece];
        NSLog(@"%@", newMess);
       
        //Extension - Adding private properties to the class
        Employee *emp3 = [[Employee alloc]init];
        NSLog(@"%@",emp3.salary);//You can make it readonly in order to just read the value
        
        //emp3.salary = [NSDecimalNumber decimalNumberWithString:@"200.23"]; not possible because of the private property salary
     
        
        //Dynamic typing using id type object
        NSMutableArray *ary = [[NSMutableArray alloc]init];
        NSString *str = @"My name is Rushi";
        NSDate *dte = [NSDate date];
        
        for (int i=0; i<100; i++) {
            if(i%2==0){
                [ary addObject:str];
            }
            else{
                [ary addObject:dte];            }
        }
        
        for (id eachElem in ary) { //Note here that id is always a pointer so we dont need to give * before the eachElem
//            if([eachElem isKindOfClass:[NSString class]]){
//                NSLog(@"%@", [eachElem uppercaseString]);
//                
//            }
            //Same thing as above, but rather than checking the class, lets check if the object responds to the method or not. Because it might be possible that the same method is present in multiple classes, so at that time, we ll have to check for all the classes
            
            if ([eachElem respondsToSelector:@selector(uppercaseString)]) {
                NSLog(@"%@", [eachElem uppercaseString]);
            }
            else{
                NSLog(@"Doesnt respond to uppercaseString");
                
            }
            
        }
        
        }
    return 0;
}
