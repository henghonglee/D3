//
//  SkillDetailViewController.h
//  D3
//
//  Created by Shaun Tan on 7/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "skill.h"
@interface SkillDetailViewController : UIViewController
{
    IBOutlet UILabel* skillName;
    IBOutlet UIButton* skillImage;
    IBOutlet UIButton* header;
    
    IBOutlet UILabel* costLine1;
    IBOutlet UILabel* costLine2;
    IBOutlet UILabel* skillType;
    IBOutlet UILabel* levelreq;
    IBOutlet UIScrollView* scroll;
    IBOutlet UITextView* skillDescription;
    IBOutlet UILabel* runeskill1;
    IBOutlet UITextView* runeskill1description;
    IBOutlet UILabel* runeskill2;
    IBOutlet UITextView* runeskill2description;
    IBOutlet UILabel* runeskill3;
    IBOutlet UITextView* runeskill3description;
    IBOutlet UILabel* runeskill4;
    IBOutlet UITextView* runeskill4description;
    IBOutlet UILabel* runeskill5;
    IBOutlet UITextView* runeskill5description;


}
-(IBAction)Back:(id)sender; 
@property (nonatomic,retain) Skill* skill;
@end
