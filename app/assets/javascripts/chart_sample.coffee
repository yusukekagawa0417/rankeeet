window.draw_graph = -> 
    ctx = document.getElementById("myChart").getContext('2d')
    barNum = gon.data.length
    labels = new Array(barNum)
    bgColors = new Array(barNum)
    bdColors = new Array(barNum)
    # $(window).on 'load resize', ->
    w = $('.graph').width()
    h = $('.graph').height() * barNum + 1
    $('#myChart').attr('width', w)
    $('#myChart').attr('height', h)
    for i in [0...barNum]
        labels[i] = gon.namedata[i]
        bgColors[i] = 'rgba(255, 200, 0, 0.5)'
        bdColors[i] = 'rgba(255, 200, 0, 1)'
    myChart = new Chart(ctx, {
        type: 'horizontalBar',
        data: {
            labels: labels
            datasets: [{
                label: '票数',
                data: gon.data,
                backgroundColor: bgColors,
                borderColor: bdColors,
                borderWidth: 1      
            }]
        },
        options: {
            scales: {
                xAxes: [{
                    ticks: {
                        min: 0,
                        stepSize: 1,
                        beginAtZero:true
                    }
                }]
            }
        }
    })