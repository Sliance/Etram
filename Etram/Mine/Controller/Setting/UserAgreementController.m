//
//  UserAgreementController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/11.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "UserAgreementController.h"
#import "UILabel+String.h"
@interface UserAgreementController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)UILabel *oneLabel;
@property(nonatomic,strong)UILabel *dOneLabel;
@property(nonatomic,strong)UILabel *twoLabel;
@property(nonatomic,strong)UILabel *dtwoLabel;
@property(nonatomic,strong)UILabel *threeLabel;
@property(nonatomic,strong)UILabel *dThreeLabel;
@property(nonatomic,strong)UILabel *Label1;
@property(nonatomic,strong)UILabel *Label2;
@property(nonatomic,strong)UILabel *Label3;
@property(nonatomic,strong)UILabel *Label4;
@property(nonatomic,strong)UILabel *Label5;
@property(nonatomic,strong)UILabel *Label6;
@property(nonatomic,strong)UILabel *Label7;
@property(nonatomic,strong)UILabel *Label8;
@property(nonatomic,strong)UILabel *Label9;
@property(nonatomic,strong)UILabel *Label10;
@property(nonatomic,strong)UILabel *Labels1;
@property(nonatomic,strong)UILabel *Labels2;
@property(nonatomic,strong)UILabel *Labels3;
@property(nonatomic,strong)UILabel *Labels4;
@property(nonatomic,strong)UILabel *Labels5;
@property(nonatomic,strong)UILabel *Labels6;
@property(nonatomic,strong)UILabel *Labels7;
@property(nonatomic,strong)UILabel *Labels8;
@property(nonatomic,strong)UILabel *Labels9;
@property(nonatomic,strong)UILabel *Labels10;
@property(nonatomic,strong)UILabel *LabelsS1;
@property(nonatomic,strong)UILabel *LabelsS2;
@property(nonatomic,strong)UILabel *LabelsS3;
@property(nonatomic,strong)UILabel *LabelsS4;
@property(nonatomic,strong)UILabel *LabelsS5;
@property(nonatomic,strong)UILabel *LabelsS6;
@property(nonatomic,strong)UILabel *LabelsS7;
@property(nonatomic,strong)UILabel *LabelsS8;
@property(nonatomic,strong)UILabel *LabelsS9;
@property(nonatomic,strong)UILabel *LabelsS10;

@end

