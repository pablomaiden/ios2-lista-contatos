//
//  UIViewController+CoreData.h
//  Contatos
//
//  Created by Hugo Schneider on 9/8/16.
//  Copyright © 2016 Hugo Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CoreData)

@property (readonly) NSManagedObjectContext * managedObjectContext;

@end
