//
//  SkillCell.h
//  D3
//
//  Created by Shaun Tan on 7/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Skill.h"
@interface SkillCell : UITableViewCell
{
    IBOutlet UILabel* skillName;
    IBOutlet UIImageView* skillImage;
    IBOutlet UILabel* costLine1;
    IBOutlet UILabel* costLine2;
    IBOutlet UILabel* skillType;
    IBOutlet UILabel* levelreq;
    
}
@property (nonatomic,retain) IBOutlet UILabel* levelreq;
@property (nonatomic,retain) IBOutlet UILabel* skillName;
@property (nonatomic,retain) IBOutlet UIImageView* skillImage;
@property (nonatomic,retain) IBOutlet UILabel* costLine1;
@property (nonatomic,retain) IBOutlet UILabel* costLine2;
@property (nonatomic,retain) IBOutlet UILabel* skillType;
@property (nonatomic,retain) Skill* skill;

@end
