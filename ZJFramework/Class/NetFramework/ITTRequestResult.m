//
//  HHRequestResult
//
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "ITTRequestResult.h"


@implementation ITTRequestResult
///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

-(id)initWithCode:(NSNumber*)code withMessage:(NSString*)message withHandleredResult:(NSDictionary*)dic
{
    self = [super init];
    if (self) {
        _code = @([code integerValue]);
        _message = message;
        if ([_code isEqualToNumber:@(101)]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:WM_NOTIFACATION_UPDATA object:dic];
        }
    }
    return self;
}

-(BOOL)isSuccess
{
    return (_code && [_code intValue] == 0);
}

-(void)showErrorMessage
{
    if (_message && _message.length > 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:_message
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
}

@end