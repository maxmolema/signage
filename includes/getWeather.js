function getWeather() {
    airports = require('electron').remote.getGlobal('airports')
    airports.forEach(element => {
        getMetar(element);
        getTaf(element);
    });
}

window.onload(setInterval(getWeather(), 5000))


function getMetar(icao) {
    $.ajax({
        type: "GET",
        url: "https://api.met.no/weatherapi/tafmetar/1.0/" + "metar" + ".txt?icao=" + icao + "",
        dataType: "text",
        success: function (data) { processData(data) }
    });

    function processData(data) {
        var lines = data.trim().split('\n');
        var lastLine = lines[lines.length - 1].split(',');

        lastLine.forEach(function (value, i) {
            document.getElementById('weather').innerHTML += "   " + icao.toUpperCase() + " METAR: " + lastLine;
        })
    }

}

function getTaf(icao) {
    $.ajax({
        type: "GET",
        url: "https://api.met.no/weatherapi/tafmetar/1.0/" + "taf" + ".txt?icao=" + icao + "",
        dataType: "text",
        success: function (data) { processData(data) }
    });

    function processData(data) {
        var lines = data.trim().split('\n');
        var lastLine = lines[lines.length - 1].split(',');

        lastLine.forEach(function (value, i) {
            document.getElementById('weather').innerHTML += "   " + icao.toUpperCase() + " TAF: " + lastLine;
        })
    }

}