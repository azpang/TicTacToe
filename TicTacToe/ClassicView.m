//
//  ClassicView.m
//  TicTacToe
//
//  Created by eandrade21 on 3/5/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import "ClassicView.h"
#import "ReduxBoardStatusView.h"
#import "ClassicViewCell.h"
#import "ClassicViewCellDelegate.h"
#import "PlayerController.h"
#import "ReduxBoardViewController.h"


@interface ClassicView ()

@property (strong, nonatomic) UIView *boardView;

@property (assign, nonatomic) float boardCellBorderThickness;
@property (strong, nonatomic) UIColor *boardCellBackgroundColor;

@property (strong, nonatomic) NSMutableArray *boardViewCells;
@property (strong, nonatomic) ClassicViewCell *boardCell0;
@property (strong, nonatomic) ClassicViewCell *boardCell1;
@property (strong, nonatomic) ClassicViewCell *boardCell2;
@property (strong, nonatomic) ClassicViewCell *boardCell3;
@property (strong, nonatomic) ClassicViewCell *boardCell4;
@property (strong, nonatomic) ClassicViewCell *boardCell5;
@property (strong, nonatomic) ClassicViewCell *boardCell6;
@property (strong, nonatomic) ClassicViewCell *boardCell7;
@property (strong, nonatomic) ClassicViewCell *boardCell8;

@property (assign, nonatomic) int boardCellSelected;

@end

@implementation ClassicView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setMultipleTouchEnabled:NO];
        [self setUserInteractionEnabled:YES];
        _boardCellBorderThickness = 2.0f;
        _boardCellBackgroundColor = [UIColor whiteColor];
        
        //Redux status bar initialization and addition to parent view
        _reduxStatusBar = [[ReduxBoardStatusView alloc] init];
        [self addSubview:_reduxStatusBar];
        
        //BoardView initialization and addition
        CGRect boardViewFrame = CGRectMake(0, 20, 320, self.bounds.size.height-100);
        _boardView = [[UIView alloc] initWithFrame:boardViewFrame];
        
        
        //Layout inidividual boardViewCells inside boardView
        _boardViewCells = [[NSMutableArray alloc] initWithCapacity:8];
        [self layoutBoardCells];
        
        //Boardview addition to parent view
        [self addSubview:_boardView];
        
        //Next Button
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        CGRect buttonFrame = CGRectMake(0,self.bounds.size.height - 80, 320, 40);
        _nextButton.frame = buttonFrame;
        [_nextButton setTitle:@"Next" forState:UIControlStateNormal];
        [_nextButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20.0f]];
        [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextButton setBackgroundColor:[UIColor blackColor]];
        [self addSubview:_nextButton];
        
        [_nextButton addTarget:self action:@selector(nextPlayerTurn:) forControlEvents:UIControlEventTouchUpInside];
        _nextButton.hidden = YES;
        
        

    }
    return self;
}

