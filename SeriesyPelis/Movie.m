//
//  Movie.m
//  SeriesyPelis
//
//  Created by Fernando Garcia Corrochano on 23/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "Movie.h"

@interface Movie ()

@end

@implementation Movie


- (id)init{
	return [self initWithTitle:@"Movie"];
}

- (id)initWithTitle:(NSString *)title{
	self = [super init];
	if (self) {
		self.title=title;
	}
	return self;
}


@end


//IMPLEMENTACION DE LAS CATEGORIAS
@implementation Movie(NSCopying)

-(id)copyWithZone:(NSZone *)zone{
	
	Movie *movieCopy=[[[self class] allocWithZone:zone]init];
	
	if (movieCopy){
		//Objects
		movieCopy.title=[self.title copyWithZone:zone];
		movieCopy.idMovie=[self.idMovie copyWithZone:zone];
		movieCopy.description=[self.description copyWithZone:zone];
		
		//scalars
		movieCopy.rating=self.rating;
		
	}
	return movieCopy;
}



@end

@implementation Movie(NSCoding)

-(void)encodeWithCoder:(NSCoder *)aCoder{
	[aCoder encodeObject:self.title forKey:@"title"];
	[aCoder encodeObject:self.idMovie forKey:@"idMovie"];
	[aCoder encodeObject:self.description forKey:@"desc"];
	[aCoder encodeObject:self.rating forKey:@"rating"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
	
}

@end
