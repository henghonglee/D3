//
//  SkillDetailViewController.m
//  D3
//
//  Created by Shaun Tan on 7/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SkillDetailViewController.h"

@implementation SkillDetailViewController
@synthesize skill;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    skillName.text = skill.skillname;
    skillType.text = skill.skilltype;
    costLine1.text = skill.costline1;
    costLine2.text = skill.costline2;
    levelreq.text = skill.levelstr;
    runeskill1.text = skill.rune1skill;
    runeskill1description.text = skill.rune1skilldetail;
    runeskill2.text = skill.rune2skill;
    runeskill2description.text = skill.rune2skilldetail;
    runeskill3.text = skill.rune3skill;
    runeskill3description.text = skill.rune3skilldetail;
    runeskill4.text = skill.rune4skill;
    runeskill4description.text = skill.rune4skilldetail;
    runeskill5.text = skill.rune5skill;
    runeskill5description.text = skill.rune5skilldetail;
    [skillImage setBackgroundImage:[UIImage imageNamed:skill.imagename] forState:UIControlStateNormal];
    if ([skill.forclass isEqualToString:@"Barbarian"]){
        [header setBackgroundImage:[UIImage imageNamed:@"BBR.png"] forState:UIControlStateNormal];}
    if ([skill.forclass isEqualToString:@"WitchDoctor"]){
        [header setBackgroundImage:[UIImage imageNamed:@"WD.png"] forState:UIControlStateNormal];}
    if ([skill.forclass isEqualToString:@"DemonHunter"]){
        [header setBackgroundImage:[UIImage imageNamed:@"DH.png"] forState:UIControlStateNormal];}
    if ([skill.forclass isEqualToString:@"Wizard"]){
        [header setBackgroundImage:[UIImage imageNamed:@"WZ.png"] forState:UIControlStateNormal];}
    if ([skill.forclass isEqualToString:@"Monk"]){
        [header setBackgroundImage:[UIImage imageNamed:@"MK.png"] forState:UIControlStateNormal];}
    
    skillDescription.text = [skill.skilldescription stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    scroll.contentSize = CGSizeMake(320, 980);
    
    scroll.contentOffset=CGPointMake(0, 0);
}
-(IBAction)Back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
