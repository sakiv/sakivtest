//
//  MapViewController.h
//  TestApp
//
//  Created by Vikas Aggarwal on 11/7/10.
//  Copyright 2010 Sakiv Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import <mapkit/MKReverseGeocoder.h>

@interface MapViewController : UIViewController <MKReverseGeocoderDelegate, MKMapViewDelegate> {

	MKMapView *mapView;
	MKReverseGeocoder *geoCoder;
	MKPlacemark *placemark;
	IBOutlet UISegmentedControl *mapType;
	
}

- (IBAction) changeType:(id) sender;
- (IBAction) showInfo;

@end
