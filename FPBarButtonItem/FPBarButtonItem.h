//
//  FPBarButtonItem.h
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

#import <UIKit/UIKit.h>

typedef enum {
    FPBarButtonItemStyleBack = 0,
    FPBarButtonItemStyleBordered = 1,
    FPBarButtonItemStyleDone = 2
} FPBarButtonItemStyle;

@interface FPBarButtonItem : UIBarButtonItem

- (id)initWithTitle:(NSString *)title FPstyle:(FPBarButtonItemStyle)style target:(id)target action:(SEL)action;

@end

@interface FPButtonView : UIView

- (id)initWithTitle:(NSString *)title style:(FPBarButtonItemStyle)style;
- (void)setTarget:(id)target action:(SEL)action;

@property (assign, nonatomic) FPBarButtonItemStyle style;
@property (retain, nonatomic) NSString *title;

@end