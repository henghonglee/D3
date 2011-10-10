//
//  Skill.h
//  D3
//
//  Created by Shaun Tan on 9/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Skill : NSManagedObject

@property (nonatomic, retain) NSString * activeorpassive;
@property (nonatomic, retain) NSString * costline1;
@property (nonatomic, retain) NSString * costline2;
@property (nonatomic, retain) NSString * forclass;
@property (nonatomic, retain) NSString * imagename;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSString * levelstr;
@property (nonatomic, retain) NSString * skilldescription;
@property (nonatomic, retain) NSString * skillname;
@property (nonatomic, retain) NSString * skilltype;
@property (nonatomic, retain) NSString * rune1skill;
@property (nonatomic, retain) NSString * rune2skill;
@property (nonatomic, retain) NSString * rune3skill;
@property (nonatomic, retain) NSString * rune4skill;
@property (nonatomic, retain) NSString * rune5skill;
@property (nonatomic, retain) NSString * rune1skilldetail;
@property (nonatomic, retain) NSString * rune2skilldetail;
@property (nonatomic, retain) NSString * rune3skilldetail;
@property (nonatomic, retain) NSString * rune5skilldetail;
@property (nonatomic, retain) NSString * rune4skilldetail;

@end
