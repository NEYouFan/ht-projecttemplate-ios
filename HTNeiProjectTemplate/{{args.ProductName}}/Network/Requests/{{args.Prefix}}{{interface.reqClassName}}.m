//
//  {{args.Prefix}}{{interface.reqClassName}}.m
//
//  Created by {{args.Author}}
//
//  Auto build by NEI Builder

#import "{{args.Prefix}}{{interface.reqClassName}}.h"
#import "HTNetworking.h"
#import "{{args.Prefix}}Models.h"

@implementation {{args.Prefix}}{{interface.reqClassName}}

+ (RKRequestMethod)requestMethod {
    return RKRequestMethod{{interface.method}};
}

+ (NSString *)requestUrl {
    return @"{{interface.path}}";
}

+ (RKMapping *)responseMapping {
    return {{#if (modelFilterHelper interface.outputModel)}}[{{args.Prefix}}{{interface.outputModel}} ht_modelMapping]{{else}}nil{{/if}};
}

+ (NSString *)keyPath {
    return {{#if interface.outputModelKey}}@"{{interface.outputModelKey}}"{{else}}nil{{/if}};
}

- (NSDictionary *)requestParams {
    NSDictionary *dic = [self ht_modelToJSONObject{{#if interface.reqVarHeaders.length}}:[self headerPropertyList]{{/if}}];
    if ([dic isKindOfClass:[NSDictionary class]] && [dic count] > 0) {
        return dic;
    }
    
    return nil;
}
{{#if interface.reqVarHeaders.length}}

- (NSArray *)headerPropertyList {
    return @[{{#each interface.reqVarHeaders}}@"{{key}}"{{#if @last}}{{' '}}{{else}}, {{/if}}{{/each}}];
}
{{/if}}
{{#if interface.reqHeaders.length}}

- (NSDictionary *)requestHeaderFieldValueDictionary {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    {{#each interface.reqConstHeaders}}
    [dic setObject:@"{{value}}" forKey:@"{{key}}"];{{#if description}} // {{description}} {{/if}}
    {{/each}}
    {{#each interface.reqVarHeaders}}
    if (nil != self.{{lowerFirst (hyphenToCamel key)}}) {
        [dic setObject:self.{{lowerFirst (hyphenToCamel key)}} forKey:@"{{key}}"];
    }
    {{/each}}
    return dic;
}
{{/if}}
@end
