//
//  main.m
//  Workoutz Initializer
//
//  Created by Deus Duke on 8/18/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "Routine.h"

static NSManagedObjectModel *managedObjectModel()
{
    static NSManagedObjectModel *model = nil;
    if (model != nil) {
        return model;
    }
    
    NSString *path = @"WorkoutzModel";
    path = [path stringByDeletingPathExtension];
    NSURL *modelURL = [NSURL fileURLWithPath:[path stringByAppendingPathExtension:@"momd"]];
    model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    return model;
}

static NSManagedObjectContext *managedObjectContext()
{
    static NSManagedObjectContext *context = nil;
    if (context != nil) {
        return context;
    }

    @autoreleasepool {
        context = [[NSManagedObjectContext alloc] init];
        
        NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel()];
        [context setPersistentStoreCoordinator:coordinator];
        
        NSString *STORE_TYPE = NSSQLiteStoreType;
        
        NSString *path = [[NSProcessInfo processInfo] arguments][0];
        path = [path stringByDeletingPathExtension];
        NSURL *url = [NSURL fileURLWithPath:[path stringByAppendingPathExtension:@"sqlite"]];
        
        NSError *error;
        NSPersistentStore *newStore = [coordinator addPersistentStoreWithType:STORE_TYPE configuration:nil URL:url options:nil error:&error];
        
        if (newStore == nil) {
            NSLog(@"Store Configuration Failure %@", ([error localizedDescription] != nil) ? [error localizedDescription] : @"Unknown Error");
        }
    }
    return context;
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // Create the managed object context
        NSManagedObjectContext *context = managedObjectContext();
        
        // Custom code here...
        // Save the managed object context
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Error while saving %@", ([error localizedDescription] != nil) ? [error localizedDescription] : @"Unknown Error");
            exit(1);
        }
        
        // get the routines as json and stuff them in an array
        NSError* err = nil;
        NSString* dataPath = [[NSBundle mainBundle] pathForResource:@"output" ofType:@"json"];
        NSArray* Routines = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:dataPath]
                                                         options:kNilOptions
                                                           error:&err];
//        NSLog(@"Imported Routines: %@", Routines);
        
        // iterate over the array and store to core data
        [Routines enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            Routine *routine = [NSEntityDescription
                                insertNewObjectForEntityForName:@"Routine" inManagedObjectContext:context];
            routine.name = [obj objectForKey:@"name"];
            routine.details = [obj objectForKey:@"descriptionHtml"];
            routine.part = [obj objectForKey:@"targetBodyPart"];
            routine.image = [obj objectForKey:@"imageUrl"];
            
            NSError *error;
            if (![context save:&error]) {
                NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
            }
        }];
        
        // list all the object from the data store
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Routine"
                                                  inManagedObjectContext:context];
        [fetchRequest setEntity:entity];
        NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
        for (Routine *routine in fetchedObjects) {
            NSLog(@"Name: %@", routine.name);
            NSLog(@"Part: %@", routine.part);
        }
    }
    return 0;
}

