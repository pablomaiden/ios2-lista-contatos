//
//  Contato+CoreDataProperties.m
//  Contatos
//
//  Created by Hugo Schneider on 22/09/16.
//  Copyright © 2016 Hugo Schneider. All rights reserved.
//

#import "Contato+CoreDataProperties.h"

@implementation Contato (CoreDataProperties)

+ (NSFetchRequest<Contato *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Contato"];
}

@dynamic nome;
@dynamic sobrenome;
@dynamic endereco;

@end
