//
//  main.m
//  TapMe
//
//  Created by Juan Jesús Izquierdo Doménech on 31/01/13.
//  Copyright (c) 2013 Juan Jesús Izquierdo Doménech. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "tapAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([tapAppDelegate class]));
    }
}

// From here to end of file added by Injection Plugin //

#ifdef DEBUG
static char _inMainFilePath[] = __FILE__;
static const char *_inIPAddresses[] = {"127.0.0.1", "192.168.1.11", NULL};

#define INJECTION_ENABLED
#import "/Users/juanjesusizquierdodomenech/Library/Application Support/Developer/Shared/Xcode/Plug-ins/InjectionPlugin.xcplugin/Contents/Resources/BundleInjection.h"
#endif
