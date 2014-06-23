//
//  PelisTableViewController.m
//  SeriesyPelis
//
//  Created by Fernando Garcia Corrochano on 23/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "MoviesTableViewController.h"
#import "Movie.h"
#import <Mantle/Mantle.h>

static NSString * const savedMoviesFileName=@"movies.txt";

@interface MoviesTableViewController ()

@property	(nonatomic,copy)NSMutableArray *moviesArray;

@end

@implementation MoviesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
	self = [super initWithStyle:style];
	if (self) {
		[self customInit];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self customInit];
	}
	return self;
}

- (void)customInit{
	
	_moviesArray= [[NSMutableArray alloc]init];
	[self loadMovies];
	
	if (![self.moviesArray count]) {
		Movie *newMovie=[[Movie alloc]init];
		newMovie.title=@"Movie 0";
		[_moviesArray addObject:newMovie];
	}
	
}
- (void)viewDidLoad
{
    [super viewDidLoad];
  
}

-(NSString *)archivePath{
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory=[paths firstObject];
	return [documentsDirectory stringByAppendingPathComponent:savedMoviesFileName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    return [self.moviesArray count];
}
- (IBAction)addMovie:(id)sender {
	
	Movie *newMovie=[[Movie alloc]init];
	newMovie.title=[NSString stringWithFormat:@"Movie %i",[self.moviesArray count]];
	
	[self.moviesArray insertObject:newMovie atIndex:[self.moviesArray count]];
		[self.tableView reloadData];
}

- (IBAction)saveMovie:(id)sender {
	if ([self.moviesArray count]) {
    [NSKeyedArchiver archiveRootObject:self.moviesArray toFile:[self archivePath]];
	}
}

- (void)loadMovies {
	NSArray *movies=[NSKeyedUnarchiver unarchiveObjectWithFile:[self archivePath]];
	if ([movies count]) {
    _moviesArray=[movies mutableCopy];
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    
	
		Movie *cellMovie=[self.moviesArray objectAtIndex:indexPath.row];
	
		cell.textLabel.text =cellMovie.title;
		cell.backgroundColor=[UIColor greenColor];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	Movie *myMovie=[self.moviesArray objectAtIndex:indexPath.row];
	Movie *copiedMovie=[myMovie copy];
	[self.moviesArray insertObject:copiedMovie atIndex:[self.moviesArray count]];
	
	//PROBAMOS EL isEqual
	Movie *firstMovie=[self.moviesArray objectAtIndex:1];
	if ([firstMovie isEqual:copiedMovie]) {
    NSLog(@"IGUALES! 🐥🐴");
	}else{
    NSLog(@"DISTINTOS! 🐥🐴");
	}
	
	if ([firstMovie hash]==[copiedMovie hash]) {
		NSLog(@"SAME HASH! 🐥🐴");
	}else{
		NSLog(@"DISTINT HASH! 🐥🐴");
	}
	
	
	[self.tableView reloadData];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
