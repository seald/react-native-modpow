#import "Modpow.h"

@implementation Modpow

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_EXPORT_BLOCKING_SYNCHRONOUS_METHOD(modPow:(NSDictionary *)values) {
    JKBigInteger *target = [[JKBigInteger alloc] initWithString:values[@"target"] andRadix:16];
    JKBigInteger *value = [[JKBigInteger alloc] initWithString:values[@"value"] andRadix:16];
    JKBigInteger *modifier = [[JKBigInteger alloc] initWithString:values[@"modifier"] andRadix:16];
    JKBigInteger *result = [target pow:value andMod:modifier];

    if (result) {
        return [result stringValueWithRadix:16];
    } else {
        return @[RCTMakeError(@"computeModPow error", nil, nil)];
    }
}

@end
