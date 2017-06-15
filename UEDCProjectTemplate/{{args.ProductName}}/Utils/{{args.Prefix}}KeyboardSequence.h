//
//  {{args.Prefix}}KeyboardSequence.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 07/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 管理一个输入框的序列，使输入更加方便.
 
 当页面有多个输入框，而且希望一个输入框输入完成后，可以按键盘的 return 键继续在下一个输入框输入时，
 可以借用该类提供的方法. 示例可以参考 {{args.Prefix}}LoginController 中的用户名、密码输入框的管理
 
 @note 该类中的方法只适用于 UITextView 及 UITextField.
 */
@interface {{args.Prefix}}KeyboardSequence : NSObject

/**
 UITextField, UITextView 代理对象.
 
 由于本类处理了一些 UITextFiled 和 UITextView 的代理方法， 所以本类实例被设置为 UITextField 和 UITextView 的代理，当调用者需要自己再进行某些处理时，需要设置该代理对象，本类中的方法实现会将 UITextField 和 UITextView 的代理方法转发给 delegate
 */
@property(nonatomic, weak) id <UITextFieldDelegate, UITextViewDelegate> delegate;

/**
 添加一个 UITextField 或 UITextView 到输入框序列中.

 @param textFieldView 待添加的输入框.
 */
-(void)addTextFieldView:(UIView *)textFieldView;

/**
 添加一个 UITextField 或 UITextView 到输入框序列中.

 @param textFieldView 待添加的输入框
 @param returnKeyType textFieldView 处于输入状态时，return 键的类型
 */
-(void)addTextFieldView:(UIView *)textFieldView returnKeyType:(UIReturnKeyType)returnKeyType;

/**
 替换输入框序列中指定 index 的 UITextField 或 UITextView

 @param index 指明替换输入框序列中的第几个输入框(第一个输入框的 index 为 0).
 @param textFieldView 用于替换原输入框的新输入框.
 @param returnKeyType textFieldView 处于输入状态时，return 键的类型.
 */
-(void)replaceTextFieldViewAtIndex:(NSInteger)index withTextFieldView:(UIView *)textFieldView returnKeyType:(UIReturnKeyType)returnKeyType;

/**
 删除输入框序列中的某个输入框.

 @param textField 需要删除的输入框.
 */
-(void)removeTextFieldView:(UIView *)textField;

@end
