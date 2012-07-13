//
//  FPBarButtonItem.m
//
//    This file is part of FPBarButtonItem.
//
//    FPBarButtonItem is free software: you can redistribute it and/or modify
//    it under the terms of the GNU Lesser General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    FPBarButtonItem is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU Lesser General Public License for more details.
//
//    You should have received a copy of the GNU Lesser General Public License
//    along with FPBarButtonItem.  If not, see <http://www.gnu.org/licenses/>.
//
//  Created by Arnaud de Mouhy on 02/07/12.
//  Copyright (c) 2012 Flying Pingu. All rights reserved.
//

#import "FPBarButtonItem.h"

@implementation FPBarButtonItem

- (id)initWithTitle:(NSString *)title FPstyle:(FPBarButtonItemStyle)style target:(id)target action:(SEL)action
{
    
    if ([[[UIDevice currentDevice] systemVersion] compare:@"5.0" options:NSNumericSearch] != NSOrderedAscending) {
        
        self = [super init];
        
    } else {
       
        UIBarButtonItemStyle tmpStyle;
        switch (style) {
            case FPBarButtonItemStyleBordered:
                tmpStyle = UIBarButtonItemStyleBordered;
                break;
            case FPBarButtonItemStyleDone:
                tmpStyle = UIBarButtonItemStyleDone;
                break;
            default:
                tmpStyle = UIBarButtonItemStyleBordered;
                break;
        }
        
        self = [super initWithTitle:title style:tmpStyle target:target action:action];
        
    }
    
    if (self) {
        
        if ([[[UIDevice currentDevice] systemVersion] compare:@"5.0" options:NSNumericSearch] != NSOrderedAscending) {
            FPButtonView *customView = [[FPButtonView alloc] initWithTitle:title style:style];
            
            self.customView = customView;
            
            UIButton *actionButton = [[UIButton alloc] initWithFrame:self.customView.frame];
            [actionButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
            
            [self.customView addSubview:actionButton];
            [actionButton release];
        } else {
        
        }
    }
    
    return self;
}

@end



@interface FPButtonView ()
@property (retain, nonatomic) UIButton *button;
@property (retain, nonatomic) UIFont *font;
@end

@implementation FPButtonView

@synthesize style = _style;
@synthesize title = _title;

@synthesize button = _button;
@synthesize font = _font;

- (id)initWithTitle:(NSString *)title style:(FPBarButtonItemStyle)style
{
    self = [super init];
    if (self) {
        
        _font = [UIFont fontWithName: @"HelveticaNeue-Bold" size: 13];
        _title = title;
        _style = style;
        
        self.backgroundColor = [UIColor clearColor];
        
        CGSize size = [_title sizeWithFont:_font constrainedToSize:CGSizeMake(150, 44) lineBreakMode:UILineBreakModeMiddleTruncation];
        self.frame = CGRectMake(0, 0, 12 + size.width + 12, 44);
        
        _button = [[UIButton alloc] initWithFrame:self.bounds];
        [self addSubview:_button];
    }
    return self;
}

- (void)setTarget:(id)target action:(SEL)action
{
    [_button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor *color;
    if (_style == FPBarButtonItemStyleDone) {
        color = [UIColor colorWithRed: 1 green: 0.88 blue: 0 alpha: 1];
    } else {
        color = [UIColor colorWithWhite:.8f alpha:1.0];
    }
    
    //// Frames
    CGRect frame = rect;
    
    //// Abstracted Graphic Attributes
    NSString* titleContent = _title;
    UIFont* titleFont = _font;
    
    if (_style == FPBarButtonItemStyleBack) {
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 8, CGRectGetWidth(frame) - 12, CGRectGetHeight(frame) - 16) byRoundingCorners: UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii: CGSizeMake(4, 4)];
        [color setFill];
        [roundedRectanglePath fill];
        
        
        
        //// Arrow Drawing
        UIBezierPath* arrowPath = [UIBezierPath bezierPath];
        [arrowPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 0.18 * CGRectGetHeight(frame))];
        [arrowPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0, CGRectGetMinY(frame) + 0.51 * CGRectGetHeight(frame))];
        [arrowPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 0.82 * CGRectGetHeight(frame))];
        [arrowPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 0.18 * CGRectGetHeight(frame))];
        [arrowPath closePath];
        [color setFill];
        [arrowPath fill];
        
        
        
        //// Title Drawing
        CGRect titleRect = CGRectMake(CGRectGetMinX(frame) + 6, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 19) * 0.52), floor((CGRectGetWidth(frame) - 6) * 1), 19);
        [[UIColor blackColor] setFill];
        [titleContent drawInRect: titleRect withFont: titleFont lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    } else if (_style == FPBarButtonItemStyleDone || _style == FPBarButtonItemStyleBordered) {

        //// button Drawing
        UIBezierPath* buttonPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame) + 0, CGRectGetMinY(frame) + 8, CGRectGetWidth(frame) - 0, CGRectGetHeight(frame) - 16) cornerRadius: 4];
        [color setFill];
        [buttonPath fill];
        
        
        
        //// Title Drawing
        CGRect titleRect = CGRectMake(CGRectGetMinX(frame) + 5, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 19) * 0.56), floor((CGRectGetWidth(frame) - 5) * 0.93), 19);
        [[UIColor blackColor] setFill];
        [titleContent drawInRect: titleRect withFont: titleFont lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
        

    }
}

- (void)dealloc
{
    [self.title release];
    [self.backgroundColor release];
    [self.button release];
    [self.font release];
    
    [super dealloc];
}

@end