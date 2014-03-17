//
//  TBSDatebase.h
//  ToBeStronger
//
//  Created by Zhang Boxuan on 14-3-11.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface TBSDatebase : NSObject


/**
 *  Insert ExerciseContent in Datebase
 *
 *  @param name        name of exercise content, e.g. Push-up
 *  @param position    postion e.g. Chest
 *  @param numberOfSet number of actions per set
 *  @param sets        number of sets
 *  @param date        date with Format "YYYY-MM-DD"
 *  @param finished    YES/NO
 */
- (void)insertExerciseContentWithName:(NSString *)name
                             Position:(NSString *)position
                          NumberOfSet:(NSInteger)numberOfSet
                                 Sets:(NSInteger)sets
                                Weight:(NSInteger)weight
                                 Date:(NSString *)date
                             Finished:(BOOL)finished;

/**
 *  Insert ExerciseContent in Datebase
 *
 *  @param name        name of exercise content, e.g. Push-up
 *  @param position    postion e.g. Chest
 *  @param numberOfSet number of actions per set
 *  @param sets        number of sets
 *  @param date        date with Format "YYYY-MM-DD"
 */
- (void)insertExerciseContentWithName:(NSString *)name
                             Position:(NSString *)position
                          NumberOfSet:(NSInteger)numberOfSet
                                 Sets:(NSInteger)sets
                                Weight:(NSInteger)weight
                                 Date:(NSString *)date;


@end