@implementation UserAgreementController

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"1.特别提示";
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _titleLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        [_detailLabel setText:@" 1.1本《米加智能科技公共电动自行车租赁服务协议》（以下简称“本协议”）是服务使用人（以下简称“用户”）与浙江米加智能科技有限公司（以下简称“本公司”）之间关于用户下载、安装、使用“e单车”软件，注册、使用、管理用户帐号，以及使用本公司提供的公共电动自行车租赁服务所订立的协议。" lineSpacing:5];
        _detailLabel.font = [UIFont systemFontOfSize:15];
        _detailLabel.textColor = DSColorFromHex(0x323232);
        _detailLabel.textAlignment = NSTextAlignmentLeft;
        _detailLabel.numberOfLines =0;
    }
    return _detailLabel;
}
-(UILabel *)oneLabel{
    if (!_oneLabel) {
        _oneLabel = [[UILabel alloc]init];
        [_oneLabel setText:@"1.2用户同意按照本协议的规定及其系统升级所需配套的业务规则，通过访问或使用本公司 “e单车”软件，本公司为用户提供基于互联网以及移动网的公共电动自行车租赁等相关服务（以下也称“本服务”）。" lineSpacing:5];
        _oneLabel.font = [UIFont systemFontOfSize:15];
        _oneLabel.textColor = DSColorFromHex(0x323232);
        _oneLabel.textAlignment = NSTextAlignmentLeft;
        _oneLabel.numberOfLines =0;
    }
    return _oneLabel;
}
-(UILabel *)dOneLabel{
    if (!_dOneLabel) {
        _dOneLabel = [[UILabel alloc]init];
        [_dOneLabel setText: @"1.3用户在访问和使用“e单车”软件或本服务之前，应认真仔细阅读、充分理解本协议中各条款，特别涉及租车计费规则、本公司责任的免责条款，对用户的权利限制的条款、约定争议解决方式、司法管辖、法律适用等条款。" lineSpacing:5];
        _dOneLabel.font = [UIFont systemFontOfSize:15];
        _dOneLabel.textColor = DSColorFromHex(0x323232);
        _dOneLabel.textAlignment = NSTextAlignmentLeft;
        _dOneLabel.numberOfLines =0;
    }
    return _dOneLabel;
}
-(UILabel *)twoLabel{
    if (!_twoLabel) {
        _twoLabel = [[UILabel alloc]init];
        [_twoLabel setText:@"1.4用户访问和使用“e单车”软件或本服务的行为即表明用户同意受本协议的约束，并自动形成事实合同关系；如果用户对本协议任何条款有异议，请勿访问和使用“e单车”软件或本服务。" lineSpacing:5];
        _twoLabel.font = [UIFont systemFontOfSize:15];
        _twoLabel.textColor = DSColorFromHex(0x323232);
        _twoLabel.textAlignment = NSTextAlignmentLeft;
        _twoLabel.numberOfLines =0;
    }
    return _twoLabel;
}
-(UILabel *)dtwoLabel{
    if (!_dtwoLabel) {
        _dtwoLabel = [[UILabel alloc]init];
        [_dtwoLabel setText:@"1.5 本公司有权随时修改本协议的任何条款。修改后的协议直接在“e单车”软件或本公司网站（www.mikabike.com）发布并即时生效。用户继续访问和使用e单车”软件或本服务，即表示用户同意并受修改后的本协议约束。" lineSpacing:5];
        _dtwoLabel.font = [UIFont systemFontOfSize:15];
        _dtwoLabel.textColor = DSColorFromHex(0x323232);
        _dtwoLabel.textAlignment = NSTextAlignmentLeft;
        _dtwoLabel.numberOfLines =0;
    }
    return _dtwoLabel;
}
-(UILabel *)threeLabel{
    if (!_threeLabel) {
        _threeLabel = [[UILabel alloc]init];
        [_threeLabel setText:@"1.6 除本协议外，在“e单车”软件或本公司网站（www.mikabike.com）公布的业务规则（包括不限于操作规则、保险条款、租车计费规则等）也是本协议一部分，请用户仔细阅读。" lineSpacing:5];
        _threeLabel.font = [UIFont systemFontOfSize:15];
        _threeLabel.textColor = DSColorFromHex(0x323232);
        _threeLabel.textAlignment = NSTextAlignmentLeft;
        _threeLabel.numberOfLines =0;
        
    }
    return _threeLabel;
}
-(UILabel *)dThreeLabel{
    if (!_dThreeLabel) {
        _dThreeLabel = [[UILabel alloc]init];
        [_dThreeLabel setText: @"1.7 本公司针对某些特定的本服务的使用行为通过各种方式作出的任何声明、通知、警示等内容视为本协议的一部分，用户如使用本服务，视为用户同意该等声明、通知、警示的内容，如用户不同意该等声明、通知或警示，（既）应当立即停止使用本服务。" lineSpacing:5];
        _dThreeLabel.font = [UIFont systemFontOfSize:15];
        _dThreeLabel.textColor = DSColorFromHex(0x323232);
        _dThreeLabel.textAlignment = NSTextAlignmentLeft;
        _dThreeLabel.numberOfLines =0;
    }
    return _dThreeLabel;
}

