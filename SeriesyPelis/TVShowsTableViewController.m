//
//  SeriesTableViewController.m
//  SeriesyPelis
//
//  Created by Fernando Garcia Corrochano on 23/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "TVShowsTableViewController.h"
#import "TVShow.h"


static NSString * const savedShowsFileName=@"tvShows.txt";

@interface TVShowsTableViewController ()

@property	(nonatomic,copy)NSMutableArray *tvShowsArray;

@end

@implementation TVShowsTableViewController

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
	
	_tvShowsArray= [[NSMutableArray alloc]init];
	[self loadShows];
	
	if (![self.tvShowsArray count]) {
		TVShow *newShow=[[TVShow alloc]initWithTitle:@"Show 0"];
		[_tvShowsArray insertObject:newShow atIndex:0];
	}
	
}
- (IBAction)addShow:(id)sender {
	
	TVShow *newShow=[[TVShow alloc]init];
	newShow.title=[NSString stringWithFormat:@"Show %i",[self.tvShowsArray count]];
	
	[self.tvShowsArray insertObject:newShow atIndex:[self.tvShowsArray count]];
	[self.tableView reloadData];
}
- (IBAction)saveShow:(id)sender {
	if ([self.tvShowsArray count]) {
    [NSKeyedArchiver archiveRootObject:self.tvShowsArray toFile:[self archivePath]];
	}
}

- (void)loadShows {
	NSArray *shows=[NSKeyedUnarchiver unarchiveObjectWithFile:[self archivePath]];
	if ([shows count]) {
    _tvShowsArray=[shows mutableCopy];
	}
}


- (void)viewDidLoad{
    [super viewDidLoad];

}

-(NSString *)archivePath{
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory=[paths firstObject];
	return [documentsDirectory stringByAppendingPathComponent:savedShowsFileName];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tvShowsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TVShowsCell" forIndexPath:indexPath];

	TVShow *cellShow=[self.tvShowsArray objectAtIndex:indexPath.row];
	
	cell.textLabel.text =cellShow.title;
	cell.backgroundColor=[UIColor orangeColor];

	return cell;
}


//SI PULSO UNA LINEA, SE DUPLICA AL FINAL
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	TVShow *myShow=[self.tvShowsArray objectAtIndex:indexPath.row];
	[self.tvShowsArray insertObject:[myShow copy] atIndex:[self.tvShowsArray count]];
	
	
	//PROBAMOS EL isEqual
	TVShow *firstShow=[self.tvShowsArray objectAtIndex:1];
	if ([firstShow isEqual:[myShow copy]]) {
    NSLog(@"IGUALES! 🐥🐴");
	}else{
    NSLog(@"DISTINTOS! 🐥🐴");
	}
	
	if ([firstShow hash]==[[myShow copy] hash]) {
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
