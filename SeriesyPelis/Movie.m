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
		movieCopy.desc=[self.desc copyWithZone:zone];
		
		//scalars
		movieCopy.rating=self.rating;
		
	}
	return movieCopy;
}

-(BOOL)isEqual:(id)object{
	if(self==object){
		return YES;
	}
	if(![object isKindOfClass:[self class]]){
		return NO;
	}
	return [self isEqualToTVShows:(Movie *)object];
}

-(BOOL)isEqualToTVShows:(Movie *)movie{
	if(self.title == movie.title){
		return YES;
	}
	return NO;
}

-(NSUInteger)hash{
	return	[self.title hash];
}


@end

@implementation Movie(NSCoding)

-(void)encodeWithCoder:(NSCoder *)aCoder{
	[aCoder encodeObject:self.idMovie forKey:@"idMovie"];
	if(self.title) [aCoder encodeObject:self.title forKey:@"title"];
	if(self.desc)[aCoder encodeObject:self.desc forKey:@"desc"];
	//COMPRUEBO SI ES DOUBLE O FLOAT PARA LOS DISPOSITIVOS DE 64Bits
	NSNumber *ratingNumber=CGFLOAT_IS_DOUBLE?[NSNumber numberWithDouble:self.rating]:[NSNumber numberWithFloat:self.rating];
	[aCoder encodeObject:ratingNumber forKey:@"rating"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
	self = [super init];
	if(self){
		self.idMovie=[aDecoder decodeObjectForKey:@"idMovie"];
		self.title=[aDecoder decodeObjectForKey:@"title"];
		self.desc=[aDecoder decodeObjectForKey:@"desc"];
		//COMPRUEBO SI ES DOUBLE O FLOAT PARA LOS DISPOSITIVOS DE 64Bits
		NSNumber *ratingNumber=[aDecoder decodeObjectForKey:@"rating"];
		self.rating=CGFLOAT_IS_DOUBLE?[ratingNumber floatValue]:[ratingNumber doubleValue];
	}
	return self;
}

@end
