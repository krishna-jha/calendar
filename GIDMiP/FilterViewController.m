//
//  FilterViewController.m

//

#import "FilterViewController.h"
#import <CoreData/CoreData.h>
@interface FilterViewController ()

@end

@implementation FilterViewController
@synthesize searchedBar;
@synthesize mainTitle;
@synthesize subTitle;
@synthesize searchResults;
@synthesize shouldReloadOnAppear;


- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.searchResults = [NSMutableArray array];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.searchResults count];
        
    } else {
        return [self.searchResults count];
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [self.searchResults objectAtIndex:indexPath.row];
    }
    
    return cell;
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
}


-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    }


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    NSLog(@"text=%@",searchText);
}


-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar canResignFirstResponder];
}
//- (void)filterProductsForTerm:(NSString *)term {
//    [self.searchResults removeAllObjects];
//    
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    fetchRequest.entity = [Product entityInManagedObjectContext:[self managedObjectContext]];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains[cd] %@ or category.name contains[cd] %@", term, term];
//    fetchRequest.predicate = predicate;
//    
//    NSError *error = nil;
//    NSArray *results = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];
//    if (error) {
//        [NSException raise:NSGenericException format:@"Error filtering for term: %@ -- %@", term, error];
//    }
//    
//    [self.searchResults addObjectsFromArray:results];
//}
@end
