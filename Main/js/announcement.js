document.addEventListener('DOMContentLoaded', function () {
    const entriesSelect = document.getElementById('announcementEntries');
    const tableBody = document.getElementById('announcementTableBody');
    const pagination = document.getElementById('announcementPagination');

    if (!entriesSelect || !tableBody || !pagination) return;

    const allRows = Array.from(tableBody.querySelectorAll('tr'));
    let rowsPerPage = entriesSelect.value === 'all' ? 'all' : parseInt(entriesSelect.value) || 10;
    let currentPage = 1;

    function showPage(page) {
        if (rowsPerPage === 'all') {
            allRows.forEach(row => row.style.display = '');
            renderPagination(1, 1);
            return;
        }
        const totalPages = Math.ceil(allRows.length / rowsPerPage);
        currentPage = Math.max(1, Math.min(page, totalPages));
        const start = (currentPage - 1) * rowsPerPage;
        const end = start + rowsPerPage;
        allRows.forEach((row, index) => {
            row.style.display = (index >= start && index < end) ? '' : 'none';
        });
        renderPagination(currentPage, totalPages);
    }

    function renderPagination(currentPage, totalPages) {
        pagination.innerHTML = '';
        if (rowsPerPage === 'all' || totalPages <= 1) return;

        const createPageItem = (text, page, isDisabled = false, isActive = false) => {
            const li = document.createElement('li');
            li.className = `page-item ${isDisabled ? 'disabled' : ''} ${isActive ? 'active' : ''}`;
            const a = document.createElement('a');
            a.className = 'page-link';
            a.href = '#';
            a.innerHTML = text;
            if (!isDisabled) {
                a.addEventListener('click', (e) => {
                    e.preventDefault();
                    showPage(page);
                });
            }
            li.appendChild(a);
            return li;
        };
        
        pagination.appendChild(createPageItem('&laquo;', 1, currentPage === 1));
        pagination.appendChild(createPageItem('&lt;', currentPage - 1, currentPage === 1));
        for (let i = 1; i <= totalPages; i++) {
            pagination.appendChild(createPageItem(i, i, false, i === currentPage));
        }
        pagination.appendChild(createPageItem('&gt;', currentPage + 1, currentPage === totalPages));
        pagination.appendChild(createPageItem('&raquo;', totalPages, currentPage === totalPages));
    }

    entriesSelect.addEventListener('change', function () {
        rowsPerPage = this.value === 'all' ? 'all' : parseInt(this.value);
        showPage(1);
    });

    showPage(1); // Initialize
});