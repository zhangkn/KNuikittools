#include <objc/runtime.h>
#include <Foundation/Foundation.h>

@interface MIFileManager
+ (MIFileManager *) defaultManager;
- (NSURL *) destinationOfSymbolicLinkAtURL:(NSURL *)url error:(NSError *)error;
@end

static Class $MIFileManager;

static NSArray *(*_MIFileManager$urlsForItemsInDirectoryAtURL$ignoringSymlinks$error$)(MIFileManager *self, SEL _cmd, NSURL *url, BOOL ignoring, NSError *error);

static NSArray *$MIFileManager$urlsForItemsInDirectoryAtURL$ignoringSymlinks$error$(MIFileManager *self, SEL _cmd, NSURL *url, BOOL ignoring, NSError *error) {
    MIFileManager *manager(reinterpret_cast<MIFileManager *>([$MIFileManager defaultManager]));
    if (NSURL *destiny = [manager destinationOfSymbolicLinkAtURL:url error:NULL])
        url = destiny;
    return _MIFileManager$urlsForItemsInDirectoryAtURL$ignoringSymlinks$error$(self, _cmd, url, NO, error);
}

__attribute__((__constructor__))
static void initialize() {
    $MIFileManager = objc_getClass("MIFileManager");
    SEL sel(@selector(urlsForItemsInDirectoryAtURL:ignoringSymlinks:error:));
    Method method(class_getInstanceMethod($MIFileManager, sel));
    _MIFileManager$urlsForItemsInDirectoryAtURL$ignoringSymlinks$error$ = reinterpret_cast<NSArray *(*)(MIFileManager *, SEL, NSURL *, BOOL, NSError *)>(method_getImplementation(method));
    method_setImplementation(method, reinterpret_cast<IMP>(&$MIFileManager$urlsForItemsInDirectoryAtURL$ignoringSymlinks$error$));
}