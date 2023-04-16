//
//  LPHomeViewController.m
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import "LPHomeViewController.h"
#import "LPCustomTableViewCell.h"
#import "LPItemDetailViewController.h"
#import "LPPhoto.h"
#import "LPPhotoFetcher.h"
#import <UIImageView+UIActivityIndicatorForSDWebImage.h>

static NSString *const kSimpleTableIdentifier = @"LPCustomTableViewCell";
static NSInteger const kCellRowHeight = 320;

@interface LPHomeViewController ()

@property(assign, nonatomic) CATransform3D initialTransformation;
@property(strong, nonatomic) NSMutableSet *shownIndexes;

@end

@implementation LPHomeViewController {
  NSArray *_photos;
  LPPhoto *_selectedPhoto;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  if ([[self tableView] respondsToSelector:@selector(setSeparatorInset:)]) {
    [[self tableView] setSeparatorInset:UIEdgeInsetsZero];
  }

  [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.97
                                                                green:0.97
                                                                 blue:0.97
                                                                alpha:1]];

  // _photos = [LPPhotoFetcher getLatestPhotosWithLimit:(NSInteger *)[@20
  // integerValue]];

  UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
  [refreshControl addTarget:self
                     action:@selector(refresh:)
           forControlEvents:UIControlEventValueChanged];
  [self setRefreshControl:refreshControl];

  [self setupCardAnimation];
}

- (void)viewWillAppear:(BOOL)animated {
  _photos =
      [LPPhotoFetcher getLatestPhotosWithLimit:(NSInteger *)[@20 integerValue]];
}

- (void)refresh:(id)sender {
  NSLog(@"Refreshing");

  // End Refreshing
  [(UIRefreshControl *)sender endRefreshing];
}

- (void)setupCardAnimation {
  CGFloat rotationAngleDegrees = -15;
  CGFloat rotationAngleRadians = rotationAngleDegrees * (M_PI / 180);
  CGPoint offsetPositioning = CGPointMake(-20, -20);
  CATransform3D transform = CATransform3DIdentity;
  transform =
      CATransform3DRotate(transform, rotationAngleRadians, 0.0, 0.0, 1.0);
  transform = CATransform3DTranslate(transform, offsetPositioning.x,
                                     offsetPositioning.y, 0.0);
  _initialTransformation = transform;
  _shownIndexes = [NSMutableSet set];
}

- (void)performCardAnimation:(UIView *)card {
  card.layer.transform = self.initialTransformation;
  card.layer.opacity = 0.2;

  [UIView animateWithDuration:0.6
                   animations:^{
                     card.layer.transform = CATransform3DIdentity;
                     card.layer.opacity = 1;
                   }];
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return [_photos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  LPCustomTableViewCell *cell = (LPCustomTableViewCell *)[tableView
      dequeueReusableCellWithIdentifier:kSimpleTableIdentifier];

  if (cell == nil) {
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:kSimpleTableIdentifier
                                                 owner:self
                                               options:nil];
    cell = [nib objectAtIndex:0];
  }

  LPPhoto *photo = _photos[indexPath.row];
  cell.usernameLabel.text = photo.username;
  cell.timeLabel.text = photo.timeAgo;
  [cell.bgImageView setImageWithURL:[NSURL URLWithString:photo.photoURI]
                   placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]
        usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
  [cell.rating setValue:photo.rating];

  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return kCellRowHeight;
}

- (void)tableView:(UITableView *)tableView
      willDisplayCell:(UITableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (![self.shownIndexes containsObject:indexPath]) {
    [self.shownIndexes addObject:indexPath];
    [self performCardAnimation:[(LPCustomTableViewCell *)cell contentView]];
  }
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  _selectedPhoto = _photos[indexPath.row];

  if (_selectedPhoto != nil) {
    [self performSegueWithIdentifier:@"ItemDetail" sender:nil];
  }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"ItemDetail"]) {
    LPItemDetailViewController *itemDetailViewController =
        segue.destinationViewController;
    [itemDetailViewController setPhoto:_selectedPhoto];
  }
}

@end
