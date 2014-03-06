//
//  TourMapViewController.m
//  LearnUCI
//
//  Created by Richard Lee on 3/2/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import "TourMapViewController.h"
#import "LocationPoint.h"
#import "UIAlertViewController.h"

@interface TourMapViewController ()

@end

@implementation TourMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView.showsUserLocation = NO;
    
    //manually set location to middle of UCI
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(33.645, -117.842), 1650, 1650);
    [self.mapView setRegion:region animated:YES];
    self.mapView.mapType = MKMapTypeHybrid;
    self.mapView.delegate = self;
    //set to -1 since we increment it in the method
    self.currLocationIndex = -1;
    
    [self getAndSetNextAnnotation];
    
}

- (void)getAndSetNextAnnotation {
    self.currLocationIndex += 1;
    if (self.currLocationIndex >= self.tourPoints.count) {
        //no more points to show, exit.
        _alertVC =[[UIAlertViewController alloc] init];
        _alertVC.caller = self;
        if(_tourPoints.count > 1){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tour Finished"
                                                            message:@"The Tour has finished, to exit press the Close Map button, or to stay on the map click Return to Map."
                                                           delegate:_alertVC
                                                  cancelButtonTitle:@"Return to Map"
                                                  otherButtonTitles:@"Close Map", nil];
            //message.tag = [UIAlertViewController NEXT_POINT_ALERT];
            alert.tag = 1;
            [alert show];
        }
        self.currLocationIndex -= 1;
        return;
    }
    MKPointAnnotation* annotation = [[MKPointAnnotation alloc]init];
    LocationPoint* lp = _tourPoints[self.currLocationIndex];
    CLLocationCoordinate2D lpCord = CLLocationCoordinate2DMake(lp.latitude, lp.longitude);
    
    annotation.coordinate = lpCord;
    annotation.title = lp.abbreviation;
    annotation.subtitle = lp.name;
    
    if (self.currAnnotation != NULL){
        [self.mapView removeAnnotation:_currAnnotation];
    }
    [self.mapView addAnnotation:annotation];
    [self.mapView selectAnnotation:annotation animated:YES];
    self.currAnnotation = annotation;
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        static NSString *AnnotationIdentifier = @"CustomPinAnnotation";
        MKAnnotationView *view = (MKAnnotationView *)[_mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
        if (!view)
        {
            MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                                            reuseIdentifier:AnnotationIdentifier];
            annotationView.canShowCallout = YES;
            // Add a detail disclosure button to the callout.
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self action:@selector(showDescriptionForAnnotation:)
                  forControlEvents:UIControlEventTouchUpInside];
            annotationView.rightCalloutAccessoryView = rightButton;
            // Add an image to the left callout.
            LocationPoint* lp = _tourPoints[self.currLocationIndex];
            UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:lp.image scale:3.5f]];
            annotationView.leftCalloutAccessoryView = iconView;
            return annotationView;
        }
        else
        {
            view.annotation = annotation;
        }
        return view;
    }
    return nil;
}

- (void)showDescriptionForAnnotation:(id)sender
{
    NSString* buttonText = @"Ok, go to next point.";
    if (_tourPoints.count == 1) {
        buttonText = @"Ok";
    }
    LocationPoint* lp = _tourPoints[self.currLocationIndex];
    _alertVC = [[UIAlertViewController alloc] init];
    _alertVC.caller = self;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:lp.name
                                                      message:lp.description
                                                     delegate:_alertVC
                                            cancelButtonTitle:buttonText
                                            otherButtonTitles:nil];
    alert.tag = 0;
    [alert show];
    
}


//USE THIS TO CHECK USER PROXIMITY TO LOCATION LATER
//-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
//    [self.mapView setCenterCoordinate:userLocation.coordinate animated:YES];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
