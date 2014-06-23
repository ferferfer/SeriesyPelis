//
//  Movie.h
//  SeriesyPelis
//
//  Created by Fernando Garcia Corrochano on 23/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (copy,nonatomic)NSString *idMovie;
@property (copy,nonatomic)NSString *description;
@property (copy,nonatomic)NSString *title;
@property	(assign,nonatomic)CGFloat rating;

- (id)initWithTitle:(NSString *)title;

@end


//BUENA PRACTICA PARA CATEGORIZAR LOS PROTOCOLOS
@interface Movie(NSCopying) <NSCopying>

@end

@interface Movie(NSCoding)<NSCoding>

@end