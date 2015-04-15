//
//  HHRequestResult.h
//
//  Copyright 2010 Apple Inc. All rights reserved.
//
#import "ITTBaseModelObject.h"

@interface ITTRequestResult : NSObject

@property (nonatomic,strong) NSNumber *code;
@property (nonatomic,strong) NSString *message;

- (id)initWithCode:(NSNumber*)code withMessage:(NSString*)message withHandleredResult:(NSDictionary*)dic;
- (BOOL)isSuccess;
- (void)showErrorMessage;

@end
