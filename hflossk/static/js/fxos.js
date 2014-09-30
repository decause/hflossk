(function (){
    var btn = document.getElementById("mozinstall");
    console.log("mozinstall?")
    btn.addEventListener("click", function(e) {
        navigator.mozApps.install("http://hfoss-fossrit.rhcloud.com/static/manifest.webapp");
        console.log("mozinstalled!")
    });
})();
