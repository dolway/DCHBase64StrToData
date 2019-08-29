//
//  ViewController.m
//  保存到相册
//
//  Created by dolway on 2019/8/26.
//  Copyright © 2019 iss. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>

#import "NSData+base64.h"

@interface ViewController ()
- (IBAction)saveToAlbum:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
//- (UIViewController *)currentViewController {
//    UIWindow *window = [[UIApplication sharedApplication].delegate window];
//    UIViewController *presentedVC = [[window rootViewController] presentedViewController];
//    if (presentedVC) {
//        return presentedVC;
//
//    } else {
//        return window.rootViewController;
//    }
//}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://ch.amwaynet.com.cn/content/china/accl/ch/business-opportunity/development/2019/0515100.html?isShare=true"]]];
    [self.view addSubview:web];


    return;
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"123" message:@"345" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"123" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }]];

    [self presentViewController:alert animated:YES completion:nil];
    
    return;
    

    dispatch_queue_t queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    queue = dispatch_get_main_queue();
    //使用dispatch_apply()函数控制提交的任务代码块执行5次，该函数所需的代码块可以带一个参数，这个参数表示当前正在执行第几次
    dispatch_apply(5,queue,^(size_t time){
        NSLog(@"---执行%lu次---%@",time,[NSThread currentThread]);
        
        if ([[NSThread currentThread] isMainThread]) {

        }else{
            dispatch_async(dispatch_get_main_queue(), ^{

            });
        }
        
    });

    

    //在这里执行事件
    UIAlertController *oldAlert ;
    if (self.presentedViewController != nil && [self.presentedViewController isKindOfClass:UIAlertController.class]) {
        oldAlert  = (UIAlertController *)self.presentedViewController;
        [oldAlert dismissViewControllerAnimated:YES completion:nil];
    }
    
    UIAlertController * alert1 = [UIAlertController alertControllerWithTitle:@"1" message:@"1" preferredStyle:UIAlertControllerStyleAlert];
    [alert1 addAction:[UIAlertAction actionWithTitle:@"1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (oldAlert != nil) {
            [self presentViewController:oldAlert animated:YES completion:nil];
        }
        
    }]];
    
    [self presentViewController:alert1 animated:YES completion:nil];

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAlertController *oldAlert ;
        if (self.presentedViewController != nil && [self.presentedViewController isKindOfClass:UIAlertController.class]) {
            oldAlert  = (UIAlertController *)self.presentedViewController;
            [oldAlert dismissViewControllerAnimated:YES completion:nil];
        }

        UIAlertController * alert1 = [UIAlertController alertControllerWithTitle:@"45666565756757567575" message:@"45666565756757567575" preferredStyle:UIAlertControllerStyleAlert];
        [alert1 addAction:[UIAlertAction actionWithTitle:@"45666565756757567575" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (oldAlert != nil) {
                [self presentViewController:oldAlert animated:YES completion:nil];
            }
        }]];
        
        [self presentViewController:alert1 animated:YES completion:nil];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAlertController *oldAlert ;
        if (self.presentedViewController != nil && [self.presentedViewController isKindOfClass:UIAlertController.class]) {
            oldAlert  = (UIAlertController *)self.presentedViewController;
            [oldAlert dismissViewControllerAnimated:YES completion:nil];
        }
        
        UIAlertController * alert1 = [UIAlertController alertControllerWithTitle:@"2" message:@"2" preferredStyle:UIAlertControllerStyleAlert];
        [alert1 addAction:[UIAlertAction actionWithTitle:@"2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (oldAlert != nil) {
                [self presentViewController:oldAlert animated:YES completion:nil];
            }
        }]];
        
        [self presentViewController:alert1 animated:YES completion:nil];
    });
}


- (void)saveToAlbum:(id)sender {
    
    [self checkAlbumStates];
  
}


