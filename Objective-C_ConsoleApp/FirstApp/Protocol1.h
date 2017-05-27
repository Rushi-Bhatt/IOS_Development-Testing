//
//  Protocol1.h
//  FirstApp
//
//  Created by Bhatt, Rushi on 5/24/17.
//  Copyright © 2017 rushi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Protocol1 <NSObject>
@required
-(void) cleanFloor;
-(BOOL) emptyTrash;
@optional
-(void) cleanWindow;

@end
