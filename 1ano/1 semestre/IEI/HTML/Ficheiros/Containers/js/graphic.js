function draw() {
    $("#myGraph").highcharts({
    chart: { type: "line" },
    title: { text: "Temperatures Average" },
    xAxis: { categories: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun",
    "Jul", "Ago", "Set", "Out", "Nov", "Dez"]
    },
    series:[
    { name: "Lisboa",
    data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
    },
    ]
    });
    }