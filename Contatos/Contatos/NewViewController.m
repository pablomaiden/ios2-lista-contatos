//
//  NewViewController.m
//  Contatos
//
//  Created by Hugo Schneider on 9/8/16.
//  Copyright © 2016 Hugo Schneider. All rights reserved.
//

#import "NewViewController.h"
#import "Contato.h"
#import "UIViewController+CoreData.h"
#import "Address.h"
@import MapKit;

@interface NewViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nomeTextField;
@property (weak, nonatomic) IBOutlet UITextField *sobrenomeTextField;
@property (weak, nonatomic) IBOutlet UITextField *enderecoTextField;
@property (weak, nonatomic) IBOutlet MKMapView *map;

@property CLGeocoder * geocoder;

@property NSMutableArray<Address *> * addresses;
@property NSMutableArray<MKPointAnnotation *> * points;
@property MKPolyline * line;

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if(self.contato) {
         _nomeTextField.text = self.contato.nome;
        _sobrenomeTextField.text = self.contato.sobrenome ;
    }

    _addresses = [NSMutableArray new];
    _points = [NSMutableArray new];

    self.geocoder = [[CLGeocoder alloc] init];

    [_map setUserTrackingMode:MKUserTrackingModeFollow];

    // Do any additional setup after loading the view.
}

- (IBAction)gecode:(id)sender {
    [_map removeAnnotations:_addresses];
    [_addresses removeAllObjects];

[self.geocoder geocodeAddressString:_enderecoTextField.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {

    if(error){
        NSLog(@"%@", error);
        return;
    }

    [placemarks enumerateObjectsUsingBlock:^(CLPlacemark * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        Address * addr = [[Address alloc] initWithPlacemark:obj withTitle:_enderecoTextField.text andWithSubtitle:[NSString stringWithFormat:@"%lu",(unsigned long)idx]];

        [_addresses addObject:addr];
        [self.map addAnnotation:addr];

    }];

}];
}

- (IBAction)salvar:(id)sender {


    if(_nomeTextField.text.length && _sobrenomeTextField.text.length) {
        if(!self.contato) {

self.contato = [NSEntityDescription insertNewObjectForEntityForName:@"Contato" inManagedObjectContext:self.managedObjectContext];

        }

        self.contato.nome = _nomeTextField.text;
        self.contato.sobrenome = _sobrenomeTextField.text;
        self.contato.endereco = _enderecoTextField.text;


        [self performSegueWithIdentifier:@"unwindToMaster" sender:sender];

    } else {
        // TODO - UIAlertController
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MKMapViewDelegate

- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {

    if([annotation isKindOfClass:[Address class]]){
        MKPinAnnotationView * view = [[MKPinAnnotationView alloc ] initWithAnnotation:annotation reuseIdentifier:@"Address"];
        [view setEnabled:YES];
        [view setAnimatesDrop:YES];
        [view setPinTintColor:[UIColor blueColor]];
        [view setRightCalloutAccessoryView:[UIButton buttonWithType:UIButtonTypeInfoLight]];
        [view setCanShowCallout:YES];

        return view;
    }

    return nil;

}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {

    MKPointAnnotation * point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    [_points addObject:point];

    // if(_line){
        [mapView removeOverlay:_line];
    // }

    CLLocationCoordinate2D * coords = malloc([_points count] * sizeof(CLLocationCoordinate2D));

    for (int i = 0; i < [_points count]; i++) {
        coords[i] = _points[i].coordinate;
    }

    _line = [MKPolyline polylineWithCoordinates:coords count:[_points count]];

    free(coords);

    [mapView addOverlay:_line];

}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    if([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolylineRenderer * renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
        [renderer setLineWidth:2];
        [renderer setStrokeColor:[UIColor greenColor]];

        return renderer;
    }

    return nil;
}

/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
