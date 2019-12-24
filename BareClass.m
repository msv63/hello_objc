#import <objc/Object.h>
#import "BareClass.h"

@implementation BareClass

+ (Class)class
{
    return self;
}

+ (Class)superclass
{
    return class_getSuperclass(self);
}

+ (id)allocWithZone:(void *)zone
{
    return class_createInstance(self,0);
}

+ (id)alloc
{
    return [self allocWithZone:NULL];
}

+ (id)new
{
    return [[self alloc] init];
}

- (Class)class
{
    return object_getClass(self);
}

- (Class)superclass
{
    return class_getSuperclass(object_getClass(self));
}

- (id)init
{
    return self;
}

- (id)copy
{
    return [self copyWithZone:NULL];
}

- (id)copyWithZone:(void *)zone
{
    return self;
}

- (id)retain
{
    __sync_fetch_and_add(&refcount,1);
    return self;
}

- (void)release
{
    if (__sync_sub_and_fetch(&refcount, 1) < 0)
	[self dealloc];
}

- (void)dealloc
{
    object_dispose(self);
}

- (BOOL)isKindOfClass:(Class)aClass
{
    Class me = object_getClass(self);

    while (me != nil)
    {
	if (aClass == me)
	    return YES;
	me = class_getSuperclass(me);
    }

    return NO;
}

- (BOOL)isMemberOfClass:(Class)aClass
{
    return (object_getClass(self) == aClass) ? YES : NO;
}

@end
