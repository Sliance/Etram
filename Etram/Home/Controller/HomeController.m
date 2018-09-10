//
//  HomeController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/5.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "HomeController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <objc/runtime.h>
#define DEFAULTSPAN 50
#import "MineController.h"
#import "LockPaytypeController.h"
#import "AppointHomeView.h"
#import "EndRideController.h"

@interface HomeController (){
    BOOL haveGetUserLocation;//是否获取到用户位置
    CLGeocoder *geocoder;
    NSMutableArray *infoArray;//周围信息
    UIImageView *imgView;//中间位置标志视图
    BOOL spanBool;//是否是滑动
    BOOL pinchBool;//是否缩放
    CLLocationManager *_locationManager;
}
@property (strong, nonatomic) MKMapView *mapView;
@property (strong, nonatomic) UIButton *arrowBtn;
@property (strong, nonatomic) UIButton *positionBtn;
@property (strong, nonatomic) UIButton *dateBtn;
@property (strong, nonatomic) UIButton *mineBtn;
@property (strong, nonatomic) UIButton *codeBtn;
@property(nonatomic,strong)AppointHomeView *appointView;

@end

@implementation HomeController
-(MKMapView *)mapView{
    if (!_mapView) {
        _mapView = [[MKMapView alloc]init];
        _mapView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
        _mapView.delegate = self;
    }
    return _mapView;
}
-(AppointHomeView *)appointView{
    if (!_appointView) {
        _appointView = [[AppointHomeView alloc]initWithFrame:CGRectMake(15, 15, SCREENWIDTH-30, 63)];
        [_appointView.layer setCornerRadius:5];
        _appointView.hidden = YES;
    }
    return _appointView;
}
-(UIButton *)mineBtn{
    if (!_mineBtn) {
        _mineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_mineBtn.layer setMasksToBounds:YES];
        [_mineBtn.layer setCornerRadius:22];
        [_mineBtn setImage:[UIImage imageNamed:@"mine_icon"] forState:UIControlStateNormal];
        [_mineBtn addTarget:self action:@selector(pressmineBtn) forControlEvents:UIControlEventTouchUpInside];
        _mineBtn.backgroundColor = [UIColor whiteColor];
    }
    return _mineBtn;
}
-(UIButton *)dateBtn{
    if (!_dateBtn) {
        _dateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_dateBtn.layer setMasksToBounds:YES];
        [_dateBtn.layer setCornerRadius:22];
        [_dateBtn setImage:[UIImage imageNamed:@"history_normal"] forState:UIControlStateNormal];
        [_dateBtn setImage:[UIImage imageNamed:@"history_icon"] forState:UIControlStateSelected];
        [_dateBtn addTarget:self action:@selector(pressDateBtn:) forControlEvents:UIControlEventTouchUpInside];
        _dateBtn.backgroundColor = [UIColor whiteColor];
    }
    return _dateBtn;
}
-(UIButton *)positionBtn{
    if (!_positionBtn) {
        _positionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_positionBtn.layer setMasksToBounds:YES];
        [_positionBtn.layer setCornerRadius:22];
        [_positionBtn setImage:[UIImage imageNamed:@"position_home"] forState:UIControlStateNormal];
        _positionBtn.backgroundColor = [UIColor whiteColor];
    }
    return _positionBtn;
}
-(UIButton *)arrowBtn{
    if (!_arrowBtn) {
        _arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_arrowBtn.layer setMasksToBounds:YES];
        [_arrowBtn.layer setCornerRadius:22];
        [_arrowBtn setImage:[UIImage imageNamed:@"arrow_home"] forState:UIControlStateNormal];
        [_arrowBtn addTarget:self action:@selector(pressArrowBtn) forControlEvents:UIControlEventTouchUpInside];
        _arrowBtn.backgroundColor = [UIColor whiteColor];
    }
    return _arrowBtn;
}
-(UIButton *)codeBtn{
    if (!_codeBtn) {
        _codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_codeBtn.layer setMasksToBounds:YES];
        [_codeBtn.layer setCornerRadius:22];
        [_codeBtn setImage:[UIImage imageNamed:@"sweep_home"] forState:UIControlStateNormal];
        [_codeBtn setTitle:@"扫码用车" forState:UIControlStateNormal];
        _codeBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_codeBtn setTitleColor:DSColorFromHex(0x323232) forState:UIControlStateNormal];
        _codeBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [_codeBtn addTarget:self action:@selector(pressCodeBtn) forControlEvents:UIControlEventTouchUpInside];
        _codeBtn.backgroundColor = [UIColor whiteColor];
    }
    return _codeBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mapView];
    spanBool = NO;
    pinchBool = NO;
    geocoder=[[CLGeocoder alloc]init];
    infoArray = [NSMutableArray array];
    haveGetUserLocation = NO;
    //请求定位服务
    _locationManager=[[CLLocationManager alloc]init];
    if(![CLLocationManager locationServicesEnabled]||[CLLocationManager authorizationStatus]!=kCLAuthorizationStatusAuthorizedWhenInUse){
        [_locationManager requestWhenInUseAuthorization];
    }
    self.mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
    
    //先查看MapView层次结构
    // NSLog(@"mapview recursiveDescription:\n%@",[self.mapView performSelector:@selector(recursiveDescription)]);
    
    //打印完后我们发现有个View带有手势数组其类型为_MKMapContentView获取Span和Pinch手势
    for (UIView *view in self.mapView.subviews) {
        NSString *viewName = NSStringFromClass([view class]);
        if ([viewName isEqualToString:@"_MKMapContentView"]) {
            UIView *contentView = view;//[self.mapView valueForKey:@"_contentView"];
            for (UIGestureRecognizer *gestureRecognizer in contentView.gestureRecognizers) {
                if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
                    [gestureRecognizer addTarget:self action:@selector(mapViewSpanGesture:)];
                }
                if ([gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]]) {
                    [gestureRecognizer addTarget:self action:@selector(mapViewPinchGesture:)];
                }
            }
            
        }
    }
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.toolbarHidden = NO;
    [self.view addSubview:self.appointView];
    [self reloadUI];
}

