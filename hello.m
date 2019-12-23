#import <stdio.h>
#import <objc/Object.h>
#import "BareClass.h"

@interface Hello : BareClass
{
    char hello[16];
}

- (void)sayHello;

@end

@implementation Hello

- (id)init
{
    if (self = [super init])
    {
	*(uint64_t *)&hello[0] = *(uint64_t *)"Hello, ";
	*(uint64_t *)&hello[7] = *(uint64_t *)"World!!";
    }
    return self;
}

- (void)sayHello
{
    puts(hello);
}

@end

int main()
{
    Hello *hey = [Hello new];
    [hey sayHello];
    [hey release];
    return 0;
}
