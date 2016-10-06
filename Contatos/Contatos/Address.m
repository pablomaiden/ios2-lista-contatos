//
//  Address.m
//  Contatos
//
//  Created by Hugo Schneider on 29/09/16.
//  Copyright © 2016 Hugo Schneider. All rights reserved.
//

#import "Address.h"

@implementation Address
-(instancetype)initWithPlacemark:(CLPlacemark *)location withTitle:(NSString *)title andWithSubtitle:(NSString *)subtitle {
    self = [super init];
    if(self){
        _placemark = location;
        _title = title;
        _subtitle = subtitle;
    }
    return self;
}
-(CLLocationCoordinate2D)coordinate {
    return [[_placemark location] coordinate];
}

@end
