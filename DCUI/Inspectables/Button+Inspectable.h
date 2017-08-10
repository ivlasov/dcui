//
//  Button+Inspectable.h
//  MPLibrary
//
//  Created by Igor Danich on 12.08.16.
//  Copyright © 2016 dclife. All rights reserved.
//

#import <MPUI/MPUI.h>

@interface Button (Inspectable)
@property(nonatomic,strong) IBInspectable NSString* localizedTitle;
@property(nonatomic,strong) IBInspectable UIColor*  color;
@property(nonatomic,strong) IBInspectable UIColor*  highlightedColor;
@property(nonatomic,strong) IBInspectable UIColor*  selectedColor;
@property(nonatomic,strong) IBInspectable UIColor*  disabledColor;
@end
