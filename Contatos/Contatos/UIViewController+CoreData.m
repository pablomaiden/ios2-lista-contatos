//
//  UIViewController+CoreData.m
//  Contatos
//
//  Created by Hugo Schneider on 9/8/16.
//  Copyright © 2016 Hugo Schneider. All rights reserved.
//

#import "UIViewController+CoreData.h"
#import "AppDelegate.h"

@implementation UIViewController (CoreData)

-(NSManagedObjectContext *)managedObjectContext {
    AppDelegate * delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return delegate.managedObjectContext;
}

@end
