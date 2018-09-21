//
//  MineInformationController.m
//  Psf
//
//  Created by 燕来秋mac9 on 2018/6/26.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "MineInformationController.h"
#import "HeadimageTableViewCell.h"

#import "MineServiceApi.h"
//#import "UploadImageTool.h"
#import "UIImage+Resize.h"


@interface MineInformationController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSArray *dataArr;


@property(nonatomic,strong)NSMutableArray *imageArr;
@property(nonatomic,strong)UITextField *nameField;

@property(nonatomic,strong)MineInformationReq *result;
@end

@implementation MineInformationController

-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorColor = DSColorFromHex(0xF0F0F0);
        _tableview.tableFooterView = [[UIView alloc]init];
        _tableview.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _tableview;
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"个人信息"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        _tableview.contentInsetAdjustmentBehavior = NO;
    } else {
        self.navigationController.navigationBar.translucent = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.tableview];
   
    _dataArr = @[@"头像",@"昵称",@"性别",@"生日"];
    _imageArr = [NSMutableArray array];
    [self requestData];
}
-(void)requestData{
    BaseModelReq *req = [[BaseModelReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.timestamp = @"0";
    req.appId = @"997303469549645826";
    req.platform = @"ios";
    self.result = [[MineInformationReq alloc]init];
    __weak typeof(self)weakself = self;
    [[MineServiceApi share]getMemberInformationWithParam:req response:^(id response) {
        if (response) {
            
            weakself.result = response;
            [weakself.tableview reloadData];
        }
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section ==0) {
        return 1;
    }else if (section ==1){
        return 3;
    }
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section ==0) {
        return 0;
    }
    return 5;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = DSColorFromHex(0xF0F0F0);
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        return 101;
    }
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        static NSString *identify = @"HeadimageTableViewCell";
        HeadimageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[HeadimageTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
        }
        [cell setResult:self.result];
        return cell;
    }
    static NSString *identify = @"identify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    
 
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.textColor = DSColorFromHex(0x323232);
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.detailTextLabel.textColor = DSColorFromHex(0x959595);
    cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
    if (indexPath.section ==1) {
        if (indexPath.row ==0) {
            cell.textLabel.text = @"昵称";
            cell.detailTextLabel.text = self.result.memberName;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row==1){
            cell.textLabel.text = @"姓名";
            cell.detailTextLabel.text = self.result.memberName;
        }else{
            cell.textLabel.text = @"实名认证";
            if (self.result.idCardNo.length>0) {
                cell.detailTextLabel.text = @"已认证";
            }else{
                cell.detailTextLabel.text = @"未认证";
            }
            
        }
    }else if (indexPath.section ==2){
        if (indexPath.row ==0) {
            cell.textLabel.text = @"手机号";
            cell.detailTextLabel.text = self.result.phoneNumber;
           
        }else if (indexPath.row==1){
            cell.textLabel.text = @"微信";
            cell.detailTextLabel.text = self.result.memberName;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    return cell;
}
#pragma mark - HTTPRequest
- (NSInteger)sendImageRequest:(UIImage *)image
{
    [_imageArr removeAllObjects];
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    NSString *dataStr = [data base64EncodedStringWithOptions:0];
    NSString * fileName = [NSString stringWithFormat:@"data:image/jpg;base64,%@",dataStr];
    [_imageArr addObject:fileName];
   
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    __weak typeof(self)weakself = self;
//    [[UploadImageTool share] getQiniuUploadWithImages:self.imageArr Token:^(NSArray *uploadDic) {
//        if (uploadDic) {
//
//            ImageModel *model = [uploadDic firstObject];
//            weakself.result.memberAvatarPath = [NSString stringWithFormat:@"%@%@",IMAGEHOST,model.fileOriginalPath];
//            weakself.result.memberAvatarId = model.fileId;
//            [weakself.tableview reloadData];
//        }
//        [hud setHidden:YES];
//    } failure:^{
//        [hud setHidden:YES];
//        [self showToast:@"头像上传失败"];
//    }];
   
    return 0;
}
//手机拍照
-(void)takePhotoWithTag
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.allowsEditing = NO;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

// 获取图库
-(void)localPhotoWithTag
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = NO;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self)weakself = self;
    if (indexPath.section == 0) {
        UIActionSheet *leftAction = [[UIActionSheet alloc] initWithTitle:@"上传头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍摄照片", @"选择手机中的照片", nil];
        leftAction.tag = 101;
        [leftAction showInView:self.view];
    }
}
#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex  {
    if (buttonIndex == 0) {
        [self takePhotoWithTag];
    }  else if(buttonIndex == 1) {
        [self localPhotoWithTag];
    }
}

//处理图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    image = [image resizedImageWithContentMode:UIViewContentModeScaleAspectFit bounds:CGSizeMake(640, 640) interpolationQuality:kCGInterpolationMedium];
    //
    [self sendImageRequest:image];
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
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
