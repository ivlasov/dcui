//
//  UIView+Extensions.h
//  MPLibrary
//
//  Created by Igor Danich on 12.08.16.
//  Copyright © 2016 dclife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (InspectableExtensions)
@property(nonatomic,strong) IBInspectable NSString* identifier;
@property(nonatomic,assign) IBInspectable CGFloat   cornerRadius;
@property(nonatomic,strong) IBInspectable UIColor*  borderColor;
@property(nonatomic,assign) IBInspectable CGFloat   borderWidth;
@end
