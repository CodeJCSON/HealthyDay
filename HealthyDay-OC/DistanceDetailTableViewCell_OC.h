//
//  DistanceDetailTableViewCell_OC.h
//  HealthyDay
//
//  Created by Linsw on 16/11/21.
//  Copyright © 2016年 Linsw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Define.h"

@interface DistanceDetailTableViewCell_OC : UITableViewCell

@property (nonatomic) NSDate *date;
@property (nonatomic) double distance;
@property (nonatomic) int duration;
@property (nonatomic) int durationPerKilometer;

@end
