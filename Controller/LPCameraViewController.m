//
//  LPCameraViewController.m
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import "LPCameraViewController.h"
#import "LPFilterViewController.h"
#import <AVFoundation/AVFoundation.h>

@implementation LPCameraViewController {
  UIImage *_capturedImage;
  AVCaptureVideoPreviewLayer *_previewLayer;
}

AVCaptureSession *session;
AVCaptureStillImageOutput *stillImageOutput;

- (BOOL)prefersStatusBarHidden {
  return YES;
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  [self initializeCamera];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)initializeCamera {
  if (session == nil) {
    session = [[AVCaptureSession alloc] init];
  }

  [session setSessionPreset:AVCaptureSessionPresetPhoto];

  NSError *error;
  AVCaptureDevice *inputDevice =
      [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
  AVCaptureDeviceInput *deviceInput =
      [AVCaptureDeviceInput deviceInputWithDevice:inputDevice error:&error];

  if ([session canAddInput:deviceInput]) {
    [session addInput:deviceInput];
  }

  [self setupLayers];

  [self startVideoSession];
}

- (void)setupLayers {
  _previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
  [_previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];

  CALayer *rootLayer = [[self view] layer];
  [rootLayer setMasksToBounds:YES];
  CGRect frame = self.videoPreview.frame;

  [_previewLayer setFrame:frame];

  [rootLayer insertSublayer:_previewLayer atIndex:0];
}

- (void)startVideoSession {
  if (stillImageOutput == nil) {
    stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc]
        initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [stillImageOutput setOutputSettings:outputSettings];
    [session addOutput:stillImageOutput];
  }

  [session startRunning];
}

- (AVCaptureConnection *)getVideoConnection {
  AVCaptureConnection *videoConnection = nil;

  for (AVCaptureConnection *connection in stillImageOutput.connections) {
    for (AVCaptureInputPort *port in [connection inputPorts]) {
      if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
        videoConnection = connection;
        break;
      }
    }

    if (videoConnection) {
      break;
    }
  }

  return videoConnection;
}

- (IBAction)takePhoto:(id)sender {
  AVCaptureConnection *videoConnection = [self getVideoConnection];

  [stillImageOutput
      captureStillImageAsynchronouslyFromConnection:videoConnection
                                  completionHandler:^(
                                      CMSampleBufferRef imageDataSampleBuffer,
                                      NSError *error) {
                                    if (imageDataSampleBuffer != NULL) {
                                      NSData *jpegData =
                                          [AVCaptureStillImageOutput
                                              jpegStillImageNSDataRepresentation:
                                                  imageDataSampleBuffer];
                                      UIImage *takenImage =
                                          [UIImage imageWithData:jpegData];

                                      CGRect outputRect = [_previewLayer
                                          metadataOutputRectOfInterestForRect:
                                              _previewLayer.bounds];
                                      CGImageRef takenCGImage =
                                          takenImage.CGImage;
                                      size_t width =
                                          CGImageGetWidth(takenCGImage);
                                      size_t height =
                                          CGImageGetHeight(takenCGImage);
                                      CGRect cropRect = CGRectMake(
                                          outputRect.origin.x * width,
                                          outputRect.origin.y * height,
                                          outputRect.size.width * width,
                                          outputRect.size.height * height);

                                      CGImageRef cropCGImage =
                                          CGImageCreateWithImageInRect(
                                              takenCGImage, cropRect);
                                      _capturedImage = [UIImage
                                          imageWithCGImage:cropCGImage
                                                     scale:1
                                               orientation:
                                                   takenImage.imageOrientation];
                                      CGImageRelease(cropCGImage);

                                      [self performSegueWithIdentifier:@"Filter"
                                                                sender:self];
                                    }
                                    [session stopRunning];
                                  }];
}

- (IBAction)closeCamera:(id)sender {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"Filter"]) {
    LPFilterViewController *filterViewController =
        segue.destinationViewController;
    [filterViewController setPreviewImage:_capturedImage];
  }
}

@end