// 判断相册权限状态
- (void)checkAlbumStates {
      // 0.判断状态
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
      if (status == PHAuthorizationStatusDenied) {
        NSLog(@"用户拒绝当前应用访问相册,我们需要提醒用户打开访问开关");


          UIAlertController * alert1 = [UIAlertController alertControllerWithTitle:@"标题" message:@"提示信息" preferredStyle:UIAlertControllerStyleAlert];
          [alert1 addAction:[UIAlertAction actionWithTitle:@"前往设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
              NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
              if ([[UIApplication sharedApplication] canOpenURL:url]) {

                  [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];

              }
          }]];
          [self presentViewController:alert1 animated:YES completion:nil];
          

      }else if (status == PHAuthorizationStatusRestricted){
        NSLog(@"家长控制,不允许访问");
          UIAlertController * alert1 = [UIAlertController alertControllerWithTitle:@"2" message:@"家长控制,不允许访问" preferredStyle:UIAlertControllerStyleAlert];
          [alert1 addAction:[UIAlertAction actionWithTitle:@"2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
              
              
          }]];
          [self presentViewController:alert1 animated:YES completion:nil];
      
      }else if (status == PHAuthorizationStatusNotDetermined){
        NSLog(@"用户还没有做出选择");
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
              
              if (status == PHAuthorizationStatusNotDetermined) { // 未确定
                  
              }else if (status == PHAuthorizationStatusRestricted){ // 受限
                  
              }else if (status == PHAuthorizationStatusDenied){ //拒绝
                  NSLog(@"用户拒绝当前应用访问相册");
              }else if (status == PHAuthorizationStatusAuthorized){ // 同意
                  NSLog(@"用户允许当前应用访问相册");
                  [self loadImage];
              }
            
          }];
          
      }else if (status == PHAuthorizationStatusAuthorized){
        NSLog(@"用户允许当前应用访问相册");
          [self loadImage];

      }
}

