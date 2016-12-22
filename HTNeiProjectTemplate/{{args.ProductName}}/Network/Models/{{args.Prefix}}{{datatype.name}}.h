//
//  {{args.Prefix}}{{datatype.name}}.h
//
//  Created by {{args.Author}}
//
//  Auto build by NEI Builder


#import "{{args.BaseModel}}.h"

{{!-- pre classes --}}
{{#each datatype.depModels}}
@class {{../args.Prefix}}{{this}};
{{/each}}

/**
 *  {{datatype.description}}
 */
@interface {{args.Prefix}}{{datatype.name}} : {{args.BaseModel}}
{{iosProperty datatype datatypes=_ds.datatypes}}

@end
