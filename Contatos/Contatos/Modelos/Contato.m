//
//  Contato.m
//  Contatos
//
//  Created by Hugo Schneider on 9/1/16.
//  Copyright © 2016 Hugo Schneider. All rights reserved.
//

#import "Contato.h"

@implementation Contato

-(NSString *)nomeCompleto {
    return [NSString stringWithFormat:@"%@ %@",self.nome, self.sobrenome];
}


// Insert code here to add functionality to your managed object subclass

@end
