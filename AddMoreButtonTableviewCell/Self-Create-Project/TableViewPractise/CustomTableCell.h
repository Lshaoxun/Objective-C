//
//  CustomTableCell.h
//  TableViewPractise
//
//  Created by Cao Lei on 24/10/15.
//  Copyright © 2015 Cao Lei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSCMoreOptionTableViewCell.h"

//@interface CustomTableCell:UITableViewCell
@interface CustomTableCell:MSCMoreOptionTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end