- (void) layoutBoardCells{

    CGFloat parentViewHeight = _boardView.bounds.size.height;
    CGFloat parentViewWidth = _boardView.bounds.size.width;
    
    CGFloat subViewSizeHeight = parentViewHeight/3.0;
    CGFloat subViewSizeWidth = parentViewWidth/3.0;
    
    //Layout boardCell0
    CGRect boardCellFrame = CGRectMake(0, 0, subViewSizeWidth, subViewSizeHeight);
    _boardCell0 = [[ClassicViewCell alloc] initWithFrame:boardCellFrame cellIndex:0];
    _boardCell0.delegate = self;
    _boardCell0.borderThickness = _boardCellBorderThickness;
    _boardCell0.backgroundColor = _boardCellBackgroundColor;
    [_boardView addSubview:_boardCell0];
    [_boardViewCells addObject:_boardCell0];
    
    //Layout boardCell1
    boardCellFrame = CGRectMake(subViewSizeWidth, 0, subViewSizeWidth, subViewSizeHeight);
    _boardCell1 = [[ClassicViewCell alloc] initWithFrame:boardCellFrame cellIndex:1];
    _boardCell1.delegate = self;
    _boardCell1.borderThickness = _boardCellBorderThickness;
    _boardCell1.backgroundColor = _boardCellBackgroundColor;
    [_boardView addSubview:_boardCell1];
    [_boardViewCells addObject:_boardCell1];
    
    //Layout boardCell2
    boardCellFrame = CGRectMake(subViewSizeWidth*2, 0, subViewSizeWidth, subViewSizeHeight);
    _boardCell2 = [[ClassicViewCell alloc] initWithFrame:boardCellFrame cellIndex:2];
    _boardCell2.delegate = self;
    _boardCell2.borderThickness = _boardCellBorderThickness;
    _boardCell2.backgroundColor = _boardCellBackgroundColor;
    [_boardView addSubview:_boardCell2];
    [_boardViewCells addObject:_boardCell2];
    
    //Layout boardCell3
    boardCellFrame = CGRectMake(0, subViewSizeHeight, subViewSizeWidth, subViewSizeHeight);
    _boardCell3 = [[ClassicViewCell alloc] initWithFrame:boardCellFrame cellIndex:3];
    _boardCell3.delegate = self;
    _boardCell3.borderThickness = _boardCellBorderThickness;
    _boardCell3.backgroundColor = _boardCellBackgroundColor;
    [_boardView addSubview:_boardCell3];
    [_boardViewCells addObject:_boardCell3];
    
    //Layout boardCell4
    boardCellFrame = CGRectMake(subViewSizeWidth, subViewSizeHeight, subViewSizeWidth, subViewSizeHeight);
    _boardCell4 = [[ClassicViewCell alloc] initWithFrame:boardCellFrame cellIndex:4];
    _boardCell4.delegate = self;
    _boardCell4.borderThickness = _boardCellBorderThickness;
    _boardCell4.backgroundColor = _boardCellBackgroundColor;
    [_boardView addSubview:_boardCell4];
    [_boardViewCells addObject:_boardCell4];
    
    //Layout boardCell5
    boardCellFrame = CGRectMake(subViewSizeWidth*2, subViewSizeHeight, subViewSizeWidth, subViewSizeHeight);
    _boardCell5 = [[ClassicViewCell alloc] initWithFrame:boardCellFrame cellIndex:5];
    _boardCell5.delegate = self;
    _boardCell5.borderThickness = _boardCellBorderThickness;
    _boardCell5.backgroundColor = _boardCellBackgroundColor;
    [_boardView addSubview:_boardCell5];
    [_boardViewCells addObject:_boardCell5];
    
    //Layout boardCell6
    boardCellFrame = CGRectMake(0, subViewSizeHeight*2, subViewSizeWidth, subViewSizeHeight);
    _boardCell6 = [[ClassicViewCell alloc] initWithFrame:boardCellFrame cellIndex:6];
    _boardCell6.delegate = self;
    _boardCell6.borderThickness = _boardCellBorderThickness;
    _boardCell6.backgroundColor = _boardCellBackgroundColor;
    [_boardView addSubview:_boardCell6];
    [_boardViewCells addObject:_boardCell6];
    
    //Layout boardCell7
    boardCellFrame = CGRectMake(subViewSizeWidth, subViewSizeHeight*2, subViewSizeWidth, subViewSizeHeight);
    _boardCell7 = [[ClassicViewCell alloc] initWithFrame:boardCellFrame cellIndex:7];
    _boardCell7.delegate = self;
    _boardCell7.borderThickness = _boardCellBorderThickness;
    _boardCell7.backgroundColor = _boardCellBackgroundColor;
    [_boardView addSubview:_boardCell7];
    [_boardViewCells addObject:_boardCell7];
    
    //Layout boardCell8
    boardCellFrame = CGRectMake(subViewSizeWidth*2, subViewSizeHeight*2, subViewSizeWidth, subViewSizeHeight);
    _boardCell8 = [[ClassicViewCell alloc] initWithFrame:boardCellFrame cellIndex:8];
    _boardCell8.delegate = self;
    _boardCell8.borderThickness = _boardCellBorderThickness;
    _boardCell8.backgroundColor = _boardCellBackgroundColor;
    [_boardView addSubview:_boardCell8];
    [_boardViewCells addObject:_boardCell8];
    
}

- (IBAction)nextPlayerTurn:(UIButton *)sender{
    
    [self.delegate nextPlayerTurn:self.boardCellSelected];
    
    for(ClassicViewCell *cell in self.boardViewCells){
        
        if(cell.enable){
            [cell setUserInteractionEnabled:YES];
            (cell.inkColor == [UIColor blackColor]) ? (cell.inkColor = [UIColor redColor]) : (cell.inkColor = [UIColor blackColor]);
        }
    }
    
    self.nextButton.hidden = YES;
    
}

#pragma mark - ClassicViewCellDelegate methods
- (void) boardCellSelected:(ClassicViewCell *)boardCell{
    
    self.nextButton.hidden = NO;
    self.boardCellSelected = boardCell.cellIndex;
    boardCell.enable = NO;
    
    //Deactivate other board cells
    for(ClassicViewCell *cell in _boardViewCells){
        if(cell.cellIndex != boardCell.cellIndex){
            [cell setUserInteractionEnabled:NO];
        }
        
    }
    
}


@end
