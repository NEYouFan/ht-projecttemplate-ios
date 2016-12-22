//
//  {{args.Prefix}}{{interface.reqClassName}}.h
//
//  Created by {{args.Author}}
//
//  Auto build by NEI Builder

#import "{{args.BaseRequest}}.h"
{{requestJSONStringify interface.inputs}}
/**
 *  name: {{interface.name}}
 *  description: {{interface.description}}
 */
@interface {{args.Prefix}}{{interface.reqClassName}} : {{args.BaseRequest}}

{{#each interface.reqVarHeaders}}
/**
 *  {{description}}
 */
@property (nonatomic, copy) NSString *{{lowerFirst (hyphenToCamel key)}};

{{/each}}

{{iosProperty interface.inputs hasPrefix=true datatypes=_ds.datatypes}}

@end
