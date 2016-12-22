/**
 * 用户自定义Handlebars辅助函数，该辅助函数的优先级高于nei-toolkit系统定义的辅助函数。
 *
 * 如何定义Handlebars辅助函数请参考:
 * https://github.com/NEYouFan/nei-toolkit/blob/dev/doc/Handlebars%E8%BE%85%E5%8A%A9%E5%87%BD%E6%95%B0%E9%9B%86.md#
**/
Handlebars.registerHelper('modelFilterHelper', function (obj) {
    return obj=='Object' || obj=='NSString' || obj == 'CGFloat' ? '' : obj;
});