Handlebars.registerHelper('baseStrHelper', function(datatype) {
                          var a = datatype.fields.filter((field) => {
                                return (!datatype.depModels[field.name])
                            }).map((field)=>{
                                return `@"${field.name}"`;
                            }).join(", ");
                          return new Handlebars.SafeString('@[' + a +']');
                          });