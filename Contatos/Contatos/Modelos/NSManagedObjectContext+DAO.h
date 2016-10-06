//
//  NSManagedObjectContext+DAO.h
//  Contatos
//
//  Created by Hugo Schneider on 9/1/16.
//  Copyright © 2016 Hugo Schneider. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Contato.h"
@interface NSManagedObjectContext (DAO)

-(NSArray<Contato *> *) todosContatos;

@end
