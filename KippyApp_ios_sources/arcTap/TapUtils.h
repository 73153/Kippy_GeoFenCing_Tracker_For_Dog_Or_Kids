//
//  Copyright (c) 2013 Click'nTap SRL. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IS_IOS7   [[UIDevice currentDevice].systemVersion floatValue] >= 7
#define IS_WIDESCREEN (fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON)
#define IS_IPAD       UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
#define IS_RETINA     [[UIScreen mainScreen] respondsToSelector:@selector(scale)] == YES && [[UIScreen mainScreen] scale] == 2.00
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HEXACOLOR(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

@interface TapUtils : NSObject

+(void)showAvailableFonts;
+(NSString*)retina;
+(NSString*)machine;
+(NSString*)date2string:(NSDate*)date format:(NSString*)format locale:(NSString*)locale;
+(NSDate*)string2date:(NSString*)string format:(NSString*)format locale:(NSString*)locale;
+(NSDate*)monday;
+(NSDate*)dateByAddingDays:(NSDate*)date days:(int)n;
+(NSString*)documentDirectory;
+ (NSString*)md5:(NSString*)string;
+(void)playSound:(NSString*)resource ofType:(NSString*)ofType;

@end
