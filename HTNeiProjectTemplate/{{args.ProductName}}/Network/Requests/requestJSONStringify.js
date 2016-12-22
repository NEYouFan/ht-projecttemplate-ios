Handlebars.registerHelper('requestJSONStringify', function(inputs) {      
    return inputs.filter(x => {        
        return x.format == 0;
    }).map(x => {          
        return `@class ${this.args.Prefix}${x.type};`;      
    }).join('\n');      
});
