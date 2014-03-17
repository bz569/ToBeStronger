//
//  TBSDatebase.m
//  ToBeStronger
//
//  Created by Zhang Boxuan on 14-3-11.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import "TBSDatebase.h"

@interface TBSDatebase ()

@property (nonatomic) sqlite3 *db;

@end

@implementation TBSDatebase

#define DBNAME    @"tbs_database.sqlite"

//Define the column name of ExerciseContent Table
#define TABLE_NAME_EXERCISE_CONTENT @"ExerciseContent"
#define COLUMN_NAME_EXERCISE_CONTEN_ID @"id"
#define COLUMN_NAME_EXERCISE_CONTEN_NAME @"name"
#define COLUMN_NAME_EXERCISE_CONTEN_POSITION @"position"
#define COLUMN_NAME_EXERCISE_CONTEN_NUMBER_PER_SET @"numberPerSet"
#define COLUMN_NAME_EXERCISE_CONTEN_SETS @"sets"
#define COLUMN_NAME_EXERCISE_CONTEN_WEIGHT @"weight"
#define COLUMN_NAME_EXERCISE_CONTEN_DATE @"date"
#define COLUMN_NAME_EXERCISE_CONTEN_COUNTING_METHOD @"countingMethod"
#define COLUMN_NAME_EXERCISE_CONTEN_FINISHED @"finished"

//Define the column name of IntervalTimes Table
#define TABLE_NAME_INTERVAL_TIMES @"IntervalTimes"
#define COLUMN_NAME_INTERVAL_TIMES_ID @"id"
#define COLUMN_NAME_INTERVAL_TIMES_NO @"No"
#define COLUMN_NAME_INTERVAL_TIMES_TIME @"time"
#define COLUMN_NAME_INTERVAL_TIMES_OFCONTENT @"ofContent"

//Define the column name of RestTimes Table
#define TABLE_NAME_REST_TIMES @"RestTimes"
#define COLUMN_NAME_REST_TIMES_ID @"id"
#define COLUMN_NAME_REST_TIMES_OFCONTENT @"ofContent"
#define COLUMN_NAME_REST_TIMES_NO @"No"
#define COLUMN_NAME_REST_TIMES_TIME @"time"


/**
 *  Open the datebase file, if not exists, create one
 */
- (instancetype)init
{
    self = [super init];
    sqlite3 *dbHandle;
    //Open datebase
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent:DBNAME];
    
    if (sqlite3_open([database_path UTF8String], &dbHandle) != SQLITE_OK)
    {
        sqlite3_close(dbHandle);
        NSLog(@"数据库打开失败");
    }
    
    self.db = dbHandle;
    [self createTables];
    
    return self;
}

- (void) createTables
{
    //Create Exercise Conetent Table
    NSString *sqlToCreateECTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ INTEGER, %@ INTEGER, %@ INTEGER, %@ TEXT, %@ TEXT, %@ BOOL)", TABLE_NAME_EXERCISE_CONTENT, COLUMN_NAME_EXERCISE_CONTEN_ID, COLUMN_NAME_EXERCISE_CONTEN_NAME, COLUMN_NAME_EXERCISE_CONTEN_POSITION, COLUMN_NAME_EXERCISE_CONTEN_NUMBER_PER_SET, COLUMN_NAME_EXERCISE_CONTEN_SETS, COLUMN_NAME_EXERCISE_CONTEN_WEIGHT, COLUMN_NAME_EXERCISE_CONTEN_DATE, COLUMN_NAME_EXERCISE_CONTEN_COUNTING_METHOD, COLUMN_NAME_EXERCISE_CONTEN_FINISHED];
    NSLog(@"sqlToCreateECTable=%@", sqlToCreateECTable);
    
    [self execSql:sqlToCreateECTable];
    
    //Create Inverval Times Table
    NSString *sqlToCreateITTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER PRIMARY KEY AUTOINCREMENT, %@ INTEGER, %@ INTEGER, %@ TEXT, FOREIGN KEY (%@) REFERENCES %@ (%@))", TABLE_NAME_INTERVAL_TIMES, COLUMN_NAME_INTERVAL_TIMES_ID, COLUMN_NAME_INTERVAL_TIMES_OFCONTENT, COLUMN_NAME_INTERVAL_TIMES_NO, COLUMN_NAME_INTERVAL_TIMES_TIME, COLUMN_NAME_INTERVAL_TIMES_OFCONTENT, TABLE_NAME_EXERCISE_CONTENT, COLUMN_NAME_EXERCISE_CONTEN_ID];
    NSLog(@"sqlToCrrateITTable=%@", sqlToCreateITTable);
    
    [self execSql:sqlToCreateITTable];
    
    //Create Rest Times Table
    
    NSString *sqlToCreateRTTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER PRIMARY KEY AUTOINCREMENT, %@ INTEGER, %@ INTEGER, %@ TEXT, FOREIGN KEY (%@) REFERENCES %@ (%@))", TABLE_NAME_REST_TIMES, COLUMN_NAME_REST_TIMES_ID, COLUMN_NAME_REST_TIMES_OFCONTENT, COLUMN_NAME_REST_TIMES_NO, COLUMN_NAME_REST_TIMES_TIME, COLUMN_NAME_REST_TIMES_OFCONTENT, TABLE_NAME_EXERCISE_CONTENT, COLUMN_NAME_EXERCISE_CONTEN_ID];
    NSLog(@"sqlToCreateRTTable=%@", sqlToCreateRTTable);
    
    [self execSql:sqlToCreateRTTable];
    
}

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
                       CountingMethod:(NSString *)countingMethod
                             Finished:(BOOL)finished
{
    
    NSString *sqlToInsertECRecord = [NSString stringWithFormat:@"INSERT INTO '%@' ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@') VALUES ('%@', '%@', %d, %d, %d, '%@', %@, %d)"               ,TABLE_NAME_EXERCISE_CONTENT, COLUMN_NAME_EXERCISE_CONTEN_NAME, COLUMN_NAME_EXERCISE_CONTEN_POSITION, COLUMN_NAME_EXERCISE_CONTEN_NUMBER_PER_SET, COLUMN_NAME_EXERCISE_CONTEN_SETS, COLUMN_NAME_EXERCISE_CONTEN_WEIGHT, COLUMN_NAME_EXERCISE_CONTEN_DATE, COLUMN_NAME_EXERCISE_CONTEN_COUNTING_METHOD, COLUMN_NAME_EXERCISE_CONTEN_FINISHED, name, position, numberOfSet, sets, weight, date, countingMethod, finished];
    NSLog(@"sqlToInsertECRecord=%@", sqlToInsertECRecord);
    
}

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
                                 Date:(NSString *)date
                       CountingMethod:(NSString *)countingMethod
{
    [self insertExerciseContentWithName:name
                               Position:position NumberOfSet:numberOfSet
                                   Sets:sets
                                  Weight:weight
                                   Date:date
                         CountingMethod:countingMethod
                               Finished:NO];
}


- (void)execSql:(NSString *)sql
{
    char *err;
    if (sqlite3_exec(self.db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK)
    {
        NSLog(@"database error:%s", err);
    }
}



@end
