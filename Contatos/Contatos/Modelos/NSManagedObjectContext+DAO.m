//
//  NSManagedObjectContext+DAO.m
//  Contatos
//
//  Created by Hugo Schneider on 9/1/16.
//  Copyright © 2016 Hugo Schneider. All rights reserved.
//

#import "NSManagedObjectContext+DAO.h"

@implementation NSManagedObjectContext (DAO)

-(NSArray<Contato *> *) todosContatos {
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Contato"];
    return [self executeFetchRequest:request error:nil];

}

@end
