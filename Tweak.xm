/*
This is a simple crack for a pre-release version of Musiex.

How it works:
Musiex checked a plist that was downloaded from its website for the valid UDIDs and then compared them to the device's UDID. 
This works by checking for the device UDID in the -[NSArray containsObject:] method and returns YES if it is the (hard-coded) device UDID. 

*/

%hook NSArray
-(BOOL)containsObject:(id)object
{
    if ([object isKindOfClass:[NSString class]]) // Verify that it's a string (helps with speed and pointless comparisons)
    {
        if ([object isEqual:@"886cd2e8fb8e082cb78095ec2103de4763212b73"] /* Put your device UDID there */)
        {
            NSLog(@"Cracking Musiex!");
            return YES;
        }
    }
    return %orig;
}
%end