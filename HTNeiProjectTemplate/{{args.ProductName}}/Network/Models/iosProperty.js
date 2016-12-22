'use strict';

Handlebars.registerHelper('iosPropertyxxx', function(datatype, hasPrefix){     
    let isObject= function (obj) {         
        return ({}).toString.call(obj).toLowerCase() === '[object object]';     
        
    };     
    
    let helper = function(field, prefix) {         
        let noStar = null;         
        let refName = null;         
        let type;         
        if(field.format !== neiDbConst.MDL_FMT_HASH || !hasPrefix){             
            type = field.type;         
            
        }else{ 
            type = prefix + field.type;         
            
        }         
        
        if (field.itemIsArray || field == undefined) {             
            noStar = 0;             
            refName = 'strong';             
            type = 'NSArray<' + type + ' *>';         
            
        } else {             
            switch (field.format) {                 
                case neiDbConst.MDL_FMT_NUMBER:                 
                case neiDbConst.MDL_FMT_BOOLEAN:                     
                    noStar = 1;                     
                    refName = "assign";                     
                    break;                 
                case neiDbConst.MDL_FMT_STRING:                     
                    refName = "copy";                     
                    noStar = 0;                     
                    break;                 
                case neiDbConst.MDL_FMT_HASH:                     
                    refName = "strong";                     
                    noStar = 0;                     
                    break;                 
                default:                     
                    break;             
                
            }         
            
        }         
        let header= `/**\n *  ${field.description}\n */\n`;         
        return header + `@property (nonatomic, ${refName}) ${type} ${noStar?"":"*"}${field.name};`     
        
    };      
    if(isObject(datatype)) {         
        return new Handlebars.SafeString(datatype.fields && datatype.fields.map(x=> {
            return helper(x,this.args.Prefix);           
            
        }).join('\n'));     
        
    }else if(Array.isArray(datatype)){         
        return new Handlebars.SafeString(datatype.map(x=> {             
            return helper(x,this.args.Prefix);         }).join('\n'));     } });