- (void)loadImage{
    
    UIImage *image1 = [UIImage imageNamed:@"WX20190827-171658"];
    NSString * standbyJSStr ;//=
    [self imageToString:image1];
    
    NSLog(@"%@",standbyJSStr);
    
    standbyJSStr = @"iVBORw0KGgoAAAANSUhEUgAAAA8AAAAOCAYAAADwikbvAAABR2lDQ1BJQ0MgUHJvZmlsZQAAKJFjYGASSSwoyGFhYGDIzSspCnJ3UoiIjFJgf8zAwSDNwMUgzKCVmFxc4BgQ4ANUwgCjUcG3awyMIPqyLsisrPTyas9TBt/k6tne39R5+hBTPQrgSkktTgbSf4A4I7mgqISBgTEFyFYuLykAsTuAbJEioKOA7DkgdjqEvQHEToKwj4DVhAQ5A9k3gGyB5IxEoBmML4BsnSQk8XQkNtReEOALyMjMySwoVjC0NAgzIeBgUkFJakUJiHbOL6gsykzPKFFwBIZSqoJnXrKejoKRgaElAwMozCGqP98AhyWjGAdCLLOYgcGCBeR/hFiqIgPDTkkGBt4IhJiGE9ArjxgYjlgUJBYlwh3A+I2lOM3YCMLm3s7AwDrt///P4QwM7JoMDH+v////e/v//3+XMTAw32JgOPANAPokYDZDIHpuAAACbklEQVQoFX1SPUwUQRh9M7t3u9zxIwdKFEI4IcYKgoJgNBZaaKEJJhpjYewttbSztLA0sdDERKMWJhY2JhIIGBP/UIkg/iHIgQVyyMHt7d7ezvhmIf407maym5l573vfe5/wvKIO79yEGn8NQHMJrv88UgKJBIRbBVv7AfTH98RpyLYsEIZQ87l/0eIvQqWAgBguqXOz0L5PLKuS0T1yDDqRhLVjJ6ztHfGepiLzriv7w2urmS8x0IDDqUlYrVlEPK82JEpDWBarlKCW8/AfPgCKa787s/WGRGfvfiJqELwdYz8uZMNm+E9HEH76APVzGdKSVFgy3cHp3wddLrPnpUVuKITzc0ifOgNlqlF+ODsNEJA6ehzScVAaGUT5+0K8l+jthy55kCq/FMurzHyFqEohyi/C3b0HIU0UqWoUbt/guUKUm4NiEVGfgSoUsHL9GiQq4brTTVsha+pg1TcgWshhbegxZKYRmQsXUXoyjPL059gvZxeJ2arb3UO3KdNqbUN64AS0t0aCWgRTE6g7fRZCCkRsq5L7BmHMZmROTx8qbMmhdNtEYH68kSE4nV2MxobyiggmxuG/GUNVbx9SBw5ilZWtxi2QjU1s7QdsFrQNY/H+XUSVCnxOWfrQYThdPXQzgL2thU7nEbx6HodrZ9upYgaqSPKXz2AbKYJGSPPlFW/wEcToEOCmkGxuRrKzGxXmr3lut3ECpQW7uQUr925BrFy+pN2Bk1i9eiV22zipYhPjYuQm5cZK0iSRTiOR7YDclIFttXMEfY8XJGrPnYdaLTCmSZTfjSNirsJMhRlOfspjL+JYS6PDkKk0fgFtfCRo0Uo6qQAAAABJRU5ErkJggg==";
   
    NSData *imagedata ;//= [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://f.hiphotos.baidu.com/image/pic/item/b151f8198618367aa7f3cc7424738bd4b31ce525.jpg"]];
    
    imagedata = [[NSData alloc] initWithBase64EncodedString:standbyJSStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
//   NSData *imagedata1 = [[NSData alloc] initWithBase64EncodedString:standbyJSStr];
    if (imagedata == nil) {
        NSLog(@"没有图片数据");
        return;
    }
    
    UIImage *image = [UIImage imageWithData:imagedata];
    
    //获取app名字
    NSString *title = [NSBundle mainBundle].infoDictionary[(__bridge NSString*)kCFBundleNameKey];
    [self savePhoto:image toAlbum:title];
}

#pragma mark - 该方法获取在图库中是否已经创建该App的相册
//该方法的作用,获取系统中所有的相册,进行遍历,若是已有相册,返回该相册,若是没有返回nil,参数为需要创建的相册名称
- (PHAssetCollection *)fetchAssetColletion:(NSString *)albumTitle

{
    // 获取所有的相册
    PHFetchResult *result = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    
    //遍历相册数组,是否已创建该相册
    for (PHAssetCollection *assetCollection in result) {
        
        if ([assetCollection.localizedTitle isEqualToString:albumTitle]) {
            
            return assetCollection;
        }
    }
    return nil;
}

#pragma mark - 保存图片的方法
- (void)savePhoto:(UIImage *)image toAlbum:(NSString *)albumTitle
{
    //修改系统相册用PHPhotoLibrary单例,调用performChanges,否则苹果会报错,并提醒你使用
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{

        // 2.保存你需要保存的图片到系统相册
        PHAssetChangeRequest *assetChangeRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
        
        
        // 调用判断是否已有该名称相册
        PHAssetCollection *assetCollection = [self fetchAssetColletion:albumTitle];
        
        //创建一个操作图库的对象
        PHAssetCollectionChangeRequest *assetCollectionChangeRequest;
        
        if (assetCollection) {
            // 已有相册
            assetCollectionChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:assetCollection];
            
        } else {
            // 1.创建自定义相册
            assetCollectionChangeRequest = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:albumTitle];
        }
        

        // 3.把创建好图片添加到自己相册
        
        //这里使用了占位图片,为什么使用占位图片呢
        
        //这个block是异步执行的,使用占位图片先为图片分配一个内存,等到有图片的时候,再对内存进行赋值
        
        PHObjectPlaceholder *placeholder = [assetChangeRequest placeholderForCreatedAsset];

        [assetCollectionChangeRequest insertAssets:@[placeholder] atIndexes:[NSIndexSet indexSetWithIndex:0]];
        
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"保存失败");
        } else {
            NSLog(@"保存成功");
        }
    }];
}


// 图片转64base字符串

- (NSString *)imageToString:(UIImage *)image {
    
    NSData *imagedata = UIImagePNGRepresentation(image);
    
    NSString *image64 = [imagedata base64EncodedString];
    
    return image64;
    
}

@end
