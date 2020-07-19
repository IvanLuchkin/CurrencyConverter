//
//  ViewController.m
//  CurrencyConverter
//
//  Created by Ivan Luchkin on 18.07.2020.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"


@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *request;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyPLN;
@property (weak, nonatomic) IBOutlet UILabel *currencyJPY;
@property (weak, nonatomic) IBOutlet UILabel *currencyGBP;

@end

@implementation ViewController

- (IBAction)buttonTapped:(id)sender {
    self.convertButton.enabled = NO;
    
    self.request = [[CRCurrencyRequest alloc] init];
    self.request.delegate = self;
    [self.request start];
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies {
    self.convertButton.enabled = YES;
    double inputValue = [self.inputField.text floatValue];
   
    self.currencyPLN.text = [NSString stringWithFormat:@"%.2f", inputValue * currencies.PLN];
    
    self.currencyJPY.text = [NSString stringWithFormat:@"%.2f", inputValue * currencies.JPY];
    
    self.currencyGBP.text = [NSString stringWithFormat:@"%.2f", inputValue * currencies.GBP];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
