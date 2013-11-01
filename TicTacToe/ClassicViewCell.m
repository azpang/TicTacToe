//
//  ClassicViewCell.m
//  TicTacToe
//
//  Created by eandrade21 on 3/5/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import "ClassicViewCell.h"

@interface ClassicViewCell()

@property (assign, nonatomic) BOOL topEdge;
@property (assign, nonatomic) BOOL bottomEdge;
@property (assign, nonatomic) BOOL rightEdge;
@property (assign, nonatomic) BOOL leftEdge;
@property (assign, nonatomic) float boarderThickness;
@property (assign, nonatomic) CGPoint previousPoint;
@property (assign, nonatomic) CGPoint currentPoint;


@property (assign, nonatomic) void *cacheBitmap;
@property (assign, nonatomic) CGContextRef cacheContext;

@end

@implementation ClassicViewCell

- (id)initWithFrame:(CGRect)frame cellIndex:(int) cellIndex{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setMultipleTouchEnabled:NO];
        [self setUserInteractionEnabled:YES];
        _cellIndex = cellIndex;
        _enable = YES;
        
        //Set cell borders
        [self setCellBorders];
        
        
        //Defualt property values
        _boarderThickness = 2.0;
        _inkColor = [UIColor redColor];
        _previousPoint = CGPointZero;
        _penStrokeSize = 5;
        
        if(![self initContext:self.frame.size]){
            [[NSException exceptionWithName:NSGenericException reason:@"Cache Memory not created" userInfo:nil] raise];
        }

    }
    return self;
}


- (void) setCellBorders{
    
    //Set horizontal borders
    if(_cellIndex >= 0 && _cellIndex <=2 ){
        _bottomEdge = YES;
    }
    
    if(_cellIndex >= 3 && _cellIndex <= 5 ){
        _topEdge = YES;
        _bottomEdge = YES;
    }
    
    if(_cellIndex >= 6 && _cellIndex <= 8){
        _topEdge = YES;
    }
    
    //Set vertical borders
    if(_cellIndex == 0 || _cellIndex == 3 || _cellIndex == 6 ){
        _rightEdge = YES;
    }
    
    if(_cellIndex == 1 || _cellIndex == 4 || _cellIndex == 7 ){
        _leftEdge = YES;
        _rightEdge = YES;
    }
    
    if(_cellIndex == 2 || _cellIndex == 5 || _cellIndex == 8 ){
        _leftEdge = YES;
    }
}

- (BOOL) initContext:(CGSize)size{
    
    int bitmapByteCount;
	int	bitmapBytesPerRow;
	
	// Declare the number of bytes per row. Each pixel in the bitmap is represented by 4 bytes
    //8 bits each of red, green, blue, and alpha
	bitmapBytesPerRow = ((size.width - 0.5) * 4);
	bitmapByteCount = (bitmapBytesPerRow * size.height);
	
	// Allocate memory for image data. This is the destination in memory where any drawing to the bitmap context will be rendered.
	_cacheBitmap = malloc( bitmapByteCount );
	if (_cacheBitmap == NULL) return NO;
	
    _cacheContext = CGBitmapContextCreate (_cacheBitmap, size.width, size.height, 8, bitmapBytesPerRow,
                                           CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedFirst);
    
    return YES;
    
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextSetLineWidth(context, _boarderThickness);
        
    if(_topEdge){
        
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, self.bounds.size.width, 0);
        CGContextStrokePath(context);
    }
    
    if(_bottomEdge){
        
        CGContextMoveToPoint(context, 0, self.bounds.size.height);
        CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
        CGContextStrokePath(context);
    }
    
    if(_leftEdge){
        
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 0, self.bounds.size.height);
        CGContextStrokePath(context);
    }
    
    if(_rightEdge){
        
        CGContextMoveToPoint(context, self.bounds.size.width, 0);
        CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
        CGContextStrokePath(context);
    }
    
    CGImageRef cacheImage = CGBitmapContextCreateImage(_cacheContext);
    CGContextDrawImage(context, self.bounds, cacheImage);
    CGImageRelease(cacheImage);

}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [_delegate boardCellSelected:self];
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    _previousPoint = touchPoint;

}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    if (touchPoint.x < self.bounds.size.width && touchPoint.x > 0 && touchPoint.y < self.bounds.size.height && touchPoint.y > 0) {

        _currentPoint = touchPoint;
        
        [self drawToCache];
        [self setNeedsDisplay];
        
        _previousPoint = _currentPoint;

    }
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    if (touchPoint.x < self.bounds.size.width && touchPoint.x > 0 && touchPoint.y < self.bounds.size.height && touchPoint.y > 0) {
        
    }
}

- (void) drawToCache{
    
    UIColor *color = _inkColor;
    
    CGContextSetStrokeColorWithColor(_cacheContext, [color CGColor]);
    CGContextSetLineCap(_cacheContext, kCGLineCapRound);
    CGContextSetLineWidth(_cacheContext, _penStrokeSize);
    
    CGContextMoveToPoint(_cacheContext, _previousPoint.x, _previousPoint.y);
    CGContextAddLineToPoint(_cacheContext, _currentPoint.x, _currentPoint.y);
    CGContextStrokePath(_cacheContext);
    
    CGRect dirtyPoint1 = CGRectMake(_previousPoint.x-10, _previousPoint.y-10, 20, 20);
    CGRect dirtyPoint2 = CGRectMake(_currentPoint.x-10, _currentPoint.y-10, 20, 20);
    [self setNeedsDisplayInRect:CGRectUnion(dirtyPoint1, dirtyPoint2)];

    
}


@end
