
#import <UIKit/UIKit.h>

#define SUPPORTS_UNDOCUMENTED_API	0

@interface UIColor (UIColor_Expanded)
@property (nonatomic, readonly) CGColorSpaceModel colorSpaceModel;
@property (nonatomic, readonly) BOOL canProvideRGBComponents;
@property (nonatomic, readonly) CGFloat red; 
@property (nonatomic, readonly) CGFloat green;
@property (nonatomic, readonly) CGFloat blue;
@property (nonatomic, readonly) CGFloat white;
@property (nonatomic, readonly) CGFloat alpha;
@property (nonatomic, readonly) UInt32 rgbHex;

-(NSString *)colorSpaceString;

-(NSArray *)arrayFromRGBAComponents;

-(BOOL)red:(CGFloat *)r green:(CGFloat *)g blue:(CGFloat *)b alpha:(CGFloat *)a;

-(UIColor *)colorByLuminanceMapping;
 
-(UIColor *)colorByMultiplyingByRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
-(UIColor *)       colorByAddingRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
-(UIColor *) colorByLighteningToRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
-(UIColor *)  colorByDarkeningToRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

-(UIColor *)colorByMultiplyingBy:(CGFloat)f;
-(UIColor *)       colorByAdding:(CGFloat)f;
-(UIColor *) colorByLighteningTo:(CGFloat)f;
-(UIColor *)  colorByDarkeningTo:(CGFloat)f;

-(UIColor *)colorByMultiplyingByColor:(UIColor *)color;
-(UIColor *)       colorByAddingColor:(UIColor *)color;
-(UIColor *) colorByLighteningToColor:(UIColor *)color;
-(UIColor *)  colorByDarkeningToColor:(UIColor *)color;

-(NSString *)stringFromColor;
-(NSString *)hexStringFromColor;

+(UIColor *)randomColor;
+(UIColor *)colorWithString:(NSString *)stringToConvert;
+(UIColor *)colorWithRGBHex:(UInt32)hex;
+(UIColor *)colorWithHexString:(NSString *)stringToConvert;

+(UIColor *)colorWithName:(NSString *)cssColorName;

@end

#if SUPPORTS_UNDOCUMENTED_API

@interface UIColor (UIColor_Undocumented_Expanded)
- (NSString *)fetchStyleString;
- (UIColor *)rgbColor;

@end
#endif