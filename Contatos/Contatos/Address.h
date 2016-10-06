//
//  Address.h
//  Contatos
//
//  Created by Hugo Schneider on 29/09/16.
//  Copyright © 2016 Hugo Schneider. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface Address : NSObject <MKAnnotation>

-(nonnull instancetype) initWithPlacemark:(CLPlacemark *) location withTitle:(nonnull NSString *) title andWithSubtitle:(nonnull NSString *) subtitle;

@property (nullable, readonly) CLPlacemark * placemark;

@property (nonatomic, readonly, copy, nonnull) NSString *title;
@property (nonatomic, readonly, copy, nullable) NSString *subtitle;

@end
