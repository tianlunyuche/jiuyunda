//
//  ZXNewAddressViewModel.m
//  WineShopping
//
//  Created by xinying on 2017/4/21.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXNewAddressViewModel.h"
#import "ZXMapViewModel.h"
#import "ZXNewAddressVC.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>

@interface ZXNewAddressViewModel ()<CNContactPickerDelegate>

@end

@implementation ZXNewAddressViewModel

- (instancetype)initWithService:(id<ZXViewModelServices>)service params:(NSDictionary *)params
{
    self = [super initWithService:service params:params];
    if (self)
    {
        [self initViewModel];
    }
    return self;
}

- (void)initViewModel
{
    @weakify(self);
    [[ZXMapManager manager].locationSubject subscribeNext:^(id x) {
        @strongify(self);
        NSDictionary *dic = x[@"address"];
        NSString *address = [NSString stringWithFormat:@"%@ %@ %@ %@",dic[@"admin"],dic[@"city"],dic[@"county"],dic[@"detail"]];
        self.addressString = address;
    }];
    self.saveCommand    = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSString *name  = input[@"name"];
        NSNumber *sex   = input[@"sex"];
        NSString *phone = input[@"phone"];
        NSString *addre = input[@"address"];
        NSString *detail= input[@"detailAddress"];
        if (name.length <= 0)
        {
            SHOW_ERROE(@"请输入姓名");
            DISMISS_SVP(1.2);
        }
        else if(phone.length <= 0)
        {
            SHOW_ERROE(@"请输入手机号");
            DISMISS_SVP(1.2);
        }
        else if (addre.length <= 0)
        {
            SHOW_ERROE(@"请选择地址");
            DISMISS_SVP(1.2);
        }
        else
        {
            ZXLog(@"保存地址");
            if (self.address)
            {
                [self.address setValuesForKeysWithDictionary:@{@"w_name":name,
                                                               @"w_address":addre,
                                                               @"w_phone":phone,
                                                               @"w_sex":sex,
                                                               @"w_detailAddress":detail}];
            }
            else
            {
                ZXAddress *address = [[ZXAddress alloc]init];
                [address setValuesForKeysWithDictionary:@{@"w_name":name,
                                                          @"w_address":addre,
                                                          @"w_phone":phone,
                                                          @"w_sex":sex,
                                                          @"w_detailAddress":detail}];
                [CURRENT_USER.address addObject:address];
            }
            [self.naviImpl popViewControllerWithAnimation:YES];
        }
        return [RACSignal empty];
    }];
    
    
    self.addressCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        ZXMapViewModel *viewModel = [[ZXMapViewModel alloc]initWithService:self.services params:@{@"title":@"address"}];
        self.naviImpl.className = @"ZXMapVC";
        [viewModel.addressSubject subscribeNext:^(id x) {
            @strongify(self);
            self.addressString = [NSString stringWithFormat:@"%@ %@ %@",x[@"city"],x[@"name"],x[@"address"]];
        }];
        [self.naviImpl pushViewModel:viewModel animated:YES];
        
        return [RACSignal empty];
    }];
    
    self.phoneBookCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        CNContactPickerViewController *vc = [[CNContactPickerViewController alloc]init];
        vc.delegate = self;
        [self.vc presentViewController:vc animated:YES completion:nil];
        return [RACSignal empty];
    }];
}

- (void)setAddress:(ZXAddress *)address
{
    _address = address;
    self.deleteCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [CURRENT_USER.address removeObject:self.address];
        [self.naviImpl popViewControllerWithAnimation:YES];
        return [RACSignal empty];
    }];
}

#pragma CNContactPickerDelegate

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty
{
    ZXLog(@"---%@",contactProperty);
    if ([contactProperty.key isEqualToString:@"phoneNumbers"])
    {
        //        选中的为手机号
        CNPhoneNumber *number   = contactProperty.value;
        NSString *string        = number.stringValue;
        self.phoneNum           = [string stringByReplacingOccurrencesOfString:@"-" withString:@" "];
        NSString *name          =  contactProperty.contact.givenName;
        self.phoneName          = name;
    }
}


@end
