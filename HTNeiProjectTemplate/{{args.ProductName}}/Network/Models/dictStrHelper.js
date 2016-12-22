Handlebars.registerHelper('dictStrHelper', function(datatype) {
    var a = Object.keys(datatype.depModels).map((name) => {
        return `@"${name}" : @"${this.args.Prefix}${datatype.depModels[name]}"`;
    }).join(", ");
    return new Handlebars.SafeString('@{' + a +'}');
});
