#if __PTR_WIDTH__ == 32
    #pragma pack(4)
#else
    #pragma pack(8)
#endif

__attribute__((objc_root_class))
@interface BareClass
{
    Class isa;
    int refcount;
}

+ (Class)class;
+ (Class)superclass;
+ (id)allocWithZone:(void *)zone;
+ (id)alloc;
+ (id)new;

- (Class)class;
- (Class)superclass;

- (id)init;
- (id)copy;
- (id)copyWithZone:(void *)zone;

- (id)retain;
- (void)release;
- (void)dealloc;

- (BOOL)isKindOfClass:(Class)aClass;
- (BOOL)isMemberOfClass:(Class)aClass;

@end
