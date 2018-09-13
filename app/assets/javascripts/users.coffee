# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.draw_graph = -> 
    ctx = document.getElementById("myChart1").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'horizontalBar',
        data: {
            labels: ["組織階層", "会話", "意思決定", "議論", "対立", "責任", "信頼関係", "評価"],
            datasets: [{
                label:'フラット'
                data: gon.organizationtype1 
                backgroundColor: [
                    '#f39c12'
                    '#f39c12'
                    '#f39c12'
                    '#f39c12'
                    '#f39c12'
                    '#f39c12'
                    '#f39c12'
                    '#f39c12'
                ],
                borderColor: [
                    '#f39c12'
                    '#f39c12'
                    '#f39c12'
                    '#f39c12'
                    '#f39c12'
                    '#f39c12'
                    '#f39c12'
                    '#f39c12'
                ],
                borderWidth: 1
            },{
                label:'ピラミッド',
                data: gon.organizationtype2 
                backgroundColor: [
                    '#f1c40f'
                    '#f1c40f'
                    '#f1c40f'
                    '#f1c40f'
                    '#f1c40f'
                    '#f1c40f'
                    '#f1c40f'
                    '#f1c40f'
                ],
                borderColor: [
                    '#f1c40f'
                    '#f1c40f'
                    '#f1c40f'
                    '#f1c40f'
                    '#f1c40f'
                    '#f1c40f'
                    '#f1c40f'
                    '#f1c40f'
                ],
                borderWidth: 1}
            ,{
                label:'ローコンテクスト',
                data: gon.communication1 
                backgroundColor: [
                    '#1abc9c'
                    '#1abc9c'
                    '#1abc9c'
                    '#1abc9c'
                    '#1abc9c'
                    '#1abc9c'
                    '#1abc9c'
                    '#1abc9c'
                ],
                borderColor: [
                    '#1abc9c'
                    '#1abc9c'
                    '#1abc9c'
                    '#1abc9c'
                    '#1abc9c'
                    '#1abc9c'
                    '#1abc9c'
                    '#1abc9c'
                    '#1abc9c'
                ],
                borderWidth: 1
            },{
                label:'ハイコンテクスト',
                data: gon.communication2 
                backgroundColor: [
                    '#16a085'
                    '#16a085'
                    '#16a085'
                    '#16a085'
                    '#16a085'
                    '#16a085'
                    '#16a085'
                    '#16a085'
                ],
                borderColor: [
                    '#16a085'
                    '#16a085'
                    '#16a085'
                    '#16a085'
                    '#16a085'
                    '#16a085'
                    '#16a085'
                    '#16a085'
                ],
                borderWidth: 1
            },{
                label:'トップダウン型',
                data: gon.decisionmaking1 
                backgroundColor: [
                    '#e74c3c'
                    '#e74c3c'
                    '#e74c3c'
                    '#e74c3c'
                    '#e74c3c'
                    '#e74c3c'
                    '#e74c3c'
                    '#e74c3c'
                ],
                borderColor: [
                    '#e74c3c'
                    '#e74c3c'
                    '#e74c3c'
                    '#e74c3c'
                    '#e74c3c'
                    '#e74c3c'
                    '#e74c3c'
                    '#e74c3c'
                ],
                borderWidth: 1
            },{
                label:'合意形成型',
                data: gon.decisionmaking2 
                backgroundColor: [
                    '#c0392b'
                    '#c0392b'
                    '#c0392b'
                    '#c0392b'
                    '#c0392b'
                    '#c0392b'
                    '#c0392b'
                    '#c0392b'
                ],
                borderColor: [
                    '#c0392b'
                    '#c0392b'
                    '#c0392b'
                    '#c0392b'
                    '#c0392b'
                    '#c0392b'
                    '#c0392b'
                    '#c0392b'
                ],
                borderWidth: 1
            },{
                label:'自由',
                data: gon.discussion1 
                backgroundColor: [
                    '#3498db'
                    '#3498db'
                    '#3498db'
                    '#3498db'
                    '#3498db'
                    '#3498db'
                    '#3498db'
                    '#3498db'
                ],
                borderColor: [
                    '#3498db'
                    '#3498db'
                    '#3498db'
                    '#3498db'
                    '#3498db'
                    '#3498db'
                    '#3498db'
                    '#3498db'
                ],
                borderWidth: 1
            },{
                label:'制限',
                data: gon.discussion2 
                backgroundColor: [
                    '#2980b9'
                    '#2980b9'
                    '#2980b9'
                    '#2980b9'
                    '#2980b9'
                    '#2980b9'
                    '#2980b9'
                    '#2980b9'
                ],
                borderColor: [
                    '#2980b9'
                    '#2980b9'
                    '#2980b9'
                    '#2980b9'
                    '#2980b9'
                    '#2980b9'
                    '#2980b9'
                    '#2980b9'
                ],
                borderWidth: 1
            },{
                label:'衝突/本音',
                data: gon.confrontation1 
                backgroundColor: [
                    '#e67e22'
                    '#e67e22'
                    '#e67e22'
                    '#e67e22'
                    '#e67e22'
                    '#e67e22'
                    '#e67e22'
                    '#e67e22'
                ],
                borderColor: [
                    '#e67e22'
                    '#e67e22'
                    '#e67e22'
                    '#e67e22'
                    '#e67e22'
                    '#e67e22'
                    '#e67e22'
                    '#e67e22'
                ],
                borderWidth: 1
            },{
                label:'回避/建前',
                data: gon.confrontation2 
                backgroundColor: [
                    '#d35400'
                    '#d35400'
                    '#d35400'
                    '#d35400'
                    '#d35400'
                    '#d35400'
                    '#d35400'
                    '#d35400'
                ],
                borderColor: [
                    '#d35400'
                    '#d35400'
                    '#d35400'
                    '#d35400'
                    '#d35400'
                    '#d35400'
                    '#d35400'
                    '#d35400'
                ],
                borderWidth: 1
            },{
                label:'個人',
                data: gon.responsibility1 
                backgroundColor: [
                    '#2ecc71'
                    '#2ecc71'
                    '#2ecc71'
                    '#2ecc71'
                    '#2ecc71'
                    '#2ecc71'
                    '#2ecc71'
                    '#2ecc71'
                ],
                borderColor: [
                    '#2ecc71'
                    '#2ecc71'
                    '#2ecc71'
                    '#2ecc71'
                    '#2ecc71'
                    '#2ecc71'
                    '#2ecc71'
                    '#2ecc71'
                ],
                borderWidth: 1
            },{
                label:'組織',
                data: gon.responsibility2 
                backgroundColor: [
                    '#27ae60'
                    '#27ae60'
                    '#27ae60'
                    '#27ae60'
                    '#27ae60'
                    '#27ae60'
                    '#27ae60'
                    '#27ae60'
                ],
                borderColor: [
                    '#27ae60'
                    '#27ae60'
                    '#27ae60'
                    '#27ae60'
                    '#27ae60'
                    '#27ae60'
                    '#27ae60'
                    '#27ae60'
                ],
                borderWidth: 1
            },{
                label:'能力',
                data: gon.trust1 
                backgroundColor: [
                    '#95a5a6'
                    '#95a5a6'
                    '#95a5a6'
                    '#95a5a6'
                    '#95a5a6'
                    '#95a5a6'
                    '#95a5a6'
                    '#95a5a6'
                ],
                borderColor: [
                    '#95a5a6'
                    '#95a5a6'
                    '#95a5a6'
                    '#95a5a6'
                    '#95a5a6'
                    '#95a5a6'
                    '#95a5a6'
                    '#95a5a6'
                ],
                borderWidth: 1
            },{
                label:'共感',
                data: gon.trust2 
                backgroundColor: [
                    '#7f8c8d'
                    '#7f8c8d'
                    '#7f8c8d'
                    '#7f8c8d'
                    '#7f8c8d'
                    '#7f8c8d'
                    '#7f8c8d'
                    '#7f8c8d'
                ],
                borderColor: [
                    '#7f8c8d'
                    '#7f8c8d'
                    '#7f8c8d'
                    '#7f8c8d'
                    '#7f8c8d'
                    '#7f8c8d'
                    '#7f8c8d'
                    '#7f8c8d'
                ],
                borderWidth: 1
            },{
                label:'成果',
                data: gon.value1 
                backgroundColor: [
                    '#9b59b6'
                    '#9b59b6'
                    '#9b59b6'
                    '#9b59b6'
                    '#9b59b6'
                    '#9b59b6'
                    '#9b59b6'
                    '#9b59b6'
                ],
                borderColor: [
                    '#9b59b6'
                    '#9b59b6'
                    '#9b59b6'
                    '#9b59b6'
                    '#9b59b6'
                    '#9b59b6'
                    '#9b59b6'
                    '#9b59b6'
                ],
                borderWidth: 1
            },{
                label:'プロセス/型',
                data: gon.value2 
                backgroundColor: [
                    '#8e44ad'
                    '#8e44ad'
                    '#8e44ad'
                    '#8e44ad'
                    '#8e44ad'
                    '#8e44ad'
                    '#8e44ad'
                    '#8e44ad'
                ],
                borderColor: [
                    '#8e44ad'
                    '#8e44ad'
                    '#8e44ad'
                    '#8e44ad'
                    '#8e44ad'
                    '#8e44ad'
                    '#8e44ad'
                    '#8e44ad'
                ],
                borderWidth: 1
            }]
        },
        options: {
            legend: {
                display: false
            }
            tooltips: {
                enabled: false
            }
            scales: {
                xAxes: [{
                        stacked: true,
                        display: false,
                        
                }]
                yAxes: [{
                        stacked: true,
                        gridLines: {
                            display: false
                        }
                  }]
            }
            plugins: {
                datalabels: {
                    formatter: (value, context) -> context.dataset.label if context.dataset.data[context.dataIndex] isnt 0,
                    display: (context) -> return context.dataset.data[context.dataIndex] isnt 0,
                    color: 'white',
                }
            }
        }
    })
    
    ctx = document.getElementById("myChart2").getContext('2d')
    compareChart = new Chart(ctx, 
        type: 'line'
        data: 
            labels: [["ピラミッド","組織"], "ハイコンテクスト", "合意形成型", ["制限された", "議論"], ["対立回避", "建前"], "組織責任", ["共感による", "信頼構築"], ["プロセス/型", "による評価"]],
            datasets: [{
                label:gon.username,
                data: gon.selfassess,
                fill: false,
                lineTension: 0,
                pointRadius: 6,
                borderColor: '#f39c12',
                backgroundColor: '#f39c12'
            }]
        options: {
            tooltips: {
                enabled: false
            }
            legend: {
                position: 'bottom'
                labels: {
                    boxWidth: 12
                }
            }
            scales: {
                yAxes: [{
                    ticks: {
                        suggestedMax: 12
                        beginAtZero:true
                        display: true,
                        callback: (value) -> return (value / 12 * 100).toFixed(0) + '%'
                    }
                }],
                xAxes: [{
                    display: true,
                    ticks: {
                        fontSize: 8,
                        autoSkip: false
                    }
                }],
            },
            plugins: {
                datalabels: {
                    display: false
                }
            }
        }
    )
    
    i = 0
    while i < gon.assessother.length

      color = '#' + ("00000"+Math.floor(Math.random() * 0x1000000).toString(16)).substr(-6)
    
      newDataset = 
        label: gon.requesteduser[i][1]
        fill: false
        data: [
          gon.assessother[i].organizationtype
          gon.assessother[i].communication
          gon.assessother[i].decisionmaking
          gon.assessother[i].discussion
          gon.assessother[i].confrontation
          gon.assessother[i].responsibility
          gon.assessother[i].trust
          gon.assessother[i].value
        ]
        lineTension: 0
        pointRadius: 5
        borderColor: color
        backgroundColor: color
      i++
      compareChart.data.datasets.push(newDataset)
      compareChart.update()
      
    return