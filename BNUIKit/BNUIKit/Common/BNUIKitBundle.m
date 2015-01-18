//
//  BNUIKitBundle.m
//  BNUIKit
//
//  Created by wujianqiang on 15/1/17.
//  Copyright (c) 2015年 wujianqiang. All rights reserved.
//

#import "BNUIKitBundle.h"

@implementation BNUIKitBundle

+ (NSBundle*)resourcesBundle {
    static dispatch_once_t onceToken;
    static NSBundle *myLibraryResourcesBundle = nil;
    dispatch_once(&onceToken, ^{
        NSString *bundleName = NSStringFromClass([self class]);
        myLibraryResourcesBundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:bundleName withExtension:@"bundle"]];
    });
    return myLibraryResourcesBundle;
}

+ (UIImage*)imageNamed:(NSString*)name {
    UIImage *imageFromMainBundle = [UIImage imageNamed:name];
    if (imageFromMainBundle) {
        return imageFromMainBundle;
    }
    
    if (![name hasSuffix:@"png"]) {
        name = [name stringByAppendingString:@"@2x.png"];
    }
    
    NSString *fullPath = [[[[self class] resourcesBundle] resourcePath] stringByAppendingPathComponent:name];
    
    UIImage *imageFromMyLibraryBundle = [UIImage imageWithContentsOfFile:fullPath];
    return imageFromMyLibraryBundle;
}

+ (UINib *)nibWithName:(NSString *)name {
    NSBundle *bundle = [[self class] resourcesBundle];
    UINib *nib = [UINib nibWithNibName:name bundle:bundle];
    return nib;
}

@end
