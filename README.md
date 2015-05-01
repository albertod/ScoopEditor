# ScoopEditor
Scoop News Manager

Hay dos cuentas de editores para la aplicion:

USER:albertodm PASS:cloudcomputing

USER:a PASS: a

Imagenes son subidas en background entonces pueden tardar un tiempo en ser subidas al servidor. 

Codigo "Cloud Code" que actualiza las noticas No Publicadas a Publicadas para ser leidas por los usuarios.

Parse.Cloud.job("uploadNews", function(request, status) {
  // Set up to modify user data
  Parse.Cloud.useMasterKey();
  var query = new Parse.Query("ADMNew");
  query.equalTo("publicated", "No-Publicated");
  query.find({
    success: function(results) {
       
      if( results.length == 0){
        response.success("No New News");
      }
      else
      {
        var sum = 0;
        for (var i = 0; i < results.length; ++i) {
            results[i].set("publicated","Publicated")
            results[i].save();
        }
        response.success("News published");
      }     
    },
    error: function() {
      response.error("Error Fetching the news");
    }
  });
});
