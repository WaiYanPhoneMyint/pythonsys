document.addEventListener('DOMContentLoaded', function () {
  const barChartCanvas = document.getElementById('userBarChart');
  const circleChartCanvas = document.getElementById('userCircleChart');
  const lineChartCanvas = document.getElementById('userLineChart');

  if (!barChartCanvas || !circleChartCanvas || !lineChartCanvas) return;

  // Get data from canvas data attributes
  const total = parseInt(barChartCanvas.dataset.total);
  const vip = parseInt(barChartCanvas.dataset.vip);
  const crown = parseInt(barChartCanvas.dataset.crown);
  const premium = parseInt(barChartCanvas.dataset.premium);

  const roleLabels = ['VIP', 'Crown', 'Premium'];
  const roleData = [vip, crown, premium];
  const roleColors = ['#ffc107', '#0d6efd', '#6610f2'];

  // Bar Chart
  new Chart(barChartCanvas, {
    type: 'bar',
    data: {
      labels: ['Total', ...roleLabels],
      datasets: [{
        label: 'Users',
        data: [total, ...roleData],
        backgroundColor: ['#6c757d', ...roleColors],
        borderRadius: 5
      }]
    },
    options: { responsive: true, plugins: { legend: { display: false } }, scales: { y: { beginAtZero: true } } }
  });

  // Circle Chart (Doughnut)
  new Chart(circleChartCanvas, {
    type: 'doughnut',
    data: {
      labels: roleLabels,
      datasets: [{ data: roleData, backgroundColor: roleColors, borderWidth: 1 }]
    },
    options: { responsive: true, plugins: { legend: { position: 'bottom' } } }
  });

  // Line Chart
  new Chart(lineChartCanvas, {
    type: 'line',
    data: {
      labels: roleLabels,
      datasets: [{
        label: 'Users',
        data: roleData,
        borderColor: '#6610f2',
        backgroundColor: 'rgba(102,16,242,0.2)',
        tension: 0.3,
        fill: true
      }]
    },
    options: { responsive: true, plugins: { legend: { display: false } }, scales: { y: { beginAtZero: true } } }
  });
});