-(UILabel *)Label1{
    if (!_Label1) {
        _Label1 = [[UILabel alloc]init];
        _Label1.text = @"1.注册";
        _Label1.font = [UIFont boldSystemFontOfSize:15];
        _Label1.textColor = DSColorFromHex(0x323232);
        _Label1.textAlignment = NSTextAlignmentLeft;
        
    }
    return _Label1;
}
-(UILabel *)Label2{
    if (!_Label2) {
        _Label2 = [[UILabel alloc]init];
        [_Label2 setText: @"2.1 用户在使用本服务前应当进行实名帐号注册，并如实填写个人实名信息，同一手机号码只能注册一个帐号。用户注册成功后，本公司将给予每个用户一个用户帐号，该帐号归本公司所有，用户完成申请注册手续后，获得帐号的使用权。帐号使用权仅属于初始申请注册人，禁止赠与、借用、租用、转让或售卖。用户承担帐号与密码的保管责任，并就其帐号及密码项下之一切活动负全部责任。" lineSpacing:5];
        _Label2.font = [UIFont systemFontOfSize:15];
        _Label2.textColor = DSColorFromHex(0x323232);
        _Label2.textAlignment = NSTextAlignmentLeft;
        _Label2.numberOfLines =0;
    }
    return _Label2;
}
-(UILabel *)Label3{
    if (!_Label3) {
        _Label3 = [[UILabel alloc]init];
        [_Label3 setText: @"2.2用户应对注册信息的合法性、真实性负责，用户不得虚假注册或盗用他人名义注册，否则本公司有权拒绝注册申请和提供一切服务，由此造成他人或本公司损失的，由用户承担一切经济和法律责任。用户注册时所填写的个人信息如有变动应及时进行更改，用户因未及时更改个人信息造成的损失本公司不承担任何责任。" lineSpacing:5];
        _Label3.font = [UIFont systemFontOfSize:15];
        _Label3.textColor = DSColorFromHex(0x323232);
        _Label3.textAlignment = NSTextAlignmentLeft;
        _Label3.numberOfLines =0;
    }
    return _Label3;
}
-(UILabel *)Label4{
    if (!_Label4) {
        _Label4 = [[UILabel alloc]init];
        [_Label4 setText: @"2.3用户长期未登录使用注册帐号的，本公司有权删除或关闭或收回，以免造成资源浪费，由此带来的任何损失均由用户自行承担。" lineSpacing:5];
        _Label4.font = [UIFont systemFontOfSize:15];
        _Label4.textColor = DSColorFromHex(0x323232);
        _Label4.textAlignment = NSTextAlignmentLeft;
        _Label4.numberOfLines =0;
    }
    return _Label4;
}
-(UILabel *)Label5{
    if (!_Label5) {
        _Label5 = [[UILabel alloc]init];
        [_Label5 setText: @"2.4 用户注册时使用的昵称、头像如存在违反法律法规或国家政策要求，或侵犯任何第三方合法权益的情况，本公司有权禁止用户继续使用该帐号、昵称、头像。" lineSpacing:5];
        _Label5.font = [UIFont systemFontOfSize:15];
        _Label5.textColor = DSColorFromHex(0x323232);
        _Label5.textAlignment = NSTextAlignmentLeft;
        _Label5.numberOfLines =0;
    }
    return _Label5;
}
-(UILabel *)Label6{
    if (!_Label6) {
        _Label6 = [[UILabel alloc]init];
        _Label6.text = @"3.本服务";
        _Label6.font = [UIFont boldSystemFontOfSize:15];
        _Label6.textColor = DSColorFromHex(0x323232);
        _Label6.textAlignment = NSTextAlignmentLeft;
        
    }
    return _Label6;
}
-(UILabel *)Label7{
    if (!_Label7) {
        _Label7 = [[UILabel alloc]init];
        [_Label7 setText: @" 3.1 本服务的具体内容由本公司根据实际情况提供，主要包括用户的注册登录、预定车辆、租车、寻车导航、开锁、锁车、还车、评价及举报投诉、查询及分享本人用车历史记录等。" lineSpacing:5];
        _Label7.font = [UIFont systemFontOfSize:15];
        _Label7.textColor = DSColorFromHex(0x323232);
        _Label7.textAlignment = NSTextAlignmentLeft;
        _Label7.numberOfLines =0;
    }
    return _Label7;
}
-(UILabel *)Label8{
    if (!_Label8) {
        _Label8 = [[UILabel alloc]init];
        [_Label8 setText: @"3.2.本服务许可范围" lineSpacing:5];
        _Label8.font = [UIFont systemFontOfSize:15];
        _Label8.textColor = DSColorFromHex(0x323232);
        _Label8.textAlignment = NSTextAlignmentLeft;
        _Label8.numberOfLines =0;
    }
    return _Label8;
}
-(UILabel *)Label9{
    if (!_Label9) {
        _Label9 = [[UILabel alloc]init];
        [_Label9 setText: @"3.2.1 用户可以为非商业目的在单一台终端设备上安装、使用、显示、运行“e单车”软件。本公司给予用户一项个人的、不可转让及非排他性的许可，以使用“e单车”软件。" lineSpacing:5];
        _Label9.font = [UIFont systemFontOfSize:15];
        _Label9.textColor = DSColorFromHex(0x323232);
        _Label9.textAlignment = NSTextAlignmentLeft;
        _Label9.numberOfLines =0;
    }
    return _Label9;
}
-(UILabel *)Label10{
    if (!_Label10) {
        _Label10 = [[UILabel alloc]init];
        [_Label10 setText: @"3.2.2本条及本协议其它条款未明示授权的其他一切权利仍归本公司所有，用户在行使这些权利时须事先取得本公司的书面同意。本公司如果未行使前述任何权利，并不构成对该权利的放弃。" lineSpacing:5];
        _Label10.font = [UIFont systemFontOfSize:15];
        _Label10.textColor = DSColorFromHex(0x323232);
        _Label10.textAlignment = NSTextAlignmentLeft;
        _Label10.numberOfLines =0;
    }
    return _Label10;
}
-(UILabel *)Labels1{
    if (!_Labels1) {
        _Labels1 = [[UILabel alloc]init];
        [_Labels1 setText: @"3.3鉴于本服务的特殊性，用户同意本公司有权随时变更、中断或终止部分或全部的本服务（包括收费服务及免费服务）。" lineSpacing:5];
        _Labels1.font = [UIFont systemFontOfSize:15];
        _Labels1.textColor = DSColorFromHex(0x323232);
        _Labels1.textAlignment = NSTextAlignmentLeft;
        _Labels1.numberOfLines =0;
    }
    return _Labels1;
}
-(UILabel *)Labels2{
    if (!_Labels2) {
        _Labels2 = [[UILabel alloc]init];
        [_Labels2 setText: @"3.4 用户理解及同意本公司需要定期或不定期地对提供本服务的平台（如互联网网站、移动网络等）或相关的设备进行检修或者维护，如因此类情况而造成收费服务在合理时间内的中断，本公司无需为此承担任何责任。" lineSpacing:5];
        _Labels2.font = [UIFont systemFontOfSize:15];
        _Labels2.textColor = DSColorFromHex(0x323232);
        _Labels2.textAlignment = NSTextAlignmentLeft;
        _Labels2.numberOfLines =0;
    }
    return _Labels2;
}
-(UILabel *)Labels3{
    if (!_Labels3) {
        _Labels3 = [[UILabel alloc]init];
        [_Labels3 setText: @"3.5 如发生下列任何一种情形，本公司有权随时中断或终止向用户提供本协议项下的服务，而无须对用户或任何第三方承担任何责任：" lineSpacing:5];
        _Labels3.font = [UIFont systemFontOfSize:15];
        _Labels3.textColor = DSColorFromHex(0x323232);
        _Labels3.textAlignment = NSTextAlignmentLeft;
        _Labels3.numberOfLines =0;
    }
    return _Labels3;
}
-(UILabel *)Labels4{
    if (!_Labels4) {
        _Labels4 = [[UILabel alloc]init];
        [_Labels4 setText: @"3.5.1 用户提供的个人资料的真实性、完整性、准确性、合法性、有效性存在问题；" lineSpacing:5];
        _Labels4.font = [UIFont systemFontOfSize:15];
        _Labels4.textColor = DSColorFromHex(0x323232);
        _Labels4.textAlignment = NSTextAlignmentLeft;
        _Labels4.numberOfLines =0;
    }
    return _Labels4;
}
-(UILabel *)Labels5{
    if (!_Labels5) {
        _Labels5 = [[UILabel alloc]init];
        [_Labels5 setText: @"3.5.2 用户违反本协议中规定的使用规则；" lineSpacing:5];
        _Labels5.font = [UIFont systemFontOfSize:15];
        _Labels5.textColor = DSColorFromHex(0x323232);
        _Labels5.textAlignment = NSTextAlignmentLeft;
        _Labels5.numberOfLines =0;
    }
    return _Label5;
}
-(UILabel *)Labels6{
    if (!_Labels6) {
        _Labels6 = [[UILabel alloc]init];
        [_Labels6 setText: @"3.5.3 用户在使用收费服务时未按规定向本公司支付相应的服务费；" lineSpacing:5];
        _Labels6.font = [UIFont systemFontOfSize:15];
        _Labels6.textColor = DSColorFromHex(0x323232);
        _Labels6.textAlignment = NSTextAlignmentLeft;
        _Labels6.numberOfLines =0;
    }
    return _Labels6;
}
-(UILabel *)Labels7{
    if (!_Labels7) {
        _Labels7 = [[UILabel alloc]init];
        [_Labels7 setText: @" 3.5.4盗用他人个人信息、手机号码注册或者盗用他人帐号密码的；" lineSpacing:5];
        _Labels7.font = [UIFont systemFontOfSize:15];
        _Labels7.textColor = DSColorFromHex(0x323232);
        _Labels7.textAlignment = NSTextAlignmentLeft;
        _Labels7.numberOfLines =0;
    }
    return _Labels7;
}
-(UILabel *)Labels8{
    if (!_Labels8) {
        _Labels8 = [[UILabel alloc]init];
        [_Labels8 setText: @"3.5.5故意损毁或破坏租赁车辆、设备设施的；" lineSpacing:5];
        _Labels8.font = [UIFont systemFontOfSize:15];
        _Labels8.textColor = DSColorFromHex(0x323232);
        _Labels8.textAlignment = NSTextAlignmentLeft;
        _Labels8.numberOfLines =0;
    }
    return _Labels8;
}
-(UILabel *)Labels9{
    if (!_Labels9) {
        _Labels9 = [[UILabel alloc]init];
        [_Labels9 setText: @"3.5.6非法攻击或侵入租赁运营管理系统的；" lineSpacing:5];
        _Labels9.font = [UIFont systemFontOfSize:15];
        _Labels9.textColor = DSColorFromHex(0x323232);
        _Labels9.textAlignment = NSTextAlignmentLeft;
        _Labels9.numberOfLines =0;
    }
    return _Labels9;
}
-(UILabel *)Labels10{
    if (!_Labels10) {
        _Labels10 = [[UILabel alloc]init];
        [_Labels10 setText: @"3.5.7达不到用户信用标准；" lineSpacing:5];
        _Labels10.font = [UIFont systemFontOfSize:15];
        _Labels10.textColor = DSColorFromHex(0x323232);
        _Labels10.textAlignment = NSTextAlignmentLeft;
        _Labels10.numberOfLines =0;
    }
    return _Labels10;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView* bgscrollow = [[UIScrollView alloc]init];
    bgscrollow.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    bgscrollow.delegate = self;
   
    [self.view addSubview:bgscrollow];
    [bgscrollow addSubview:self.titleLabel];
    [bgscrollow addSubview:self.detailLabel];
    [bgscrollow addSubview:self.oneLabel];
    [bgscrollow addSubview:self.dOneLabel];
    [bgscrollow addSubview:self.twoLabel];
    [bgscrollow addSubview:self.dtwoLabel];
    [bgscrollow addSubview:self.threeLabel];
    [bgscrollow addSubview:self.dThreeLabel];
    
    [bgscrollow addSubview:self.Label1];
    [bgscrollow addSubview:self.Label2];
    [bgscrollow addSubview:self.Label3];
    [bgscrollow addSubview:self.Label4];
    [bgscrollow addSubview:self.Label5];
    [bgscrollow addSubview:self.Label6];
    [bgscrollow addSubview:self.Label7];
    [bgscrollow addSubview:self.Label8];
    [bgscrollow addSubview:self.Label9];
    [bgscrollow addSubview:self.Label10];
    
    
    [bgscrollow addSubview:self.Labels1];
    [bgscrollow addSubview:self.Labels2];
    [bgscrollow addSubview:self.Labels3];
    [bgscrollow addSubview:self.Labels4];
    [bgscrollow addSubview:self.Labels5];
    [bgscrollow addSubview:self.Labels6];
    [bgscrollow addSubview:self.Labels7];
    [bgscrollow addSubview:self.Labels8];
    [bgscrollow addSubview:self.Labels9];
    [bgscrollow addSubview:self.Labels10];
    self.titleLabel.frame = CGRectMake(10, 15, SCREENWIDTH-20, [self.titleLabel.text heightForFont:[UIFont systemFontOfSize:15] width:SCREENWIDTH]);
    
   self.detailLabel.frame = CGRectMake(10, 15+self.titleLabel.ctBottom, SCREENWIDTH-20, -40+[self.detailLabel.text heightForFont:[UIFont systemFontOfSize:20] width:SCREENWIDTH-20]);
    self.oneLabel.frame = CGRectMake(10, 15+self.detailLabel.ctBottom, SCREENWIDTH-20, -30+[self.oneLabel.text heightForFont:[UIFont systemFontOfSize:20] width:SCREENWIDTH-20]);
    self.dOneLabel.frame = CGRectMake(10, 15+self.oneLabel.ctBottom, SCREENWIDTH-20, -30+[self.dOneLabel.text heightForFont:[UIFont systemFontOfSize:20] width:SCREENWIDTH-20]);
    self.twoLabel.frame = CGRectMake(10, 15+self.dOneLabel.ctBottom, SCREENWIDTH-20, -30+[self.twoLabel.text heightForFont:[UIFont systemFontOfSize:20] width:SCREENWIDTH-20]);
    self.dtwoLabel.frame = CGRectMake(10, 15+self.twoLabel.ctBottom, SCREENWIDTH-20, -30+[self.dtwoLabel.text heightForFont:[UIFont systemFontOfSize:20] width:SCREENWIDTH-20]);
    self.threeLabel.frame = CGRectMake(10, 15+self.dtwoLabel.ctBottom, SCREENWIDTH-20, -30+[self.threeLabel.text heightForFont:[UIFont systemFontOfSize:20] width:SCREENWIDTH-20]);
    self.dThreeLabel.frame = CGRectMake(10, 15+self.threeLabel.ctBottom, SCREENWIDTH-20, -30+[self.dThreeLabel.text heightForFont:[UIFont systemFontOfSize:20] width:SCREENWIDTH-20]);
    self.Label1.frame = CGRectMake(10, 15+self.dThreeLabel.ctBottom, SCREENWIDTH-20, -30+[self.Label1.text heightForFont:[UIFont systemFontOfSize:20] width:SCREENWIDTH-20]);
   self.Label2.frame = CGRectMake(10, 15+self.Label1.ctBottom, SCREENWIDTH-20, [self.Label2.text heightForFont:[UIFont systemFontOfSize:15] width:SCREENWIDTH-20]);
    self.Label3.frame = CGRectMake(10, 15+self.Label2.ctBottom, SCREENWIDTH-20, -30+[self.Label3.text heightForFont:[UIFont systemFontOfSize:20] width:SCREENWIDTH-20]);
     self.Label4.frame = CGRectMake(10, 15+self.Label3.ctBottom, SCREENWIDTH-20, -30+[self.Label4.text heightForFont:[UIFont systemFontOfSize:20] width:SCREENWIDTH-20]);
     self.Label5.frame = CGRectMake(10, 15+self.Label4.ctBottom, SCREENWIDTH-20, -30+[self.Label5.text heightForFont:[UIFont systemFontOfSize:20] width:SCREENWIDTH-20]);
    self.Label6.frame = CGRectMake(10, 15+self.Label5.ctBottom, SCREENWIDTH-20, [self.Label6.text heightForFont:[UIFont systemFontOfSize:15] width:SCREENWIDTH-20]);
    self.Label7.frame = CGRectMake(10, 15+self.Label6.ctBottom, SCREENWIDTH-20, -30+[self.Label7.text heightForFont:[UIFont systemFontOfSize:20] width:SCREENWIDTH-20]);
    self.Label8.frame = CGRectMake(10, 15+self.Label7.ctBottom, SCREENWIDTH-20, [self.Label8.text heightForFont:[UIFont systemFontOfSize:15] width:SCREENWIDTH-20]);
    self.Label9.frame = CGRectMake(10, 15+self.Label8.ctBottom, SCREENWIDTH-20, -30+[self.Label9.text heightForFont:[UIFont systemFontOfSize:20] width:SCREENWIDTH-20]);
    self.Label10.frame = CGRectMake(10, 15+self.Label9.ctBottom, SCREENWIDTH-20, -30+[self.Label10.text heightForFont:[UIFont systemFontOfSize:20] width:SCREENWIDTH-20]);

     bgscrollow.contentSize = CGSizeMake(0, self.Label10.ctBottom+100);
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"用户服务协议"];
    }
    return self;
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