-(void)reloadUI{
    [self.view addSubview:self.mineBtn];
    [self.view addSubview:self.arrowBtn];
    [self.view addSubview:self.positionBtn];
    [self.view addSubview:self.dateBtn];
    [self.view addSubview:self.codeBtn];
    [self.mineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(44);
        make.right.bottom.equalTo(self.view).offset(-21);
    }];
    [self.positionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(44);
        make.bottom.equalTo(self.view).offset(-21);
        make.left.equalTo(self.view).offset(21);
    }];
    [self.dateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(44);
        make.bottom.equalTo(self.mineBtn.mas_top).offset(-21);
        make.right.equalTo(self.view).offset(-21);
    }];
    [self.arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(44);
        make.bottom.equalTo(self.positionBtn.mas_top).offset(-21);
        make.left.equalTo(self.view).offset(21);
    }];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(180);
        make.bottom.equalTo(self.view).offset(-50);
        make.centerX.equalTo(self.view);
    }];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.title = @"e电车";
    }
    return self;
}
#pragma mark - MKMapViewDelegate

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    
}


-(void)mapViewWillStartLocatingUser:(MKMapView *)mapView
{
    NSLog(@"mapViewWillStartLocatingUser");
}


-(void)mapViewDidStopLocatingUser:(MKMapView *)mapView
{
    NSLog(@"mapViewDidStopLocatingUser");
}


-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"userLocation:longitude:%f---latitude:%f",userLocation.location.coordinate.longitude,userLocation.location.coordinate.latitude);
    if (!haveGetUserLocation) {
        if (self.mapView.userLocationVisible) {
            haveGetUserLocation = YES;
            [self getAddressByLatitude:userLocation.coordinate.latitude longitude:userLocation.coordinate.longitude];
            [self addCenterLocationViewWithCenterPoint:self.mapView.center];
        }
        
    }
}


- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"didFailToLocateUserWithError:%@",error.localizedDescription);
}


- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
    NSLog(@"regionWillChangeAnimated");
}


- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"regionDidChangeAnimated");
    if (imgView && (spanBool||pinchBool)) {
        [infoArray removeAllObjects];
//        [self.showTableView reloadData];
        [self resetTableHeadView];
        CGPoint mapCenter = self.mapView.center;
        CLLocationCoordinate2D coordinate = [self.mapView convertPoint:mapCenter toCoordinateFromView:self.mapView];
        [self getAddressByLatitude:coordinate.latitude longitude:coordinate.longitude];
        imgView.center = CGPointMake(mapCenter.x, mapCenter.y-15);
        [UIView animateWithDuration:0.2 animations:^{
            imgView.center = mapCenter;
        }completion:^(BOOL finished){
            if (finished) {
                [UIView animateWithDuration:0.05 animations:^{
                    imgView.transform = CGAffineTransformMakeScale(1.0, 0.8);
                    
                }completion:^(BOOL finished){
                    if (finished) {
                        [UIView animateWithDuration:0.1 animations:^{
                            imgView.transform = CGAffineTransformIdentity;
                        }completion:^(BOOL finished){
                            if (finished) {
                                spanBool = NO;
                            }
                        }];
                    }
                }];
                
            }
        }];
    }
    
}


#pragma mark - Private Methods
-(void)resetTableHeadView
{
    if (infoArray.count>0) {
//        self.showTableView.tableHeaderView = nil;
    }else{
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30.0)];
//        view.backgroundColor = self.showTableView.backgroundColor;
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        indicatorView.center = view.center;
        [indicatorView startAnimating];
        [view addSubview:indicatorView];
