    //
//  MapViewController.m
//  TestApp
//
//  Created by Vikas Aggarwal on 11/7/10.
//  Copyright 2010 Sakiv Inc. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

//@synthesize mapView;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSLog(@"Enter viewDidLoad");
	
    [super viewDidLoad];
	
	mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
	mapView.showsUserLocation = TRUE;
	mapView.mapType = MKMapTypeSatellite;
	mapView.delegate = self;
//	mapView.zoomEnabled = TRUE;
//	mapView.autoresizesSubviews = TRUE;
	
	/*Region and Zoom*/
	[self setCurrentLocation:mapView.userLocation.location];
	
//	[mapView regionThatFits:region];
//	[self.view insertSubview:mapView atIndex:0];
	
	NSLog(@"Exit viewDidLoad");	
}

//SetCurrentLocation
//Zooms in the mapView on the user's current location
- (void)setCurrentLocation:(CLLocation *)location {

	MKCoordinateRegion region = {{0.0f, 0.0f}, {0.0f, 0.0f}};
	MKCoordinateSpan span;
	span.latitudeDelta = 0.2f;
	span.longitudeDelta = 0.2f;
	 
	CLLocationCoordinate2D coordinate = mapView.userLocation.location.coordinate;
	
//	coordinate.latitude = 40.814849;
//	coordinate.longitude = -73.622732;
	
	NSLog(@"Coordinate:%f", coordinate);
	 
	region.span = span;
	region.center = coordinate;
	 
	NSLog(@"Region:%f", region);
	NSLog(@"region.center.latitude:%f", region.center.latitude);
	NSLog(@"region.center.longitude:%f", region.center.longitude);	 
	
	/*Geocoder Stuff*/
	geoCoder = [[MKReverseGeocoder alloc] initWithCoordinate:coordinate];
	geoCoder.delegate = self;
	[geoCoder start];
	
	[mapView setRegion:region animated:YES];
	
	//[mapView setRegion:MKCoordinateRegionMake([location coordinate], MKCoordinateSpanMake(.015f, .015f)) animated:YES];
}
//END SetCurrentLocation

- (IBAction)showInfo {
//	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
//	controller.delegate = self;
//	
//	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//	[self presentModalViewController:controller animated:YES];
//	
//	[controller release];
	
}

- (IBAction)changeType:(id)sender {
	
	switch (mapType.selectedSegmentIndex) {
		case 1:
			mapView.mapType = MKMapTypeSatellite;
			break;
		case 2:
			mapView.mapType = MKMapTypeHybrid;
			break;
		default:
			mapView.mapType = MKMapTypeStandard;
			break;
	}
	
	//[mapView setMapType:mapView.mapType];
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error{
	NSLog(@"Reverse GeoCoder Error Occured.");
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)localPlacemark{
	NSLog(@"Reverse GeoCoder Completed.");
	placemark = localPlacemark;
	[mapView addAnnotation:placemark];
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation{
	MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
	annView.animatesDrop=TRUE;
	return annView;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
