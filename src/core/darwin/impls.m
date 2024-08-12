#import <Foundation/Foundation.h>

#if TARGET_OS_OSX
#import <AppKit/AppKit.h>
#else
#import <UIKit/UIKit.h>
#endif

// TODO: consider namespacing our implementations?
@interface AppDelegate : NSObject
@end

#if TARGET_OS_OSX
@interface AppDelegate () <NSApplicationDelegate>
#else
@interface AppDelegate () <UIApplicationDelegate>
#endif
@end

@implementation AppDelegate {
    dispatch_block_t _runBlock;
}

- (void)setRunBlock:(dispatch_block_t)runBlock __attribute__((objc_direct)) {
    _runBlock = runBlock;
}

#if TARGET_OS_OSX
- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    if (self->_runBlock) dispatch_async(dispatch_get_main_queue(), self->_runBlock);
}
#else
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
    if (self->_runBlock) dispatch_async(dispatch_get_main_queue(), self->_runBlock);
    return YES;
}
#endif

@end