//        self.showTableView.tableHeaderView = view;
        
    }
}


-(void)addCenterLocationViewWithCenterPoint:(CGPoint)point
{
    if (!imgView) {
        imgView = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2, 100, 18, 38)];
        imgView.center = point;
        imgView.image = [UIImage imageNamed:@"map_location"];
        imgView.center = self.mapView.center;
        [self.view addSubview:imgView];
    }
    
}

-(void)getAroundInfoMationWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, DEFAULTSPAN, DEFAULTSPAN);
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc]init];
    request.region = region;
    request.naturalLanguageQuery = @"Restaurants";
    MKLocalSearch *localSearch = [[MKLocalSearch alloc]initWithRequest:request];
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error){
        if (!error) {
            [self getAroundInfomation:response.mapItems];
        }else{
            haveGetUserLocation = NO;
            NSLog(@"Quest around Error:%@",error.localizedDescription);
        }
    }];
}


-(void)getAroundInfomation:(NSArray *)array
{
    for (MKMapItem *item in array) {
        MKPlacemark * placemark = item.placemark;
//        ZHPlaceInfoModel *model = [[ZHPlaceInfoModel alloc]init];
//        model.name = placemark.name;
//        model.thoroughfare = placemark.thoroughfare;
//        model.subThoroughfare = placemark.subThoroughfare;
//        model.city = placemark.locality;
//        model.coordinate = placemark.location.coordinate;
//        [infoArray addObject:model];
    }
//    [self.showTableView reloadData];
}


#pragma mark 根据坐标取得地名
-(void)getAddressByLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude{
    
    //反地理编码
    CLLocation *location=[[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self initialData:placemarks];
                [self getAroundInfoMationWithCoordinate:CLLocationCoordinate2DMake(latitude, longitude)];
//                [self.showTableView reloadData];
                [self resetTableHeadView];
            });
        }else{
            haveGetUserLocation = NO;
            NSLog(@"error:%@",error.localizedDescription);
        }
        
    }];
}


#pragma mark - Initial Data
-(void)initialData:(NSArray *)places
{
    [infoArray removeAllObjects];
    for (CLPlacemark *placemark in places) {
//        ZHPlaceInfoModel *model = [[ZHPlaceInfoModel alloc]init];
//        model.name = placemark.name;
//        model.thoroughfare = placemark.thoroughfare;
//        model.subThoroughfare = placemark.subThoroughfare;
//        model.city = placemark.locality;
//        model.coordinate = placemark.location.coordinate;
//        [infoArray insertObject:model atIndex:0];
    }
}


#pragma mark - touchs
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"moved");
    spanBool = YES;
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}


#pragma mark - MapView Gesture
-(void)mapViewSpanGesture:(UIPanGestureRecognizer *)gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:{
            NSLog(@"SpanGesture Began");
        }
            break;
        case UIGestureRecognizerStateChanged:{
            NSLog(@"SpanGesture Changed");
            spanBool = YES;
        }
            
            break;
        case UIGestureRecognizerStateCancelled:{
            NSLog(@"SpanGesture Cancelled");
        }
            
            break;
        case UIGestureRecognizerStateEnded:{
            NSLog(@"SpanGesture Ended");
        }
            
            break;
            
        default:
            break;
    }
}

-(void)mapViewPinchGesture:(UIGestureRecognizer*)gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:{
            NSLog(@"PinchGesture Began");
        }
            break;
        case UIGestureRecognizerStateChanged:{
            NSLog(@"PinchGesture Changed");
            pinchBool = YES;
        }
            
            break;
        case UIGestureRecognizerStateCancelled:{
            NSLog(@"PinchGesture Cancelled");
        }
            
            break;
        case UIGestureRecognizerStateEnded:{
            pinchBool = NO;
            NSLog(@"PinchGesture Ended");
        }
            
            break;
            
        default:
            break;
    }
    
}
#pragma mark----Action
-(void)pressmineBtn{
    MineController *mineVC = [[MineController alloc]init];
    [self.navigationController pushViewController:mineVC animated:YES];
    
}
-(void)pressCodeBtn{
    LockPaytypeController *lockVC = [[LockPaytypeController alloc]init];
    [self.navigationController pushViewController:lockVC animated:YES];
}
-(void)pressDateBtn:(UIButton*)sender{
    sender.selected = !sender.selected;
    if (sender.selected ==YES) {
        self.appointView.hidden = NO;
    }else{
        self.appointView.hidden = YES;
    }
}
-(void)pressArrowBtn{
    EndRideController *endVC = [[EndRideController alloc]init];
    [self.navigationController pushViewController:endVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
