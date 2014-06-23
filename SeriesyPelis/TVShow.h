//
//  TVShow.h
//  SeriesyPelis
//
//  Created by Fernando Garcia Corrochano on 23/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TVShow : NSObject

@property (copy,nonatomic)NSString *idTVShow;
@property (copy,nonatomic)NSString *description;
@property (copy,nonatomic)NSString *title;
@property	(assign,nonatomic)CGFloat rating;

- (id)initWithTitle:(NSString *)title;

@end

//BUENA PRACTICA PARA CATEGORIZAR LOS PROTOCOLOS
@interface TVShow(NSCopying) <NSCopying>

@end

@interface TVShow(NSCoding)<NSCoding>

@end