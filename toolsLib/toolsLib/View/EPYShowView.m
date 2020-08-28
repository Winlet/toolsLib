////
////  EPYShowViiew.m
////  EasyPay
////
////  Created by uinpay on 2019/9/27.
////  Copyright © 2019 com.easypay. All rights reserved.
////
//
//#import "EPYShowView.h"
////#import "EPYLoginController.h"
////#import "EPYLoginNavController.h"
//
//#define IOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0
//
//@implementation EPYShowView
//
//- (void)showViewController:(UIViewController *)viewController message:(NSString *)msg{
//    dispatch_async(dispatch_get_main_queue(), ^{
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:msg preferredStyle:UIAlertControllerStyleAlert];
//     [viewController presentViewController:alert animated:YES completion:nil];
//    //控制提示框显示的时间为2秒
//     [self performSelector:@selector(dismiss:) withObject:alert afterDelay:0.5];
//    });
//}
//
//- (void)dismiss:(UIAlertController *)alert{
//    dispatch_async(dispatch_get_main_queue(), ^{
//    [alert dismissViewControllerAnimated:YES completion:nil];
//    });
//}
//
//+(void)showFailMessage:(id)msg viewControl:(nonnull id)object{
//    
//    if (msg) {
//        [EPYShowView showInViewController:object Title:@"失败" message:msg handler:nil];
//    }else{
//        [EPYShowView showInViewController:object Title:@"失败" message:@"未捕获到错误信息" handler:nil];
//    }
//    
//}
//
//+(void)showFailObject:(id)error viewControl:(nonnull id)object{
//    NSString *msg;
//    if ([error isKindOfClass:[NSString class]]) {
//        msg = error;
//    }else{
//        msg =  [((NSError*)error).userInfo objectForKey:NSLocalizedDescriptionKey];
//        NSInteger code = ((NSError*)error).code;
//        if (code == 403) {
//            [EPYShowView showInViewController:object Title:@"失败" message:msg handler:^(UIAlertAction * _Nonnull action) {
////                EPYLoginController * loginVC = [[EPYLoginController alloc] init];
////                EPYLoginNavController * loginNav = [[EPYLoginNavController alloc] initWithRootViewController:loginVC];
////                NSFileManager *fileManager = [NSFileManager defaultManager];
////                [fileManager removeItemAtPath:UserInfoPath error:nil];
////                [fileManager removeItemAtPath:userPswd error:nil];
////                [UIApplication sharedApplication].keyWindow.rootViewController = loginNav;
////                [[NSNotificationCenter defaultCenter] postNotificationName:LoginOutNotification object:nil];
//            }];
//            return;
//        }
//        if(code == 61002){
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:msg preferredStyle:UIAlertControllerStyleAlert];
//            [object presentViewController:alert animated:YES completion:nil];
//            [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
//            return ;
//        }
//    }
//    [EPYShowView showInViewController:object Title:@"失败" message:msg handler:nil];
//}
//
//+ (void)showInViewController:(UIViewController *)viewController Title:(NSString *)title message:(NSString *)message handler:(void (^ __nullable)(UIAlertAction *action))handler{
//    if (IOS8) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:handler];
//        [alert addAction:cancel];
//        [viewController presentViewController:alert animated:YES completion:nil];
//            });
//    } else {
//        dispatch_async(dispatch_get_main_queue(), ^{
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        
//        [alert show];
//        });
//        return;
//    }
//}
//
//+ (void)showInViewController:(UIViewController *)viewController Title:(NSString *)title message:(NSString *)message handlerArrayWithCancel:(NSArray <UIAlertAction * >*)handlerArray{
//    if (IOS8) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//            [alert addAction:cancel];
//            for (UIAlertAction *action in handlerArray) {
//                [alert addAction:action];
//            }
//            [viewController presentViewController:alert animated:YES completion:nil];
//        });
//    }
//}
//
//+ (void)showInViewController:(UIViewController *)viewController Title:(NSString *)title message:(NSString *)message handlerArray:(NSArray <UIAlertAction * >*)handlerArray{
//    if (IOS8) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
//            for (UIAlertAction *action in handlerArray) {
//                [alert addAction:action];
//            }
//            //解决多弹框显示错误问题
////            if (viewController.presentedViewController) {
////                [viewController dismissViewControllerAnimated:NO completion:^{
////                    [viewController presentViewController:alert animated:NO completion:nil];
////                }];
////            }else{
//                [viewController presentViewController:alert animated:NO completion:nil];
////            }
//            
//        });
//        
//    }
//}
//
//@end
