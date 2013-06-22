//
//  main.m
//  sleepdisplay
//
//  Created by Joshua Luongo on 23/06/13.
//

#import <Foundation/Foundation.h>
#include <CoreFoundation/CoreFoundation.h>
#include <IOKit/IOKitLib.h>
int display_sleep(void);

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        if (display_sleep() == 1)
        {
            printf("Uh oh something has gone wrong!\n");
        }
        
    }
    return 0;
}

/* Returns 0 on success and 1 on failure. */
int display_sleep(void)
{
    io_registry_entry_t reg = IORegistryEntryFromPath(kIOMasterPortDefault, "IOService:/IOResources/IODisplayWrangler");
    if (reg) {
        IORegistryEntrySetCFProperty(reg, CFSTR("IORequestIdle"), kCFBooleanTrue);
        IOObjectRelease(reg);
    } else {
        return 1;
    }
    return 0;
}
