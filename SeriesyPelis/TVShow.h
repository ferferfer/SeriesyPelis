//
//  TVShow.h
//  SeriesyPelis
//
//  Created by Fernando Garcia Corrochano on 23/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface TVShow : MTLModel  <MTLJSONSerializing>

@property (copy,nonatomic)NSString *idTVShow;
@property (copy,nonatomic)NSString *desc;
@property (copy,nonatomic)NSString *title;
@property	(assign,nonatomic)CGFloat rating;

- (id)initWithTitle:(NSString *)title;


@end

//BUENA PRACTICA PARA CATEGORIZAR LOS PROTOCOLOS
//@interface TVShow(NSCopying) <NSCopying>

//@end

//@interface TVShow(NSCoding)<NSCoding>

//@end