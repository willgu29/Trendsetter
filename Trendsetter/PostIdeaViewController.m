//
//  PostIdeaViewController.m
//  Trendsetter
//
//  Created by William Gu on 11/8/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import "PostIdeaViewController.h"

@interface PostIdeaViewController ()

@property (nonatomic, weak) IBOutlet UITextView *textView;
@property (nonatomic, weak) IBOutlet UILabel *headlineLabel;
@property (nonatomic, weak) IBOutlet UILabel *randomInspirationalText;

@end

@implementation PostIdeaViewController

-(IBAction)addDetails:(UIButton *)sender
{
    
}

-(IBAction)changeHeadline:(UIButton *)sender
{
    if (sender.tag == 0)
    {
        _headlineLabel.text = @"How about we...";
        sender.tag = 1;
    }
    else if (sender.tag == 1)
    {
        _headlineLabel.text = @"Can we...";
        sender.tag = 2;
    }
    else if (sender.tag == 2)
    {
        _headlineLabel.text = @"What if...";
        sender.tag = 0;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

-(void)viewWillAppear:(BOOL)animated
{
    //TODO:
    //random textview holder text
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBACTIONS

-(IBAction)backButton:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)postButton:(UIButton *)sender
{
    //TODO: Post
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    textView.text = @"";
    textView.textColor = [UIColor blackColor];
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""])
    {
        textView.textColor = [UIColor lightGrayColor];
        textView.text = @"What is your new idea?";
    }
}

-(void)resignKeyboard
{
    NSLog(@"Resign keyboard");
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self resignKeyboard];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
