//
//  TVShow.m
//  SeriesyPelis
//
//  Created by Fernando Garcia Corrochano on 23/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "TVShow.h"

@interface TVShow ()

@end


@implementation TVShow

- (id)init{
	return [self initWithTitle:@"TVShow"];
}

- (id)initWithTitle:(NSString *)title{
	self = [super init];
	if (self) {
		self.title=title;
	}
	return self;
}


//-(BOOL)isEqual:(id)object{
//	if(self==object){
//		return YES;
//	}
//	if(![object isKindOfClass:[self class]]){
//		return NO;
//	}
//	return [self isEqualToTVShows:(TVShow *)object];
//}
//
//-(BOOL)isEqualToTVShows:(TVShow *)show{
//	if(self.title == show.title){
//		return YES;
//	}
//	return NO;
//}
//
//-(NSUInteger)hash{
//	return	[self.title hash];
//}
//
//@end
//
//
//@implementation TVShow(NSCopying)
//
//
//-(id)copyWithZone:(NSZone *)zone{
//	
//	TVShow *tvShowCopy=[[[self class] allocWithZone:zone]init];
//	
//	if (tvShowCopy){
//		//Objects
//		tvShowCopy.title=[self.title copyWithZone:zone];
//		tvShowCopy.idTVShow=[self.idTVShow copyWithZone:zone];
//		tvShowCopy.desc=[self.desc copyWithZone:zone];
//		
//		//scalars
//		tvShowCopy.rating=self.rating;
//	}
//	
//	return tvShowCopy;
//}
//
//@end
//
//
//@implementation TVShow(NSCoding)
//
//-(void)encodeWithCoder:(NSCoder *)aCoder{
//	[aCoder encodeObject:self.idTVShow forKey:@"idTVShow"];
//	if(self.title) [aCoder encodeObject:self.title forKey:@"title"];
//	if(self.desc)[aCoder encodeObject:self.desc forKey:@"desc"];
//	//COMPRUEBO SI ES DOUBLE O FLOAT PARA LOS DISPOSITIVOS DE 64Bits
//	NSNumber *ratingNumber=CGFLOAT_IS_DOUBLE?[NSNumber numberWithDouble:self.rating]:[NSNumber numberWithFloat:self.rating];
//	[aCoder encodeObject:ratingNumber forKey:@"rating"];
//}
//
//-(id)initWithCoder:(NSCoder *)aDecoder{
//	self = [super init];
//	if(self){
//		self.idTVShow=[aDecoder decodeObjectForKey:@"idTVShow"];
//		self.title=[aDecoder decodeObjectForKey:@"title"];
//		self.desc=[aDecoder decodeObjectForKey:@"desc"];
//		//COMPRUEBO SI ES DOUBLE O FLOAT PARA LOS DISPOSITIVOS DE 64Bits
//		NSNumber *ratingNumber=[aDecoder decodeObjectForKey:@"rating"];
//		self.rating=CGFLOAT_IS_DOUBLE?[ratingNumber floatValue]:[ratingNumber doubleValue];
//	}
//	return self;
//}

@end