
//
//  {{args.Prefix}}Requests.h
//
//  Created by {{args.Author}}
//
//  Auto build by NEI Builder
{{#each ds.interfaces}}
#import "{{../args.Prefix}}{{reqClassName}}.h"
{{/each}}
